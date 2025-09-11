# FlutterFlow-Supabase UI-資料對應表

> **文件版本：** v1.0  
> **建立日期：** 2025-01-15  
> **專案：** Event Platform FlutterFlow-Supabase 整合  
> **目的：** 提供完整的 UI 組件與 Supabase 資料源對應關係

## 📋 目錄

- [1. 核心頁面組件對應](#1-核心頁面組件對應)
- [2. FFAppState 變數對應](#2-ffappstate-變數對應) 
- [3. Custom Functions 轉換對應](#3-custom-functions-轉換對應)
- [4. Constants 國際化對應](#4-constants-國際化對應)
- [5. 實施策略](#5-實施策略)

---

## 1. 核心頁面組件對應

### 1.1 HomePage 首頁

**主要資料源：** v_events_list View

**頁面組件對應：**
- **ListView (事件列表)** → v_events_list.* (完整記錄集)
- **EventCard 組件：**
  - title → v_events_list.title (事件標題)
  - eventDate → v_events_list.start_date (開始日期)
  - eventTime → v_events_list.start_time (開始時間)
  - location → v_events_list.venue_name (地點名稱)
  - imageUrl → v_events_list.image_url (活動圖片)
  - priceDisplay → v_events_list.price_range_display (格式化價格)
  - categoryName → v_events_list.category_name (分類名稱)
  - isFeatured → v_events_list.is_featured (是否精選)
  - attendeeCount → v_events_list.current_attendees (當前參與人數)
  - maxAttendees → v_events_list.max_attendees (最大參與人數)

**資料載入：**
- loadEventsFromSupabase() Custom Action
- convertVEventsListToEventStruct() Custom Function 轉換資料

---

### 1.2 ExplorePage 探索頁面

**主要資料源：** categories Table + v_events_list View

**頁面組件對應：**
- **CategoryGrid (分類網格)** → categories 表記錄
  - categoryName → categories.name (分類名稱)
  - categoryIcon → categories.icon_url (分類圖示)
  - categoryColor → categories.color (分類顏色)
  - eventCount → categories.event_count (該分類事件數量)

- **篩選後事件列表** → v_events_list WHERE category_name = selectedCategory
- **熱門事件區塊** → v_events_list WHERE is_featured = true

**互動邏輯：**
- 點擊分類 → 篩選對應分類事件
- FFAppState().selectedFilters 更新篩選條件

---

### 1.3 EventDetailsPage 事件詳情頁

**主要資料源：** v_events_list View (單筆記錄)

**詳細組件對應：**
- **事件標題** → v_events_list.title
- **事件描述** → v_events_list.description  
- **活動時間** → v_events_list.start_date + start_time
- **結束時間** → v_events_list.end_date + end_time
- **地點資訊** → v_events_list.venue_name + venue_address
- **主辦方** → v_events_list.organizer_name
- **活動圖片** → v_events_list.image_url + banner_url
- **價格資訊** → v_events_list.min_price, max_price, price_range_display
- **參與統計** → v_events_list.current_attendees, max_attendees
- **可用座位** → v_events_list.available_seats
- **活動標籤** → v_events_list.tags (JSON 陣列)
- **分類顯示** → v_events_list.category_name

**操作按鈕：**
- **報名按鈕** → 導航至 EventRegistrationPage
- **收藏按鈕** → user_favorites 表 INSERT/DELETE
- **分享按鈕** → 系統分享功能

---

### 1.4 MyTicketsPage 我的票券

**主要資料源：** v_my_events View

**頁面組件對應：**
- **ListView (我的票券列表)** → v_my_events.* WHERE user_id = current_user.id
- **TicketCard 組件：**
  - title → v_my_events.title (事件標題)
  - eventDate → v_my_events.start_date (事件開始日期)
  - eventTime → v_my_events.start_time (事件開始時間)
  - location → v_my_events.venue_name (事件地點)
  - confirmationCode → v_my_events.confirmation_code (確認碼)
  - registrationStatus → v_my_events.registration_status (報名狀態)
  - paymentStatus → v_my_events.payment_status (付款狀態)
  - qrCodeData → v_my_events.registration_id (用於生成QR碼)
  - eventImage → v_my_events.image_url (事件圖片)
  - ticketType → v_my_events.ticket_type (票券類型)
  - checkedInAt → v_my_events.checked_in_at (入場時間)

**狀態篩選：**
- 未付款票券 → WHERE payment_status = 'pending'
- 已確認票券 → WHERE registration_status = 'confirmed' AND payment_status = 'paid'
- 已使用票券 → WHERE checked_in_at IS NOT NULL

---

### 1.5 ProfilePage 個人資料頁

**主要資料源：** users Table (UsersRow)

**頁面組件對應：**
- **用戶頭像 (Avatar)** → users.avatar_url (頭像圖片URL)
- **用戶姓名 (displayName)** → users.display_name (顯示名稱)
- **用戶名 (username)** → users.username (用戶名)
- **電子郵件 (email)** → users.email (電子郵件地址)
- **電話號碼 (phone)** → users.phone (聯絡電話)
- **生日 (birthday)** → users.birthday (生日日期)
- **性別 (gender)** → users.gender (性別)
- **地區 (location)** → users.location (居住地區)
- **個人簡介 (bio)** → users.bio (個人簡介)
- **偏好設定 (preferences)** → users.preferences (JSON格式偏好)
- **語言設定 (language)** → users.language (首選語言)
- **帳號創建時間** → users.created_at (註冊時間)

**AppState 對應：**
- FFAppState().currentUser → UsersRow 當前登入用戶完整資料
- FFAppState().userPreferences → users.preferences JSON 欄位
- FFAppState().selectedLanguage → users.language 欄位

---

### 1.6 FavoritesPage 收藏頁面

**主要資料源：** user_favorites Junction Table + v_events_list View (JOIN)

**頁面組件對應：**
- **收藏事件列表 (ListView)** → v_events_list (JOIN user_favorites WHERE user_id = current_user.id)
- **EventCard 組件：** (與 HomePage 相同的事件卡片組件)
  - title → v_events_list.title
  - eventDate → v_events_list.start_date
  - eventTime → v_events_list.start_time
  - location → v_events_list.venue_name
  - imageUrl → v_events_list.image_url
  - priceDisplay → v_events_list.price_range_display
  - favoriteButton → 固定為已收藏狀態

**資料來源關聯：**
- user_favorites.user_id → users.id (當前登入用戶)
- user_favorites.event_id → events.id (收藏的事件)
- user_favorites.created_at → 收藏時間排序

**AppState 同步：**
- FFAppState().favoriteEvents (List<String>) ↔ user_favorites 表記錄
- sync_user_favorites.dart Custom Action 負責雙向同步

---

### 1.7 EventRegistrationPage 事件報名頁

**主要資料源：** registrations Table + events Table + ticket_types Table

**表單欄位對應：**
- **用戶資訊區塊：**
  - 姓名輸入 → registrations.attendee_name (參與者姓名)
  - 電子郵件 → registrations.attendee_email (參與者郵箱)
  - 電話號碼 → registrations.attendee_phone (參與者電話)
  - 緊急聯絡人 → registrations.emergency_contact (緊急聯絡人)
  
- **票券選擇區塊：**
  - 票券類型選擇器 → ticket_types.* (JOIN WHERE event_id = :eventId)
  - 票券數量選擇 → registrations.ticket_selections (JSON格式)
  - 單價顯示 → ticket_types.price
  - 小計計算 → registrations.total_amount
  
- **優惠券區塊：**
  - 優惠碼輸入 → registrations.discount_code
  - 折扣金額 → registrations.discount_amount
  - 最終金額 → registrations.final_amount

**提交流程：**
1. register_for_event.dart Custom Action 處理提交
2. INSERT INTO registrations 新記錄
3. 生成 qr_code 和 confirmation_code
4. 更新 registrationStatus 為 'confirmed'

---

### 1.8 LoginPage & RegisterPage 認證頁面

**主要資料源：** Supabase Auth + users Table

### LoginPage 頁面組件對應

**表單欄位對應：**
- **電子郵件輸入** → Supabase Auth email field
- **密碼輸入** → Supabase Auth password field
- **記住我 checkbox** → 本地儲存偏好設定
- **Google 登入按鈕** → Supabase Auth Google OAuth
- **忘記密碼連結** → 導航至 ForgotPasswordPage

### RegisterPage 頁面組件對應

**表單欄位對應：**
- **姓名輸入** → users.display_name (註冊後寫入)
- **電子郵件輸入** → Supabase Auth email field
- **密碼輸入** → Supabase Auth password field
- **確認密碼** → 客戶端驗證
- **使用條款同意** → 客戶端驗證
- **Google 註冊按鈕** → Supabase Auth Google OAuth

**認證流程：**
1. handle_supabase_auth.dart Custom Action 處理認證
2. AuthChangeEvent 觸發狀態更新
3. FFAppState().setCurrentUser(user) 更新 AppState
4. 自動載入用戶資料到 users 表

---

### 1.9 SettingsPage & PreferencesPage 設定頁面

**主要資料源：** users.preferences (JSON欄位)

### SettingsPage 主頁面組件對應

**頁面導航項目：**
- **個人資料設定** → 導航至 EditProfilePage (users 表基本欄位)
- **偏好設定** → 導航至 PreferencesPage (users.preferences JSON)
- **語言選擇** → 導航至 LanguageSelectionPage (users.language)
- **關於應用** → 導航至 AboutPage (靜態頁面)

### PreferencesPage 偏好設定對應

**偏好設定項目對應：**

```json
users.preferences = {
  "notifications": {
    "push_enabled": true,           // 推播通知開關
    "email_enabled": false,         // 電子郵件通知開關
    "event_reminders": true,        // 事件提醒通知
    "promotion_updates": false      // 促銷活動通知
  },
  "display": {
    "theme": "system",              // 主題設定
    "event_display_mode": "card",   // 事件顯示模式
    "show_distance": true,          // 顯示事件距離
    "auto_refresh": false           // 自動重新整理
  },
  "privacy": {
    "profile_visibility": "public", // 個人資料可見性
    "activity_tracking": true,      // 活動追蹤同意
    "data_analytics": false         // 數據分析同意
  },
  "interests": [                    // 興趣分類
    "music", "sports", "technology", "food"
  ]
}
```

---

### 1.10 SearchPage 搜尋頁面

**主要資料源：** v_events_list View (透過動態查詢)

**搜尋功能組件對應：**

**1. 搜尋輸入框：**
- searchTextField → FFAppState().searchQuery
- 即時搜尋 → v_events_list WHERE (title ILIKE %query% OR description ILIKE %query%)

**2. AdvancedSearchFilter 進階篩選器：**
- **分類篩選器** → v_events_list.category_name = selectedCategory
- **日期篩選器** → v_events_list.start_date BETWEEN startDate AND endDate  
- **地點篩選器** → v_events_list.venue_name ILIKE %location%
- **價格篩選器** → v_events_list.min_price >= minPrice AND max_price <= maxPrice
- **距離篩選器** → calculateEventDistance() Custom Function

**3. 搜尋結果顯示：**
- **EventCard ListView** → FFAppState().filteredEvents (List<EventsStruct>)
- 與 HomePage EventCard 相同組件，展示搜尋結果
- 支援無限滾動載入 (limit/offset 分頁)

**4. 搜尋邏輯流程：**
1. loadEventsFromSupabase() Custom Action 處理查詢
2. matchesSearchCriteria() Custom Function 執行複合條件篩選
3. 更新 FFAppState().filteredEvents 顯示結果

---

### 1.11 PaymentPage 付款頁面 (未來 ECPay 整合)

**主要資料源：** payments Table + registrations Table + ECPay API

**頁面組件對應 (未來規劃)：**

**1. 訂單摘要區塊：**
- 事件名稱 → registrations.event_name (JOIN events.title)
- 票券詳情 → registrations.ticket_selections (JSON解析顯示)
- 原價金額 → registrations.total_amount
- 折扣金額 → registrations.discount_amount  
- 最終金額 → registrations.final_amount

**2. 付款方式選擇 (ECPay 綠界)：**
- 信用卡付款 → ECPay Credit Card
- ATM 轉帳 → ECPay ATM
- 超商付款 → ECPay CVS
- 線上銀行 → ECPay WebATM

**目前 MVP 替代方案：**
- 支援免費事件 (final_amount = 0)
- 線下付款選項 (payment_method = 'offline')
- 直接跳轉至 ConfirmationPage

---

### 1.12 NotificationsPage 通知頁面

**主要資料源：** v_notifications View

**頁面組件對應：**

**1. 通知列表 (ListView):**
- **NotificationCard 組件：**
  - title → v_notifications.title (通知標題)
  - message → v_notifications.message (通知內容)
  - timestamp → v_notifications.created_at (通知時間)
  - notificationType → v_notifications.type (通知類型)
  - isRead → v_notifications.is_read (已讀狀態)
  - relatedEventId → v_notifications.event_id (關聯事件ID)
  - actionUrl → v_notifications.action_url (點擊跳轉URL)

**2. 通知類型分類 (MVP 階段):**
```json
v_notifications.type 對應：
{
  "event_reminder": "事件提醒",
  "registration_success": "報名成功",
  "payment_success": "付款成功",
  "event_cancelled": "活動取消",
  "event_updated": "活動異動",
  "system_announcement": "系統公告"
}
```

**MVP 階段限制：**
- 僅支援 app 內通知顯示
- 通知由系統內部事件觸發
- Phase 2 將整合 FCM 推播功能

---

## 2. FFAppState 變數對應

### 2.1 用戶相關狀態 (user/)

```dart
FFAppState().currentUser (UsersRow?) 
↔ users 表完整記錄 (當前登入用戶)

FFAppState().userPreferences (Map) 
↔ users.preferences (JSON) 偏好設定

FFAppState().selectedLanguage (String) 
↔ users.language (String) 用戶選擇語言

FFAppState().favoriteEvents (List<String>) 
↔ user_favorites 表 event_id 列表 (WHERE user_id = currentUser.id)
```

### 2.2 事件相關狀態 (events/)

```dart
FFAppState().allEvents (List<EventsStruct>) 
↔ v_events_list View 轉換後資料 (透過 convertVEventsListToEventStruct)

FFAppState().trendingEvents (List<TrendingEventsStruct>) 
↔ v_events_list View WHERE is_featured = true

FFAppState().filteredEvents (List<EventsStruct>) 
↔ v_events_list View 動態查詢結果 (搜尋+篩選)

FFAppState().selectedEvent (EventsStruct?) 
↔ v_events_list View 單筆記錄 (當前檢視事件)

FFAppState().eventCategories (List<CategoriesStruct>) 
↔ categories 表轉換後資料 (事件分類選項)

FFAppState().isLoading (bool) 
↔ 客戶端狀態 (API 查詢載入中)
```

### 2.3 票券相關狀態 (tickets/)

```dart
FFAppState().myTickets (List<VMyEventsRow>) 
↔ v_my_events View WHERE user_id = currentUser.id

FFAppState().availableTickets (List<TicketStruct>) 
↔ ticket_types 表 WHERE event_id = selectedEvent.id

FFAppState().selectedTickets (Map<String, int>) 
↔ 臨時狀態 (報名流程中選擇的票券數量)

FFAppState().registrationStatus (String) 
↔ registrations.status (當前報名狀態)
```

### 2.4 UI 相關狀態 (ui/)

```dart
FFAppState().currentPageIndex (int) 
↔ 客戶端狀態 (底部導航目前頁面)

FFAppState().searchQuery (String) 
↔ 客戶端狀態 (搜尋關鍵字，可存至 users.preferences.search_history)

FFAppState().selectedFilters (Map) 
↔ 客戶端狀態 (搜尋篩選條件，可存至 users.preferences.last_filters)

FFAppState().showFavoriteOnly (bool) 
↔ 客戶端狀態 (是否只顯示收藏事件)

FFAppState().errorMessage (String?) 
↔ 客戶端狀態 (錯誤訊息顯示)
```

### 2.5 狀態管理方法對應

```dart
// 用戶狀態管理
FFAppState().setCurrentUser(user) → 更新 currentUser + 載入 users 資料
FFAppState().clearCurrentUser() → 清空所有用戶相關狀態
FFAppState().updateUserProfile(data) → 更新 users 表 + 同步 AppState

// 事件狀態管理  
FFAppState().updateAllEvents(events) → 更新 allEvents + isLoading = false
FFAppState().setEventsLoading(loading) → 更新 isLoading 狀態
FFAppState().setSelectedEvent(event) → 更新 selectedEvent

// 收藏狀態管理
FFAppState().addToFavorites(eventId) → INSERT user_favorites + 更新 favoriteEvents
FFAppState().removeFromFavorites(eventId) → DELETE user_favorites + 更新 favoriteEvents

// 篩選狀態管理
FFAppState().filterEvents(query, categories) → 執行 v_events_list 查詢 + 更新 filteredEvents
```

---

## 3. Custom Functions 轉換對應

### 3.1 核心資料轉換函數

**1. convertVEventsListToEventStruct()**
- **功能：** 將 Supabase v_events_list View 資料轉換為 FlutterFlow EventsStruct
- **輸入：** VEventsListRow (Supabase 原始資料)
- **輸出：** EventsStruct (FlutterFlow UI 資料結構)
- **轉換項目：** 標題、描述、日期時間、價格格式化、圖片URL等

**2. convertVMyEventsToTicketStruct()**
- **功能：** 將 v_my_events View 轉換為票券展示格式
- **關鍵轉換：** 生成QR Code、格式化確認碼、狀態本地化

**3. convertUsersRowToUserStruct()**
- **功能：** 用戶資料格式轉換
- **特殊處理：** JSON preferences 解析、收藏事件列表載入

### 3.2 國際化函數

**4. getLocalizedInterests()**
- **支援語言：** 繁中 (zh-TW)、英文 (en)
- **內容：** 12 種興趣分類的多語言對應

**5. getLocalizedLabel()**
- **功能：** UI 標籤文字國際化
- **涵蓋範圍：** 導航標籤、按鈕文字、表單標籤、錯誤訊息等

**6. getLocalizedSortOptions()**
- **內容：** 8 種排序選項的多語言支援

### 3.3 日期時間格式化函數

**7. formatEventDate()**
- **繁中格式：** "12月15日 週五"
- **英文格式：** "December 15, Friday"

**8. formatEventTime()**
- **繁中格式：** "14:30" (24小時制)
- **英文格式：** "2:30 PM" (12小時制)

### 3.4 價格格式化函數

**9. formatPriceRange()**
- **免費活動：** "免費" / "Free"
- **單一價格：** "NT$500" / "$500"
- **價格範圍：** "NT$300 - NT$800" / "$300 - $800"

### 3.5 搜尋與篩選函數

**10. matchesSearchCriteria()**
- **功能：** 複合搜尋條件匹配
- **支援：** 標題、描述、分類、日期範圍篩選

**11. calculateEventDistance()**
- **功能：** 計算事件距離 (使用 Haversine 公式)
- **輸出格式：** "1.2公里" / "1.2km"

### 3.6 輔助轉換函數

**12. parseJsonToMap()**
- **功能：** JSON 字串解析 (FlutterFlow 限制下的實作)
- **用途：** preferences、ticket_selections 等 JSON 欄位處理

**13. generateEventTag()**
- **功能：** 動態生成事件標籤
- **規則：** 精選→即將開始→熱門活動→空白

---

## 4. Constants 國際化對應

### 4.1 興趣分類 (interests)

```dart
// ❌ 原本 app_constants.dart (硬編碼英文)
static const List<String> interests = [
  '🎵 Music', '⚽ Sports', '💻 Technology', '🍕 Food'
];

// ✅ 新 Custom Function (動態多語言)
List<String> getLocalizedInterests(String language) {
  Map<String, List<String>> interestsMap = {
    'zh-TW': ['🎵 音樂', '⚽ 運動', '💻 科技', '🍕 美食'],
    'en': ['🎵 Music', '⚽ Sports', '💻 Technology', '🍕 Food']
  };
  return interestsMap[language] ?? interestsMap['zh-TW']!;
}
```

### 4.2 排序篩選器 (SortByFilter)

```dart
// ❌ 原本 app_constants.dart
static const List<String> SortByFilter = [
  'Popularity', 'Rating', 'Price: Low to High'
];

// ✅ 新 Custom Function
List<String> getLocalizedSortOptions(String language) {
  Map<String, List<String>> sortMap = {
    'zh-TW': ['人氣度', '評分', '價格：從低到高'],
    'en': ['Popularity', 'Rating', 'Price: Low to High']
  };
  return sortMap[language] ?? sortMap['zh-TW']!;
}
```

### 4.3 UI 標籤文字 (uiLabels)

**重構範圍：**
- 導航標籤：首頁、探索、我的票券、收藏、個人
- 操作按鈕：立即報名、查看詳情、加入收藏、分享活動
- 狀態文字：載入中、暫無資料、發生錯誤
- 表單標籤：活動名稱、活動日期、活動時間、活動地點
- 篩選器：篩選條件、排序方式、價格範圍、日期範圍

### 4.4 日期時間常數

**多語言支援：**
- 星期：星期一~星期日 / Monday~Sunday
- 月份：一月~十二月 / January~December
- 時間相關：今天、明天、本週、上午、下午

### 4.5 整合策略

**階段 1: Custom Functions 建立**
- 所有國際化函數支援 'zh-TW' 和 'en'
- 預設語言為 'zh-TW' (台灣市場優先)

**階段 2: UI 元件更新**
```dart
// ❌ 舊方式 (硬編碼)
Text(AppConstants.interests[0])

// ✅ 新方式 (動態國際化)
Text(getLocalizedInterests(FFAppState().selectedLanguage)[0])
```

**階段 3: 語言切換邏輯**
- 即時切換，無需重啟 app
- 偏好設定同步至 users.language

---

## 5. 實施策略

### 5.1 階段性實施計劃

**Phase 0: 技術分析與規劃階段 (1-2週)**

🔍 **系統性組件分析工作 (Component-Database Mapping Analysis)**

**工作範圍：** 以下7個目錄逐一深度分析
- `/lib/home` - 首頁相關頁面與組件
- `/lib/explore` - 探索頁面與搜尋功能組件  
- `/lib/favorites` - 收藏頁面與收藏管理組件
- `/lib/my_tickets` - 我的票券頁面與票券管理組件
- `/lib/profile` - 個人資料頁面與設定組件
- `/lib/register` - 註冊登入相關頁面組件
- `/lib/custom_calendar` - 自訂日曆組件

**每個目錄分析交付物：**

1. **詳細組件分析文件** (`docs/component-analysis/[directory_name]_analysis.md`)
   - 列出目錄下所有 `.dart` 檔案
   - 識別每個檔案中的動態欄位（非靜態文字）
   - 標記目前資料來源（FFAppState、硬編碼、mock數據等）
   - 提出對應 Supabase table/view 建議

2. **資料庫對應表** (`docs/component-analysis/[directory_name]_database_mapping.csv`)
   ```
   File,Component,Field,Current_Source,Target_Table,Target_Field,Status,Notes
   home_widget.dart,EventCard,title,FFAppState().EVENTS[i].title,v_events_list,title,✅ Match,
   home_widget.dart,EventCard,eventDate,FFAppState().EVENTS[i].date,v_events_list,start_date,⚠️ Format,需要日期格式轉換
   home_widget.dart,CategoryCard,eventCount,hardcoded,categories,event_count,❌ Missing,需要新增此欄位
   ```

3. **缺失資料庫結構 SQL 腳本** (`docs/component-analysis/[directory_name]_missing_db.sql`)
   ```sql
   -- Missing fields for [directory_name] components
   ALTER TABLE categories ADD COLUMN event_count INTEGER DEFAULT 0;
   
   -- Missing tables for [directory_name] functionality  
   CREATE TABLE user_favorites (
     id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
     user_id UUID REFERENCES users(id),
     event_id UUID REFERENCES events(id),
     created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
   );
   
   -- Missing views for [directory_name] data access
   CREATE VIEW v_user_statistics AS 
   SELECT 
     user_id,
     COUNT(DISTINCT event_id) as events_attended,
     COUNT(DISTINCT category_id) as categories_explored
   FROM registrations r 
   JOIN events e ON r.event_id = e.id 
   WHERE r.status = 'confirmed'
   GROUP BY user_id;
   ```

4. **實作優先級建議** (`docs/component-analysis/[directory_name]_priority.md`)
   - 🔴 Critical：影響核心功能的missing fields/tables
   - 🟡 Important：影響用戶體驗的enhancement fields  
   - 🟢 Nice-to-have：提升功能完整性的additional fields

**Phase 0 總交付物：**
- 7個目錄 × 4種文件 = 28個分析文件
- 1個整合 SQL 腳本檔 (`docs/complete_database_modifications.sql`)
- 1個實作路徑圖 (`docs/implementation_roadmap.md`)

**完成標準：**
- ✅ 每個動態欄位都有明確的資料庫對應
- ✅ 所有missing table/view/field 都有SQL實作
- ✅ 優先級分級協助後續開發排程
- ✅ 與現有 Supabase 結構的相容性驗證

**Phase 1: 核心資料層 (2-3週)** 
*基於 Phase 0 分析結果進行實作*
1. 執行 Phase 0 產出的資料庫修改 SQL
2. 建立所有 Custom Functions 資料轉換邏輯
3. 實作 HomePage、ExplorePage、EventDetailsPage 資料綁定
4. 完成基本 FFAppState 與 Supabase 同步
5. 建立 Constants 國際化基礎架構

**Phase 2: 用戶功能整合 (3-4週)**
5. 實作 MyTicketsPage、ProfilePage、FavoritesPage
6. 整合 Supabase Auth 認證流程
7. 完成 EventRegistrationPage 報名功能
8. 實作 SearchPage 進階篩選功能

**Phase 3: 進階功能 (2-3週)**
9. SettingsPage 偏好設定整合
10. NotificationsPage 通知系統 (app 內)
11. PaymentPage 基礎架構 (ECPay 預留)
12. 完整的多語言切換功能

### 5.2 技術重點

**資料轉換策略：**
- 所有 Supabase Views → FlutterFlow Structs 透過 Custom Functions
- 保持現有 UI 組件結構完全不變
- 實作智慧快取減少 API 呼叫

**狀態管理策略：**
- FFAppState 與 Supabase 雙向同步
- Real-time subscriptions 支援即時更新
- 離線模式支援本地快取

**國際化策略：**
- 所有硬編碼文字替換為 Custom Functions
- 語言偏好設定持久化儲存
- 系統語言自動檢測

### 5.3 品質保證

**完成標準：**
- ✅ 100% UI 組件對應明確定義
- ✅ 所有資料轉換邏輯實作完成
- ✅ 繁中/英文無縫切換
- ✅ 核心用戶流程端到端測試通過
- ✅ 效能指標符合要求 (載入時間 ≤ 3秒)

**測試重點：**
- Custom Functions 邏輯正確性
- 資料轉換準確性驗證
- 多語言顯示一致性
- AppState 同步可靠性

---

## 📊 總結

這份 UI-資料對應表提供了 FlutterFlow Event Platform 與 Supabase 整合的完整技術藍圖：

- **12個核心頁面** 的詳細組件對應
- **所有 FFAppState 變數** 與資料源映射
- **22個 Custom Functions** 轉換邏輯
- **完整的 Constants 國際化** 重構方案
- **階段性實施策略** 和品質標準

每一項對應都包含了實作所需的具體資訊，確保開發團隊可以依據此文件順利完成整合工作，同時保持零重構風險和優秀的用戶體驗。

---

> **文件維護：** 此文件應隨著專案進展持續更新，確保對應關係的準確性和完整性。  
> **版本控制：** 建議將此文件納入版本控制系統，追蹤變更歷史。