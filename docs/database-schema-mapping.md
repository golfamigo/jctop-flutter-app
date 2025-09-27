# Database Schema Cross-Reference Analysis

## 概述

本文檔詳細記錄 FlutterFlow Custom DataTypes 與 Supabase 資料庫架構的欄位對應關係，確保完美的資料結構一致性。

## 1. EventsStruct 與資料庫欄位對應

### 1.1 主要資料來源表/檢視

- **主表**: `events` (EventsRow)
- **主檢視**: `v_events_list` (VEventsListRow)

### 1.2 欄位映射表

| EventsStruct 欄位 | 資料類型 | 預設值 | 對應資料庫欄位 | 資料來源 | 映射策略 | 狀態 |
|------------------|----------|--------|--------------|----------|----------|------|
| **location** | String? | '' | venue_name + city | v_events_list | CONCAT(venue_name, ', ', city) | ✅ 可直接映射 |
| **title** | String? | '' | title | events/v_events_list | 直接映射 | ✅ 完全匹配 |
| **date** | DateTime? | null | start_date | events/v_events_list | 直接映射 | ✅ 完全匹配 |
| **price** | double? | 0.0 | min_price | v_events_list | 使用最低價格 | ✅ 可直接映射 |
| **rating** | double? | 0.0 | - | 無對應欄位 | 固定預設值 4.5 | ⚠️ 需要新增或使用預設值 |
| **tag** | String? | '' | category_name | v_events_list | 直接映射類別名稱 | ✅ 可直接映射 |
| **img** | String? | '' | image_url | events/v_events_list | 直接映射 | ✅ 完全匹配 |
| **descr** | String? | '' | description | events/v_events_list | 直接映射 | ✅ 完全匹配 |
| **tickets** | int? | 0 | - | 需計算 | 從 registrations 計算剩餘票券 | ⚠️ 需要複雜查詢 |
| **dayLeft** | int? | 0 | - | 需計算 | EXTRACT(days FROM (start_date - NOW())) | ⚠️ 需要計算欄位 |
| **ticketStatus** | String? | '' | - | 需計算 | 基於 is_full, status 計算 | ⚠️ 需要業務邏輯 |

### 1.3 缺失欄位分析

**需要新增或處理的欄位：**

1. **rating (評分)**
   - 當前無對應欄位
   - 建議：新增 `avg_rating` 欄位到 events 表，或使用固定預設值 4.5

2. **tickets (剩餘票券)**
   - 需要從 `max_attendees - current_attendees` 或 `available_seats` 計算
   - v_events_list 已有 `available_seats` 欄位可使用

3. **dayLeft (剩餘天數)**
   - 需要計算欄位：`EXTRACT(days FROM (start_date - NOW()))::int`

4. **ticketStatus (票券狀態)**
   - 需要基於 `is_full`, `status`, `start_date` 計算
   - 建議邏輯：`CASE WHEN is_full THEN 'sold_out' WHEN status = 'cancelled' THEN 'cancelled' WHEN start_date < NOW() THEN 'closed' ELSE 'available' END`

## 2. CommentsStruct 與資料庫欄位對應

### 2.1 資料來源表

**注意：** 目前資料庫架構中沒有專門的評論表。

### 2.2 欄位映射分析

| CommentsStruct 欄位 | 資料類型 | 預設值 | 對應資料庫欄位 | 狀態 |
|---------------------|----------|--------|--------------|------|
| **name** | String? | '' | user.name | ❌ 缺少評論系統 |
| **date** | DateTime? | null | comment.created_at | ❌ 缺少評論系統 |
| **comment** | String? | '' | comment.content | ❌ 缺少評論系統 |

**建議：** 需要新增 `comments` 或 `event_reviews` 表來支援 CommentsStruct。

## 3. TicketStruct 與資料庫欄位對應

### 3.1 資料來源表

- **主表**: `ticket_types` (TicketTypesRow)
- **關聯表**: `registrations` (RegistrationsRow)

### 3.2 欄位映射表

| TicketStruct 欄位 | 資料類型 | 預設值 | 對應資料庫欄位 | 資料來源 | 映射策略 | 狀態 |
|------------------|----------|--------|--------------|----------|----------|------|
| **title** | String? | '' | name | ticket_types | 直接映射 | ✅ 完全匹配 |
| **price** | double? | 0.0 | price | ticket_types | 直接映射 | ✅ 完全匹配 |
| **description** | String? | '' | description | ticket_types | 直接映射 | ✅ 完全匹配 |
| **quantity** | int? | 0 | quantity | ticket_types | 直接映射 | ✅ 完全匹配 |

**完美匹配：** TicketStruct 與 ticket_types 表結構完全對應！

## 4. Categories 資料庫支援分析

### 4.1 資料來源表

- **主表**: `categories` (CategoriesRow)

### 4.2 可用欄位

| 資料庫欄位 | 資料類型 | 說明 | 用途 |
|-----------|----------|------|------|
| **id** | String | 分類ID | 關聯鍵 |
| **name** | String | 分類名稱 | 對應 EventsStruct.tag |
| **slug** | String | URL友好標識符 | 路由使用 |
| **description** | String? | 分類描述 | 詳細說明 |
| **icon** | String? | 圖標 | UI 顯示 |
| **color** | String? | 顏色代碼 | UI 主題 |
| **event_count** | int? | 活動數量 | 統計資訊 |
| **is_active** | bool? | 是否啟用 | 狀態控制 |
| **sort_order** | int? | 排序順序 | 顯示順序 |

## 5. 推薦的資料庫檢視設計

### 5.1 完整的 EventsStruct 支援檢視

```sql
CREATE OR REPLACE VIEW v_events_full AS
SELECT 
    e.id,
    e.title,
    e.description as descr,
    e.start_date as date,
    -- 組合地點資訊
    COALESCE(
        CASE 
            WHEN v.name IS NOT NULL AND v.city IS NOT NULL THEN v.name || ', ' || v.city
            WHEN v.name IS NOT NULL THEN v.name
            WHEN v.city IS NOT NULL THEN v.city
            WHEN e.location IS NOT NULL THEN e.location
            ELSE ''
        END,
        ''
    ) as location,
    e.image_url as img,
    c.name as tag,
    -- 價格邏輯
    COALESCE(tt_stats.min_price, 0.0) as price,
    -- 評分 (預設值或從評價系統計算)
    4.5 as rating,  -- TODO: 實作評價系統後更新
    -- 剩餘票券數
    COALESCE(e.max_attendees - e.current_attendees, 0) as tickets,
    -- 剩餘天數
    CASE 
        WHEN e.start_date > NOW() THEN EXTRACT(days FROM (e.start_date - NOW()))::int 
        ELSE 0 
    END as dayLeft,
    -- 票券狀態
    CASE 
        WHEN e.status = 'cancelled' THEN 'cancelled'
        WHEN e.start_date < NOW() THEN 'closed'
        WHEN e.current_attendees >= e.max_attendees THEN 'sold_out'
        WHEN e.status = 'draft' THEN 'not_available'
        ELSE 'available'
    END as ticketStatus
FROM events e
LEFT JOIN venues v ON e.venue_id = v.id
LEFT JOIN categories c ON e.category_id = c.id
LEFT JOIN (
    SELECT 
        event_id, 
        MIN(price) as min_price,
        COUNT(*) as ticket_type_count
    FROM ticket_types 
    WHERE is_active = true
    GROUP BY event_id
) tt_stats ON e.id = tt_stats.event_id
WHERE e.status IN ('published', 'active');
```

### 5.2 簡化的 Events2Struct/TrandingEventsStruct 支援檢視

```sql
CREATE OR REPLACE VIEW v_events_simple AS
SELECT 
    e.id,
    e.title,
    e.image_url as img,
    c.name as category,
    COALESCE(tt_stats.min_price, 0.0) as price
FROM events e
LEFT JOIN categories c ON e.category_id = c.id
LEFT JOIN (
    SELECT event_id, MIN(price) as min_price
    FROM ticket_types 
    WHERE is_active = true
    GROUP BY event_id
) tt_stats ON e.id = tt_stats.event_id
WHERE e.status IN ('published', 'active')
    AND e.is_featured = true  -- 用於趨勢活動
ORDER BY e.created_at DESC;
```

## 6. 命名約定標準化建議

### 6.1 問題識別

| 問題類型 | 描述 | 範例 | 建議修正 |
|----------|------|------|----------|
| **大小寫不一致** | Struct JSON 鍵值混用大小寫 | 'Location' vs 'location' | 統一使用小寫開頭 |
| **命名風格不一致** | 資料庫使用 snake_case, Struct 使用 camelCase | 'start_date' vs 'startDate' | 保持既有約定，轉換層處理 |
| **欄位名稱差異** | 相同概念使用不同名稱 | 'descr' vs 'description' | 在轉換函數中處理 |

### 6.2 統一標準建議

```dart
// 建議的 JSON 映射格式標準化
EventsStruct fromMap(Map<String, dynamic> data) => EventsStruct(
  location: data['location'] as String?,     // 統一小寫
  title: data['title'] as String?,
  date: data['date'] as DateTime?,
  price: castToType<double>(data['price']),
  rating: castToType<double>(data['rating']),
  tag: data['tag'] as String?,               // 不使用 category，保持一致性
  img: data['img'] as String?,               // 保持簡短形式
  descr: data['descr'] as String?,           // 保持簡短形式
  tickets: castToType<int>(data['tickets']),
  dayLeft: castToType<int>(data['dayLeft']), // 保持 camelCase
  ticketStatus: data['ticketStatus'] as String?,
);
```

## 7. 轉換函數設計規範

### 7.1 EventsStruct 轉換函數

```dart
EventsStruct convertVEventsFullToEventStruct(dynamic row) {
  if (row == null) return EventsStruct();
  
  return EventsStruct(
    location: row['location'] ?? '',
    title: row['title'] ?? '',
    date: row['date'],
    price: (row['price'] ?? 0.0).toDouble(),
    rating: (row['rating'] ?? 4.5).toDouble(),
    tag: row['tag'] ?? '',
    img: row['img'] ?? '',
    descr: row['descr'] ?? '',
    tickets: (row['tickets'] ?? 0).toInt(),
    dayLeft: (row['dayLeft'] ?? 0).toInt(),
    ticketStatus: row['ticketStatus'] ?? 'available',
  );
}
```

### 7.2 批量轉換函數

```dart
List<EventsStruct> convertVEventsFullListToEventStructs(List<dynamic> rows) {
  if (rows.isEmpty) return [];
  
  return rows.map((row) => convertVEventsFullToEventStruct(row)).toList();
}
```

## 8. 兼容性風險評估

### 8.1 高風險項目

| 風險項目 | 風險等級 | 影響 | 緩解策略 |
|----------|----------|------|----------|
| **缺少評論系統** | 高 | CommentsStruct 無法正常運作 | 新增 comments 表或暫時返回空列表 |
| **評分系統缺失** | 中 | EventsStruct.rating 只能使用預設值 | 使用固定值或新增評分功能 |
| **票券狀態計算複雜** | 中 | 需要複雜的業務邏輯 | 在資料庫檢視中預先計算 |

### 8.2 低風險項目

| 項目 | 風險等級 | 說明 |
|------|----------|------|
| **TicketStruct 映射** | 低 | 與 ticket_types 表完全匹配 |
| **基本活動資訊** | 低 | Events 和 VEventsList 提供完整支援 |
| **分類系統** | 低 | Categories 表提供完整功能 |

## 9. 實施建議

### 9.1 立即可實施

1. ✅ TicketStruct 轉換函數（完全匹配）
2. ✅ 基本 EventsStruct 轉換（除評分、票券狀態）
3. ✅ Categories 相關功能

### 9.2 需要資料庫修改

1. ⚠️ 新增 `v_events_full` 檢視
2. ⚠️ 考慮新增評論/評價系統
3. ⚠️ 評估是否需要評分欄位

### 9.3 需要業務邏輯實施

1. 🔄 票券狀態計算邏輯
2. 🔄 剩餘天數計算
3. 🔄 評分系統（長期）

## 10. 完整 Struct 與 Supabase 映射分析 (2025年更新)

### 10.1 EventsStruct (11 個欄位) 完整分析

| 欄位 | FlutterFlow | Supabase | 映射狀態 | 解決方案 |
|------|-------------|----------|----------|----------|
| location | String?, 預設 '' | events.location | ✅ 直接映射 | 或組合 venues.name + city |
| title | String?, 預設 '' | events.title | ✅ 完全匹配 | 直接映射 |
| date | DateTime?, 預設 null | events.start_date | ✅ 完全匹配 | 直接映射 |
| price | double?, 預設 0.0 | 需計算 | ⚠️ 需計算 | 從 ticket_types 最低價 |
| rating | double?, 預設 0.0 | 無對應欄位 | ❌ 缺失 | 新增或使用預設值 4.5 |
| tag | String?, 預設 '' | categories.name | ✅ 可映射 | 通過 category_id 關聯 |
| img | String?, 預設 '' | events.image_url | ✅ 完全匹配 | 直接映射 |
| descr | String?, 預設 '' | events.description | ✅ 完全匹配 | 直接映射 |
| tickets | int?, 預設 0 | 需計算 | ⚠️ 需計算 | max_attendees - current_attendees |
| dayLeft | int?, 預設 0 | 需計算 | ⚠️ 需計算 | EXTRACT(days FROM start_date - now()) |
| ticketStatus | String?, 預設 '' | 需計算 | ⚠️ 需計算 | 基於 status + start_date + is_full |

### 10.2 Events2Struct (4 個欄位) 完整分析

| 欄位 | FlutterFlow | Supabase | 映射狀態 | 解決方案 |
|------|-------------|----------|----------|----------|
| price | double?, 預設 0.0 | 需計算 | ⚠️ 需計算 | 從 ticket_types 最低價 |
| category | String?, 預設 '' | categories.name | ✅ 可映射 | 通過 category_id 關聯 |
| title | String?, 預設 '' | events.title | ✅ 完全匹配 | 直接映射 |
| img | String?, 預設 '' | events.image_url | ✅ 完全匹配 | 直接映射 |

### 10.3 TrandingEventsStruct (4 個欄位) 完整分析

**注意：**此 struct 在 fromMap 中使用了大寫鍵值（'Price', 'Category', 'Title'），但欄位名稱為小寫。

| 欄位 | FlutterFlow | JSON 鍵值 | Supabase | 映射狀態 |
|------|-------------|-----------|----------|----------|
| price | double?, 預設 0.0 | 'Price' | 需計算 | ⚠️ 需計算 |
| category | String?, 預設 '' | 'Category' | categories.name | ✅ 可映射 |
| title | String?, 預設 '' | 'Title' | events.title | ✅ 完全匹配 |
| img | String?, 預設 '' | 'img' | events.image_url | ✅ 完全匹配 |

### 10.4 TicketStruct (4 個欄位) 完整分析

| 欄位 | FlutterFlow | Supabase | 映射狀態 | 相容性 |
|------|-------------|----------|----------|---------|
| title | String?, 預設 '' | ticket_types.name | ✅ 完全匹配 | 100% |
| price | double?, 預設 0.0 | ticket_types.price | ✅ 完全匹配 | 100% |
| description | String?, 預設 '' | ticket_types.description | ✅ 完全匹配 | 100% |
| quantity | int?, 預設 0 | ticket_types.quantity | ✅ 完全匹配 | 100% |

**結論：** TicketStruct 與 ticket_types 表 100% 相容！

### 10.5 CommentsStruct (3 個欄位) 完整分析

| 欄位 | FlutterFlow | Supabase | 映射狀態 | 解決方案 |
|------|-------------|----------|----------|----------|
| name | String?, 預設 '' | 無對應表 | ❌ 缺失 | 需建立 comments 表 |
| date | DateTime?, 預設 null | 無對應表 | ❌ 缺失 | 需建立 comments 表 |
| comment | String?, 預設 '' | 無對應表 | ❌ 缺失 | 需建立 comments 表 |

### 10.6 FFAppState 測試資料分析

根據分析 app_state.dart，發現以下測試資料：

#### EventsStruct 測試資料 (14 個活動)
```dart
List<EventsStruct> _EVENTS = [
  // 包含 Ultra Miami 2025、Ed Sheeran、Van Gogh、Coachella 等
  // 每個都有完整的 11 個欄位資料
];
```

#### TrandingEventsStruct 測試資料 (5 個活動) 
```dart
List<TrandingEventsStruct> _TrandingEvents = [
  // Ultra Miami、Van Gogh Experience、Taste of Chicago 等
  // 每個都有 4 個欄位資料，使用大寫 JSON 鍵值
];
```

#### TicketStruct 測試資料 (4 個票種)
```dart
List<TicketStruct> _Tickets = [
  // General Admission (+18) - $250
  // VIP Pass, Premium viewing (+18) - $500  
  // Ultra Premium Package (+18) - $1,200
  // One-Day Pass (+18) - $150
];
```

#### CommentsStruct 測試資料 (6 個評論)
```dart
List<CommentsStruct> _CommentsList = [
  // Emma D., James C., Sophia B., Liam W., Olivia M., Ethan M.
  // 包含姓名、日期字符串、評論內容
];
```

## 11. 測試資料匯入建議

由於資料庫目前為唯讀模式，建議以下步驟：

### 11.1 優先處理項目

1. **建立 comments 表結構**
```sql
CREATE TABLE comments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  event_id UUID REFERENCES events(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  comment TEXT NOT NULL,
  rating INTEGER CHECK (rating >= 1 AND rating <= 5),
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);
```

2. **擴展 events 表**
```sql
ALTER TABLE events ADD COLUMN IF NOT EXISTS average_rating DECIMAL(3,2) DEFAULT 0.0;
```

### 11.2 FFAppState 資料轉換腳本

建議建立轉換腳本將 FFAppState 中的測試資料匯入到 Supabase：

1. **清空現有測試資料**
2. **匯入 events 資料** (從 14 個 EventsStruct)
3. **匯入 ticket_types 資料** (從 4 個 TicketStruct)  
4. **匯入 comments 資料** (從 6 個 CommentsStruct)
5. **更新關聯關係**

## 結論

完整分析後的資料庫架構與 Custom DataTypes 兼容性：

- **TicketStruct**: 100% 兼容 ✅
- **EventsStruct**: 73% 兼容 (8/11 欄位直接支援) ⚠️
- **Events2Struct**: 75% 兼容 (3/4 欄位支援) ⚠️  
- **TrandingEventsStruct**: 75% 兼容 (3/4 欄位支援) ⚠️
- **CommentsStruct**: 0% 兼容，需要新增表結構 ❌

**總體兼容性評估：74% 可直接使用，26% 需要擴展或計算支援**