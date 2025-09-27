# FlutterFlow 事件平台：FlutterFlow 整合模式

> **專案類型：** Brownfield 整合  
> **架構版本：** 1.0  
> **建立日期：** 2025-01-15  

---

## 📋 目錄

- [1. 核心整合策略](#1-核心整合策略)
- [2. Custom Functions 架構](#2-custom-functions-架構)
- [3. 資料綁定模式](#3-資料綁定模式)
- [4. FlutterFlow 限制與解決方案](#4-flutterflow-限制與解決方案)

---

## 1. 核心整合策略

### 1.1 漸進式遷移模式

**雙資料源共存架構：**
```dart
// 範例：My Tickets 頁面的漸進式遷移
if (FFAppState().MyTicketsTAB == 0) {
  // 新實作：Supabase 驅動
  FutureBuilder<List<VMyEventsRow>>(
    future: VMyEventsTable().queryRows(
      queryFn: (q) => q.eqOrNull('user_id', currentUserUid)
    ),
    builder: (context, snapshot) => /* Supabase UI */
  )
} else {
  // 舊系統：FFAppState 驅動 (備援)
  Builder(
    builder: (context) {
      final events = FFAppState().EVENTS.sortedList(...);
      return /* FFAppState UI */
    }
  )
}
```

**策略優勢：**
- ✅ 零風險：不破壞現有功能
- ✅ A/B 測試：效能比較和使用者回饋
- ✅ 彈性部署：可以隨時回滾
- ✅ 平行開發：新舊系統並行運作

### 1.2 FlutterFlow 原生模式

**遵循平台限制的設計原則：**
- **FutureBuilder 優先**: 所有異步資料處理
- **Table.queryRows()**: 標準 Supabase 查詢模式
- **Custom Functions**: 純 Dart 資料轉換
- **Custom Actions**: 複雜業務邏輯處理

---

## 2. Custom Functions 架構

### 2.1 核心轉換函數

**零依賴資料轉換：**
```dart
// 核心：Supabase Row 轉 EventsStruct
EventsStruct convertVEventsListToEventStruct(VEventsListRow row) {
  if (row == null) return EventsStruct();
  
  return EventsStruct(
    title: row.title ?? '',
    descr: row.description?.length > 200 
        ? row.description!.substring(0, 200) + '...' 
        : row.description ?? '',
    date: row.startDate,
    img: row.imageUrl ?? '',
    location: formatEventLocation(row.venueName, row.city),
    price: formatEventPrice(row.minPrice, row.maxPrice),
    tag: row.categoryName ?? '',
    rating: 4.5,
  );
}

// 批量轉換（ListView 最佳化）
List<EventsStruct> convertVEventsListBatch(List<VEventsListRow> rows) {
  return rows.map((row) => convertVEventsListToEventStruct(row)).toList();
}
```

### 2.2 國際化支援函數

**資料庫驅動的多語言：**
```dart
// 替代 FFAppConstants.interests
List<String> getLocalizedInterests(String languageCode) {
  // 從 app_constants 表動態載入
  final interests = {
    'zh-TW': ['音樂', '藝術', '運動', '科技', '美食'],
    'en': ['Music', 'Art', 'Sports', 'Technology', 'Food'],
  };
  return interests[languageCode] ?? interests['zh-TW']!;
}

// 替代 FFAppConstants.SortByFilter  
List<String> getLocalizedSortOptions(String languageCode) {
  final options = {
    'zh-TW': ['最新', '最熱門', '價格低到高', '價格高到低'],
    'en': ['Latest', 'Most Popular', 'Price: Low to High', 'Price: High to Low'],
  };
  return options[languageCode] ?? options['zh-TW']!;
}
```

### 2.3 格式化輔助函數

**資料格式化和計算：**
```dart
// 事件日期格式化
String formatEventDate(DateTime? date) {
  if (date == null) return '';
  final now = DateTime.now();
  final difference = date.difference(now).inDays;
  
  if (difference == 0) return '今天';
  if (difference == 1) return '明天';
  if (difference < 7) return '${difference}天後';
  return '${date.month}/${date.day}';
}

// 價格區間顯示
String formatPriceRange(double? minPrice, double? maxPrice) {
  if (minPrice == null) return 'Free';
  if (maxPrice == null || minPrice == maxPrice) return '\$${minPrice.toInt()}';
  return '\$${minPrice.toInt()} - \$${maxPrice.toInt()}';
}

// 剩餘天數計算
int calculateDaysLeft(DateTime? eventDate) {
  if (eventDate == null) return 0;
  return eventDate.difference(DateTime.now()).inDays.clamp(0, 999);
}
```

---

## 3. 資料綁定模式

### 3.1 FlutterFlow 偏好模式

**分離參數設計（推薦）：**
```dart
// FlutterFlow 視覺編輯器友好的參數模式
MyTicketsCardWidget(
  key: Key('Key_${eventId}'),
  dataDate: EventsStruct(date: supabaseRow.startDate),
  dataLocation: EventsStruct(location: supabaseRow.city),
  dataTitle: EventsStruct(title: supabaseRow.title), 
  dataImg: EventsStruct(img: supabaseRow.imageUrl),
)
```

**視覺編輯器優勢：**
- 🎨 獨立資料綁定：每個參數可綁定不同資料源
- 🔧 條件顯示控制：基於參數的條件邏輯  
- 📱 響應式設計：個別參數的響應式控制
- 🔄 簡化遷移：從 FFAppState 到 Supabase 的平滑過渡

### 3.2 查詢模式標準化

**標準 Supabase 查詢模式：**
```dart
// 簡單查詢（FlutterFlow 偏好）
queryFn: (q) => q.eqOrNull('user_id', currentUserUid)

// 複雜查詢（進階功能）
queryFn: (q) => q
    .eqOrNull('user_id', currentUserUid)
    .gteOrNull('start_date', getCurrentTimestamp)
    .order('start_date', ascending: true)
    .limit(20)
```

### 3.3 錯誤處理標準

**統一的錯誤處理模式：**
```dart
// FutureBuilder 錯誤處理標準
FutureBuilder<List<VMyEventsRow>>(
  future: VMyEventsTable().queryRows(...),
  builder: (context, snapshot) {
    // 載入狀態
    if (!snapshot.hasData) {
      return Center(child: CircularProgressIndicator());
    }
    
    final dataList = snapshot.data!;
    
    // 空狀態
    if (dataList.isEmpty) {
      return Center(child: Text('暫無資料'));
    }
    
    // 正常資料顯示
    return ListView.separated(...);
  },
)
```

---

## 4. FlutterFlow 限制與解決方案

### 4.1 主要限制

| 限制類型 | 具體限制 | 解決方案 |
|---------|---------|---------|
| **Custom Functions** | 無法使用 import 語句 | 純 Dart 實作，避免外部依賴 |
| **頁面檔案** | 無法直接修改頁面 widget | 在視覺編輯器中進行所有更改 |
| **狀態管理** | 無法自定義生命週期 | 依賴 FutureBuilder/StreamBuilder |
| **資料庫存取** | 必須使用 Table.queryRows() | 標準化查詢模式 |

### 4.2 最佳實踐

**開發工作流程：**
1. **設計階段**: 在 FlutterFlow 視覺編輯器中設計 UI
2. **資料整合**: 透過 Custom Functions 轉換資料格式
3. **邏輯實作**: 複雜邏輯使用 Custom Actions
4. **測試驗證**: 在 FlutterFlow 預覽模式中測試
5. **部署發布**: 透過 FlutterFlow 平台部署

**程式碼組織原則：**
- ✅ **單一職責**: 每個 Custom Function 只負責一個轉換
- ✅ **純函數**: 無副作用，可預測的輸入輸出
- ✅ **錯誤處理**: 所有函數都有適當的空值和錯誤處理
- ✅ **效能考量**: 避免複雜計算，保持輕量級

### 4.3 整合檢查清單

**技術整合驗證：**
- [ ] 所有 Custom Functions 編譯無誤
- [ ] FutureBuilder 查詢正常載入資料
- [ ] 錯誤處理和空狀態顯示正確
- [ ] 多語言切換功能正常
- [ ] 效能符合目標基準（< 2秒載入時間）

**使用者體驗驗證：**
- [ ] UI 與原設計完全一致
- [ ] 所有互動功能正常運作
- [ ] 載入狀態和過場動畫流暢
- [ ] 離線狀態適當處理

---

## 🚀 實施建議

### 重要指導原則：

1. **漸進式遷移**: 從低風險頁面開始，逐步擴展
2. **充分測試**: 每個階段都進行完整的功能測試
3. **效能監控**: 密切監控應用效能和使用者體驗
4. **備援機制**: 保持舊系統作為緊急備援

這個 FlutterFlow 整合架構確保在保持現有投資的同時，成功過渡到 Supabase 後端系統。