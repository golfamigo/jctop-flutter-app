# FlutterFlow 事件平台：搜尋與效能最佳化

> **專案類型：** Brownfield 整合  
> **架構版本：** 1.0  
> **建立日期：** 2025-01-15  

---

## 📋 目錄

- [1. 搜尋架構設計](#1-搜尋架構設計)
- [2. 效能最佳化策略](#2-效能最佳化策略)  
- [3. 快取機制](#3-快取機制)
- [4. 行動端最佳化](#4-行動端最佳化)

---

## 1. 搜尋架構設計

### 1.1 全文檢索實作

**PostgreSQL GIN 索引：**
```sql
-- 多語言搜尋支援
CREATE INDEX idx_events_search_en ON events 
USING gin(to_tsvector('english', title || ' ' || description));

CREATE INDEX idx_events_search_zh ON events 
USING gin(to_tsvector('simple', title || ' ' || description));

-- 分類和日期複合索引
CREATE INDEX idx_events_category_date ON events(category_id, start_date);
```

### 1.2 搜尋查詢策略

**FlutterFlow 整合模式：**
```dart
// Custom Action: 複雜搜尋邏輯
Future<List<EventsStruct>> searchEventsAdvanced({
  String? query,
  List<String>? categories,
  DateRange? dateRange,
  PriceRange? priceRange,
}) async {
  // 使用 Supabase RPC 呼叫資料庫函數
  final response = await SupaFlow.client.rpc('search_events_optimized', {
    'search_query': query,
    'category_filter': categories,
    'date_from': dateRange?.start,
    'date_to': dateRange?.end,
    'price_min': priceRange?.min,
    'price_max': priceRange?.max,
  });
  
  return response.map((row) => 
    functions.convertSearchResultToEventStruct(row)
  ).toList();
}
```

### 1.3 搜尋資料庫函數

**最佳化搜尋 RPC：**
```sql
CREATE OR REPLACE FUNCTION search_events_optimized(
  search_query TEXT DEFAULT NULL,
  category_filter TEXT[] DEFAULT NULL,
  date_from TIMESTAMP DEFAULT NULL,
  date_to TIMESTAMP DEFAULT NULL,
  price_min DECIMAL DEFAULT NULL,
  price_max DECIMAL DEFAULT NULL,
  result_limit INTEGER DEFAULT 50
)
RETURNS TABLE(...) AS $$
BEGIN
  RETURN QUERY
  SELECT e.* FROM v_events_mobile e
  WHERE 
    (search_query IS NULL OR 
     to_tsvector('simple', e.title || ' ' || e.description) @@ plainto_tsquery(search_query))
    AND (category_filter IS NULL OR e.category_name = ANY(category_filter))
    AND (date_from IS NULL OR e.start_date >= date_from)
    AND (date_to IS NULL OR e.start_date <= date_to)
    AND (price_min IS NULL OR e.min_price >= price_min)
    AND (price_max IS NULL OR e.max_price <= price_max)
  ORDER BY 
    ts_rank(to_tsvector('simple', e.title || ' ' || e.description), 
            plainto_tsquery(search_query)) DESC,
    e.is_featured DESC,
    e.start_date ASC
  LIMIT result_limit;
END;
$$ LANGUAGE plpgsql;
```

---

## 2. 效能最佳化策略

### 2.1 查詢最佳化

**主要最佳化技術：**
- **索引策略**: GIN 全文檢索 + B-tree 複合索引
- **查詢計畫**: 使用 EXPLAIN ANALYZE 優化查詢
- **限制結果**: 預設限制 50 筆，支援分頁載入
- **計算欄位**: 在 View 中預先計算常用欄位

### 2.2 資料載入最佳化

**FlutterFlow 載入模式：**
```dart
// FutureBuilder 分頁載入
FutureBuilder<List<VEventsListRow>>(
  future: VEventsTable().queryRows(
    queryFn: (q) => q
        .order('start_date', ascending: false)
        .limit(20), // 限制每次載入數量
  ),
  builder: (context, snapshot) {
    // UI 實作
  },
)
```

### 2.3 Custom Functions 最佳化

**輕量級資料轉換：**
```dart
// 最小化資料處理邏輯
EventsStruct convertEventRowOptimized(VEventsListRow row) {
  return EventsStruct(
    title: row.title ?? '',
    descr: row.description?.substring(0, 150) ?? '', // 限制描述長度
    date: row.startDate,
    img: row.imageUrl ?? '',
    location: '${row.venueName ?? ''} - ${row.city ?? ''}',
    price: row.minPrice?.toDouble(),
    tag: row.categoryName ?? '',
  );
}
```

---

## 3. 快取機制

### 3.1 多層次快取策略

**快取層級：**
1. **FlutterFlow AppState**: 本地記憶體快取 (5-15分鐘)
2. **Supabase Edge Cache**: CDN 層快取 (30分鐘)  
3. **Database Connection Pool**: 連接池快取
4. **Image CDN**: 圖片內容快取 (24小時)

### 3.2 快取更新策略

**智慧更新機制：**
```dart
// FFAppState 快取管理
class EventCacheManager {
  static DateTime? _lastUpdate;
  static const Duration _cacheExpiry = Duration(minutes: 15);
  
  static bool get isCacheValid {
    if (_lastUpdate == null) return false;
    return DateTime.now().difference(_lastUpdate!) < _cacheExpiry;
  }
  
  static Future<void> refreshCacheIfNeeded() async {
    if (!isCacheValid) {
      await loadEventsFromSupabase();
      _lastUpdate = DateTime.now();
    }
  }
}
```

### 3.3 圖片載入最佳化

**圖片處理策略：**
- **多尺寸版本**: 縮圖 (300x200)、中圖 (600x400)、大圖 (1200x800)
- **格式最佳化**: WebP 格式優先，JPEG 後備
- **延遲載入**: ListView 中的圖片延遲載入
- **快取策略**: 本地快取常用圖片

---

## 4. 行動端最佳化

### 4.1 記憶體管理

**記憶體最佳化策略：**
- **限制清單長度**: ListView 最多顯示 100 筆
- **及時清理**: 頁面離開時清理不必要的資料
- **圖片快取**: 控制圖片快取大小上限
- **狀態管理**: 避免過度狀態保存

### 4.2 網路最佳化

**網路效能策略：**
- **批量載入**: 一次載入多筆資料減少請求次數
- **壓縮傳輸**: 啟用 gzip 壓縮
- **重試機制**: 網路失敗自動重試 3 次
- **離線支援**: 基本資料本地快取

### 4.3 UI 響應最佳化

**使用者體驗最佳化：**
- **載入狀態**: 明確的載入指示器
- **骨架屏**: ListView 載入時顯示骨架
- **錯誤處理**: 友善的錯誤提示
- **無限滾動**: 平滑的分頁載入體驗

---

## 📊 效能基準

### 4.4 效能目標

| 操作 | 目標時間 | 最大可接受時間 |
|------|----------|----------------|
| 首頁載入 | < 1.5秒 | 3秒 |
| 搜尋響應 | < 300ms | 1秒 |
| 頁面切換 | < 500ms | 1秒 |
| 圖片載入 | < 2秒 | 5秒 |

### 4.5 監控指標

**關鍵效能指標：**
- 查詢響應時間 95% < 500ms
- 記憶體使用量 < 150MB  
- CPU 使用率 < 60%
- 網路請求成功率 > 99%

這個搜尋與效能最佳化架構確保 Event Platform 在各種裝置和網路環境下都能提供優秀的使用者體驗。