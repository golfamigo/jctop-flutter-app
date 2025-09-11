# FlutterFlow-Supabase Integration Analysis & Implementation Guide

## 文件概述

本文件分析 Event 平台的 FlutterFlow UI 層與 Supabase 後端整合策略，包含資料結構映射、發現的問題，以及完整的實作路線圖。

**分析日期：** 2025-01-09  
**專案：** Event Platform FlutterFlow-Supabase Integration  
**目標：** 將模擬資料替換為實際 Supabase 後端資料

---

## 1. 專案架構概覽

### 1.1 FlutterFlow 層架構
```
lib/
├── backend/
│   ├── schema/structs/          # Custom Data Types (UI 層資料結構)
│   └── supabase/
│       └── database/tables/     # Supabase Tables & Views (後端資料結構)
├── app_state.dart              # 全域狀態管理 (目前使用模擬資料)
├── app_constants.dart          # 硬編碼常數 (需要國際化)
└── [各種 UI 組件]
```

### 1.2 關鍵整合點
- **模擬資料來源：** `app_state.dart` 中的硬編碼列表
- **UI 資料結構：** `lib/backend/schema/structs/*_struct.dart`
- **後端資料來源：** Supabase Tables + Views
- **常數管理：** `app_constants.dart` (需要多語言支援)

---

## 2. Custom Data Types 分析

### 2.1 核心資料結構

#### EventsStruct (主要事件資料)
**位置：** `lib/backend/schema/structs/events_struct.dart`
```dart
class EventsStruct {
  String? location     // 地點文字
  String? title        // 事件標題  
  String? date         // 字串格式日期 "Nov 25, 2025, 02:00 PM"
  String? price        // 字串格式價格 "From $45"
  String? rating       // 字串格式評分 "4.8"
  String? tag          // 標籤 "Bestseller"/"New"
  String? img          // 圖片 URL
  String? descr        // 描述
}
```

#### TicketStruct (票券資料)
**位置：** `lib/backend/schema/structs/ticket_struct.dart`
```dart
class TicketStruct {
  String? title        // 票券名稱
  String? price        // 字串價格 "$250"
  String? description  // 描述
  int? quantity        // 數量
}
```

#### CategoriesStruct (分類資料)
**位置：** `lib/backend/schema/structs/categories_struct.dart`
```dart
class CategoriesStruct {
  String? title        // 分類名稱
  String? img          // 圖示 URL
  String? descr        // 描述
}
```

#### 其他輔助結構
- **TrandingEventsStruct：** 熱門事件 (簡化版 EventsStruct)
- **CommentsStruct：** 評論資料
- **OrganizatorsStruct：** 主辦方資料
- **CollectionsStruct：** 事件集合
- **FaqStruct：** FAQ 資料

### 2.2 模擬資料分佈

**app_state.dart 中的硬編碼資料：**
- `_EVENTS` (309-337 行): 15 個模擬事件
- `_TrandingEvents` (269-280 行): 5 個熱門事件
- `_categories` (175-204 行): 14 個事件分類
- `_Tickets` (480-489 行): 4 種票券類型
- `_CommentsList` (426-439 行): 6 個模擬評論
- `_faqList` (34-55 行): 10 個 FAQ 項目

---

## 3. Supabase 後端架構分析

### 3.1 核心資料表

#### events
```sql
events {
  id: String (PK)
  organizer_id: String? (FK → users.id)
  category_id: String? (FK → categories.id) 
  venue_id: String? (FK → venues.id)
  title: String (Required)
  description: String?
  start_date: DateTime (Required)
  end_date: DateTime (Required)
  location: String?
  status: String?
  image_url: String?
  banner_url: String?
  max_attendees: int?
  current_attendees: int?
  tags: List<String>
  is_featured: bool?
  created_at: DateTime?
  updated_at: DateTime?
}
```

#### registrations (報名記錄)
```sql
registrations {
  id: String (PK)
  user_id: String? (FK → users.id)
  event_id: String? (FK → events.id)
  status: String?
  payment_status: String?
  total_amount: double?
  discount_amount: double?
  final_amount: double?
  qr_code: String?
  ticket_selections: dynamic (JSON)
  custom_field_values: dynamic (JSON)
  checked_in_at: DateTime?
  confirmation_code: String?
  notes: String?
  created_at: DateTime?
  updated_at: DateTime?
}
```

#### ticket_types (票券類型)
```sql
ticket_types {
  id: String (PK)
  event_id: String? (FK → events.id)
  name: String (Required)
  description: String?
  price: double?
  quantity: int (Required)
  sold_count: int?
  color: String?
  icon: String?
  display_order: int?
  is_active: bool?
  max_per_user: int?
  created_at: DateTime?
  updated_at: DateTime?
}
```

### 3.2 現有 Views (重要發現！)

#### v_events_list ⭐ 
**位置：** `lib/backend/supabase/database/tables/v_events_list.dart`

**極佳匹配度！** 已包含事件列表所需的所有資料：
```dart
VEventsListRow {
  // 基本事件資訊
  String? id, title, description
  DateTime? startDate, endDate
  String? status, imageUrl
  bool? isFeatured
  
  // 地點資訊
  String? venueName, venueAddress, city
  int? venueCapacity
  
  // 主辦方資訊  
  String? organizerName, organizerEmail
  
  // 分類資訊
  String? categoryName, categoryIcon, categoryColor
  
  // 價格資訊 (已格式化!)
  double? minPrice, maxPrice
  String? priceRangeDisplay  // "From $45" 格式
  
  // 統計資訊
  int? attendeeCount, availableSeats
  bool? isFull
}
```

#### v_my_events ⭐
**位置：** `lib/backend/supabase/database/tables/v_my_events.dart`

完美支援票券管理功能：
```dart
VMyEventsRow {
  // 報名資訊
  String? registrationId, confirmationCode
  String? registrationStatus, paymentStatus
  DateTime? registeredAt, checkedInAt
  
  // 事件資訊
  String? eventId, title, description
  DateTime? startDate, endDate
  String? imageUrl, venueName, venueAddress
  
  // 付款資訊
  String? paymentId
  double? paymentAmount
  
  // 票券詳情 (JSON)
  dynamic? tickets
  
  // 格式化資料
  String? eventTiming        // 已格式化時間
  String? attendanceStatus   // 出席狀態
}
```

#### v_event_stats
主辦方分析資料 (營收、報名數、入場率等)

#### v_notifications  
通知系統 (包含事件相關通知)

#### v_user_roles
用戶角色管理 (主辦方/參與者)

---

## 4. 資料結構映射分析

### 4.1 高度匹配 ✅

**CategoriesStruct ↔ CategoriesRow**
- 完美匹配，無需調整

**TicketStruct ↔ TicketTypesRow**  
- 基本匹配，只需價格格式轉換 (double → String)

### 4.2 需要適配器 🔄

**EventsStruct ↔ VEventsListRow**
```dart
// 映射策略
EventsStruct fromVEventsListRow(VEventsListRow row) {
  return EventsStruct(
    title: row.title,                              // ✅ 直接映射
    img: row.imageUrl,                             // ✅ 直接映射  
    descr: row.description,                        // ✅ 直接映射
    location: row.venueAddress ?? row.city,        // ✅ 組合地點
    price: row.priceRangeDisplay ?? 'Free',        // ✅ 已格式化
    date: formatDate(row.startDate),               // 🔄 需要格式轉換
    rating: calculateRating(row.id),               // 🔄 需要查詢評分
    tag: getEventTag(row.isFeatured, row.createdAt) // 🔄 需要邏輯判斷
  );
}
```

### 4.3 缺失的資料 ❌

**評分系統：**
- EventsStruct 需要 `rating` 欄位
- 目前沒有 event_reviews 表格或相關 View
- 需要建立評分/評論系統

**評論系統：**
- CommentsStruct 資料目前只在 app_state.dart 模擬
- 需要建立實際的評論表格和 View

---

## 5. 發現的問題與缺失

### 5.1 硬編碼資料問題

**app_constants.dart 多語言問題：**
```dart
// 問題：硬編碼英文文字，無法支援多語言
static const List<String> interests = [
  '🎵 Music', '⚽ Sports', '💻 Technology', // ...
];

static const List<String> SortByFilter = [
  'Popularity', 'Rating', 'Price: Low to High', // ...
];
```

**解決方案：** 使用 FlutterFlow Custom Functions + i18n

### 5.2 缺失的資料庫結構

**1. 評分/評論系統**
```sql
-- 需要建立
CREATE TABLE event_reviews (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  event_id UUID REFERENCES events(id),
  user_id UUID REFERENCES users(id), 
  rating INTEGER CHECK (rating >= 1 AND rating <= 5),
  comment TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- 對應的 View
CREATE VIEW v_event_ratings AS
SELECT 
  event_id,
  ROUND(AVG(rating), 1)::text as avg_rating,
  COUNT(*) as review_count
FROM event_reviews 
GROUP BY event_id;
```

**2. 事件集合系統**
```sql
-- 需要建立 
CREATE TABLE event_collections (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  description TEXT,
  image_url TEXT,
  is_active BOOLEAN DEFAULT true
);

CREATE TABLE event_collection_items (
  collection_id UUID REFERENCES event_collections(id),
  event_id UUID REFERENCES events(id),
  PRIMARY KEY (collection_id, event_id)
);
```

**3. FAQ 系統**
- 目前只有硬編碼資料
- 建議建立 faqs 表格支援動態管理

### 5.3 格式轉換需求

**日期格式：**
- FlutterFlow: "Nov 25, 2025, 02:00 PM" (String)
- Supabase: DateTime 物件
- 需要：`DateFormat` 轉換函式

**價格格式：**
- FlutterFlow: "From $45" (String)  
- Supabase: 45.0 (double)
- 需要：價格格式化邏輯

**標籤邏輯：**
- FlutterFlow: "Bestseller"/"New"/"" (String)
- Supabase: is_featured (bool) + created_at (DateTime)
- 需要：標籤生成邏輯

---

## 6. 實作策略與路線圖

### 6.1 階段劃分

#### 階段 1: 資料適配器建立 (3-5 天)
**目標：** 建立 Custom Data Types 與 Supabase Views 的轉換層

**工作項目：**
1. 建立 `DataAdapters` 類別
   ```dart
   // lib/backend/adapters/data_adapters.dart
   class EventsAdapter {
     static EventsStruct fromVEventsListRow(VEventsListRow row) { ... }
     static TrandingEventsStruct fromVEventsListRowToTrending(VEventsListRow row) { ... }
   }
   
   class TicketsAdapter {
     static TicketStruct fromTicketTypesRow(TicketTypesRow row) { ... }
   }
   ```

2. 實作格式轉換函式
   ```dart
   class FormatUtils {
     static String formatEventDate(DateTime? date) { ... }
     static String formatPrice(double? minPrice, double? maxPrice) { ... }
     static String getEventTag(bool? isFeatured, DateTime? createdAt) { ... }
   }
   ```

3. 單元測試驗證轉換正確性

#### 階段 2: Constants 國際化 (2-3 天)  
**目標：** 解決硬編碼文字的多語言問題

**工作項目：**
1. 建立 FlutterFlow Custom Functions
   ```dart
   List<String> getLocalizedInterests(String locale) { ... }
   List<String> getLocalizedSortOptions(String locale) { ... }
   ```

2. 建立 i18n 資料結構
3. 更新 UI 組件使用 Custom Functions

#### 階段 3: 資料來源切換 (3-4 天)
**目標：** 將 app_state.dart 模擬資料替換為 Supabase 查詢

**工作項目：**
1. 更新 FFAppState 方法
   ```dart
   Future<void> loadEvents() async {
     final response = await SupaFlow.client
         .from('v_events_list')
         .select()
         .order('created_at', ascending: false);
     
     _EVENTS = response.map((row) => 
         EventsAdapter.fromVEventsListRow(VEventsListRow(row))
     ).toList();
     
     notifyListeners();
   }
   ```

2. 實作快取策略
3. 錯誤處理和 fallback 機制
4. 效能優化

#### 階段 4: 缺失功能補強 (2-3 週)
**目標：** 建立評分、評論等缺失的功能

**工作項目：**
1. 建立評分/評論資料表和 Views
2. 實作評論功能 UI 整合
3. 建立事件集合管理
4. FAQ 系統資料庫化

#### 階段 5: ECPay 付款整合 (最後階段)
**目標：** 整合綠界科技付款系統

### 6.2 優先順序

**🔥 高優先級 (立即開始):**
1. EventsStruct ↔ VEventsListRow 適配器
2. 基本資料載入測試
3. Constants 國際化

**⚠️ 中優先級 (第 2-3 週):**
1. 票券系統整合
2. 用戶狀態管理
3. 評分系統建立

**📋 低優先級 (後期):**
1. 進階分析功能
2. 效能優化
3. ECPay 整合

### 6.3 風險評估

**低風險：**
- ✅ Views 架構已完善
- ✅ 大部分資料結構已對應
- ✅ FlutterFlow UI 無需大幅更改

**中等風險：**
- 🔄 日期/價格格式轉換的效能影響
- 🔄 即時資料更新的狀態管理
- 🔄 多語言 Custom Functions 的複雜度

**高風險：**
- ❌ 評分系統的從零建立
- ❌ 大量模擬資料的一次性遷移
- ❌ 用戶體驗中斷的風險

---

## 7. 技術規範與約定

### 7.1 檔案組織
```
lib/backend/
├── adapters/           # 新增：資料轉換層
│   ├── data_adapters.dart
│   └── format_utils.dart
├── schema/structs/     # 現有：保持不變
└── supabase/          # 現有：可能新增 Views
```

### 7.2 命名約定
- **Adapter 類別：** `[DataType]Adapter` (e.g., `EventsAdapter`)
- **轉換方法：** `from[SourceType]` (e.g., `fromVEventsListRow`)
- **Custom Functions：** `getLocalized[Type]` (e.g., `getLocalizedInterests`)

### 7.3 錯誤處理策略
- **資料載入失敗：** 顯示快取資料或預設訊息
- **格式轉換錯誤：** 提供預設值
- **網路問題：** 優雅降級到離線模式

---

## 8. 測試策略

### 8.1 單元測試
- 所有 Adapter 方法
- 格式轉換函式
- Custom Functions

### 8.2 整合測試  
- Supabase 查詢正確性
- UI 資料綁定
- 狀態管理

### 8.3 效能測試
- 大量事件載入
- 即時資料更新
- 記憶體使用量

---

## 9. 後續維護建議

### 9.1 監控指標
- API 回應時間
- 資料同步準確率  
- 用戶介面載入速度
- 錯誤發生頻率

### 9.2 優化機會
- 資料預載入策略
- 圖片載入優化
- 快取機制改善
- 批次查詢最佳化

---

## 10. 總結

**✅ 優勢：**
- Supabase Views 架構完善，減少 90% 整合工作
- FlutterFlow UI 可完全保持，風險極低
- 大部分資料結構已有良好對應關係

**🔄 挑戰：**
- 格式轉換需要細心處理
- 多語言支援需要 Custom Functions 重構
- 部分功能（評分系統）需要從零建立

**📈 建議：**
- 優先使用現有 Views，最小化資料庫更改
- 採用漸進式遷移，降低風險
- 建立完整的測試覆蓋
- 保持良好的文件記錄

這個整合專案的成功率很高，因為您已經建立了非常完善的 Supabase Views 架構。主要工作是建立適配層和處理格式轉換，這些都是相對簡單且風險可控的任務。

---

**文件版本：** v1.0  
**最後更新：** 2025-01-09  
**建立者：** Business Analyst (Mary)  
**審核狀態：** 待 Project Manager 審核