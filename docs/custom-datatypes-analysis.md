# Custom DataTypes 兼容性分析

## 概述

本文檔記錄了 FlutterFlow 專案中所有現有的 Custom DataTypes (Structs)，並提供與新 Supabase 資料庫架構的兼容性分析。

## 1. EventsStruct 分析

**檔案位置：** `lib/backend/schema/structs/events_struct.dart`

### 欄位定義

| 欄位名 | 資料類型 | 預設值 | 說明 | 是否必填 |
|--------|----------|--------|------|----------|
| location | String? | '' | 活動地點 | 否 |
| title | String? | '' | 活動標題 | 否 |
| date | DateTime? | null | 活動日期時間 | 否 |
| price | double? | 0.0 | 活動價格 | 否 |
| rating | double? | 0.0 | 活動評分 | 否 |
| tag | String? | '' | 活動標籤/類別 | 否 |
| img | String? | '' | 活動圖片 URL | 否 |
| descr | String? | '' | 活動描述 | 否 |
| tickets | int? | 0 | 票券數量 | 否 |
| dayLeft | int? | 0 | 剩餘天數 | 否 |
| ticketStatus | String? | '' | 票券狀態 | 否 |

### 關鍵特性

- 繼承自 BaseStruct
- 所有欄位都可為 null
- 提供預設值以避免 null 值
- 包含 increment 方法：price、rating、tickets、dayLeft
- 支援序列化/反序列化
- 使用 FlutterFlow 標準 ParamType

### JSON 映射格式

```dart
// fromMap 格式
{
  'Location': String?,
  'Title': String?,
  'Date': DateTime?,
  'Price': double?,
  'Rating': double?,
  'Tag': String?,
  'img': String?,
  'descr': String?,
  'tickets': int?,
  'dayLeft': int?,
  'ticketStatus': String?
}
```

## 2. CommentsStruct 分析

**檔案位置：** `lib/backend/schema/structs/comments_struct.dart`

### 欄位定義

| 欄位名 | 資料類型 | 預設值 | 說明 | 是否必填 |
|--------|----------|--------|------|----------|
| name | String? | '' | 評論者姓名 | 否 |
| date | DateTime? | null | 評論時間 | 否 |
| comment | String? | '' | 評論內容 | 否 |

### 關鍵特性

- 簡單的三欄位結構
- 所有欄位都可為 null
- 無 increment 方法
- 標準的 FlutterFlow Struct 實作

### JSON 映射格式

```dart
// fromMap 格式
{
  'name': String?,
  'date': DateTime?,
  'comment': String?
}
```

## 3. TicketStruct 分析

**檔案位置：** `lib/backend/schema/structs/ticket_struct.dart`

### 欄位定義

| 欄位名 | 資料類型 | 預設值 | 說明 | 是否必填 |
|--------|----------|--------|------|----------|
| title | String? | '' | 票券標題 | 否 |
| price | double? | 0.0 | 票券價格 | 否 |
| description | String? | '' | 票券描述 | 否 |
| quantity | int? | 0 | 票券數量 | 否 |

### 關鍵特性

- 票券相關的基本資訊結構
- 包含 increment 方法：price、quantity
- 所有欄位都可為 null
- 標準的 FlutterFlow Struct 實作

### JSON 映射格式

```dart
// fromMap 格式
{
  'title': String?,
  'price': double?,
  'description': String?,
  'quantity': int?
}
```

## 4. Events2Struct 分析

**檔案位置：** `lib/backend/schema/structs/events2_struct.dart`

### 欄位定義

| 欄位名 | 資料類型 | 預設值 | 說明 | 是否必填 |
|--------|----------|--------|------|----------|
| price | double? | 0.0 | 活動價格 | 否 |
| category | String? | '' | 活動類別 | 否 |
| title | String? | '' | 活動標題 | 否 |
| img | String? | '' | 活動圖片 URL | 否 |

### 與 EventsStruct 的主要差異

- **簡化版本**：只保留 4 個核心欄位
- **缺少欄位**：location, date, rating, descr, tickets, dayLeft, ticketStatus
- **重新命名**：tag → category
- **用途不同**：可能用於簡化的活動列表顯示

### JSON 映射格式

```dart
// fromMap 格式
{
  'price': double?,
  'category': String?,
  'title': String?,
  'img': String?
}
```

## 5. TrandingEventsStruct 分析

**檔案位置：** `lib/backend/schema/structs/tranding_events_struct.dart`

### 欄位定義

| 欄位名 | 資料類型 | 預設值 | 說明 | 是否必填 |
|--------|----------|--------|------|----------|
| price | double? | 0.0 | 活動價格 | 否 |
| category | String? | '' | 活動類別 | 否 |
| title | String? | '' | 活動標題 | 否 |
| img | String? | '' | 活動圖片 URL | 否 |

### 與其他 Struct 的比較

- **與 Events2Struct 相同**：欄位完全一致
- **JSON 鍵值大小寫不同**：使用大寫開頭（'Price', 'Category', 'Title'）
- **用途推測**：專用於趨勢/熱門活動顯示

### JSON 映射格式

```dart
// fromMap 格式 - 注意大寫開頭
{
  'Price': double?,
  'Category': String?,
  'Title': String?,
  'img': String?  // 注意：img 保持小寫
}
```

## 兼容性風險評估

### 1. 命名約定不一致

**問題：**
- EventsStruct: 'Location', 'Title', 'Date', 'Price' (大寫開頭)
- CommentsStruct: 'name', 'date', 'comment' (小寫開頭)
- Events2Struct: 'price', 'category', 'title' (小寫開頭)
- TrandingEventsStruct: 'Price', 'Category', 'Title' (大寫開頭)

**風險等級：** 中等

**建議：** 統一命名約定，建議使用小寫開頭的駝峰命名法

### 2. 數據類型兼容性

**潛在問題：**
- DateTime 序列化/反序列化
- double 精度處理
- String 長度限制

**風險等級：** 低

### 3. 結構重複性

**問題：**
- Events2Struct 和 TrandingEventsStruct 功能重疊
- 可能造成維護困難和資料不一致

**風險等級：** 中等

**建議：** 考慮合併或明確區分使用場景

## Supabase 整合建議

### 1. 資料庫檢視設計

建議建立以下檢視以支援現有 Struct：

```sql
-- 支援 EventsStruct 的完整檢視
CREATE VIEW v_events_full AS
SELECT 
    e.id,
    e.title,
    e.description as descr,
    e.start_date as date,
    COALESCE(e.venue_name || ', ' || e.city, e.venue_name, e.city, '') as location,
    e.image_url as img,
    c.name as tag,
    COALESCE(tt.min_price, 0.0) as price,
    4.5 as rating,  -- 預設評分
    0 as tickets,   -- 需要從註冊表計算
    CASE 
        WHEN e.start_date > NOW() THEN EXTRACT(days FROM (e.start_date - NOW()))::int 
        ELSE 0 
    END as dayLeft,
    'available' as ticketStatus  -- 預設狀態
FROM events e
LEFT JOIN categories c ON e.category_id = c.id
LEFT JOIN (
    SELECT event_id, MIN(price) as min_price 
    FROM ticket_types 
    GROUP BY event_id
) tt ON e.id = tt.event_id;
```

### 2. 轉換函數設計

```dart
// EventsStruct 轉換函數
EventsStruct convertVEventsFullToEventStruct(dynamic row) {
  if (row == null) return EventsStruct();
  
  return EventsStruct(
    title: row['title'] ?? '',
    descr: row['descr'] ?? '',
    date: row['date'],
    location: row['location'] ?? '',
    img: row['img'] ?? '',
    tag: row['tag'] ?? '',
    price: (row['price'] ?? 0.0).toDouble(),
    rating: (row['rating'] ?? 4.5).toDouble(),
    tickets: (row['tickets'] ?? 0).toInt(),
    dayLeft: (row['dayLeft'] ?? 0).toInt(),
    ticketStatus: row['ticketStatus'] ?? '',
  );
}
```

### 3. FlutterFlow 整合要求

- 確保所有轉換函數都是純 Dart 函數（無 import）
- 使用 dynamic 參數類型讓 FlutterFlow 處理 JSON 解析
- 提供適當的空值處理
- 支援批量轉換以優化 ListView 效能

## 結論

現有的 Custom DataTypes 架構基本上與 Supabase 整合相容，但需要注意：

1. **命名約定標準化**是最重要的改進
2. **重複結構整合**可以提高維護性
3. **適當的轉換函數**將確保無縫資料遷移
4. **資料庫檢視設計**需要仔細考慮效能和完整性

建議按照 Task 2-5 的順序逐步實施這些改進。