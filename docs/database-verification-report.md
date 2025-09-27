# 📊 Supabase 資料庫實際驗證報告

## ❌ 重要更正：EventsStruct 映射分析

### events 表實際欄位 vs EventsStruct 需求

| EventsStruct 欄位 | 需要類型 | events 表實際狀況 | 映射狀態 |
|------------------|----------|------------------|----------|
| location | String | ✅ 直接存在 | ✅ 完全匹配 |
| title | String | ✅ 直接存在 | ✅ 完全匹配 |
| date | DateTime | ⚠️ 映射到 start_date | ✅ 可映射 |
| descr | String | ⚠️ 映射到 description | ✅ 可映射 |
| img | String | ⚠️ 映射到 image_url | ✅ 可映射 |
| rating | double | ⚠️ 映射到 average_rating | ✅ 可映射 |
| **price** | double | **❌ 不存在** | **❌ 需要計算** |
| **tickets** | int | **❌ 不存在** | **❌ 需要計算** |
| **dayLeft** | int | **❌ 不存在** | **❌ 需要計算** |
| **ticketStatus** | String | **❌ 不存在** | **❌ 需要計算** |
| **tag** | String | **❌ 不存在** | **❌ 需要計算** |

### 🔴 關鍵發現

**events 表中完全不存在以下欄位：**
- `price` - 必須從 ticket_types 表計算最低價
- `tickets` - 必須計算 (max_attendees - current_attendees) 或從 ticket_types 計算剩餘數量
- `dayLeft` - 必須計算 EXTRACT(days FROM start_date - now())
- `ticketStatus` - 必須根據多個條件計算狀態
- `tag` - 必須從 categories 表關聯或根據條件生成

### ✅ 解決方案：v_events_complete 視圖

視圖 `v_events_complete` **確實包含所有計算欄位**：

```sql
-- v_events_complete 視圖提供的計算欄位
- price: 計算為 "From $X" 或 "Free Entry"
- tickets: 計算剩餘票數
- dayLeft: 計算剩餘天數
- ticketStatus: 複雜狀態邏輯（cancelled/closed/sold_out/limited/available）
- tag: 動態標籤（Bestseller/New/Limited Time）
```

## 📋 其他 Struct 映射實際狀況

### ✅ 100% 完美映射
| Struct | 對應表 | 狀態 |
|--------|--------|------|
| TicketStruct | ticket_types | ✅ 所有欄位完全匹配 |
| CategoriesStruct | categories | ✅ 所有欄位存在 |
| ArticlesStruct | articles | ✅ 所有欄位存在 |
| CollectionsStruct | collections | ✅ 所有欄位存在 |
| FaqStruct | faqs | ✅ 所有欄位存在 |

### ⚠️ 需要欄位映射
| Struct | 對應表 | 映射情況 |
|--------|--------|----------|
| CommentsStruct | comments | date → created_at |
| OrganizatorsStruct | users | 需要 is_organizer=true 篩選 |

### ❌ 缺少資料
| Struct | 狀況 | 解決方案 |
|--------|------|----------|
| LanguagesStruct | app_constants 表無資料 | 需要插入語言選項 |
| CalendarDayStruct | 純 UI 元件 | 不需要資料庫支援 |

## 🎯 關鍵結論

### 1. **EventsStruct 的真實情況**
- **55%** 欄位可直接或映射取得 (6/11)
- **45%** 欄位必須透過計算取得 (5/11)
- **解決方案已存在**: `v_events_complete` 視圖

### 2. **整體完成度評估**
| 類別 | 完成度 | 說明 |
|------|--------|------|
| 資料表結構 | 95% | 所有必要表都已建立 |
| 直接映射欄位 | 60% | 部分欄位需要計算 |
| 視圖支援 | 100% | 所有計算欄位都有視圖支援 |
| 測試資料 | 90% | 大部分表有測試資料 |

### 3. **必要行動**
1. ✅ **使用視圖而非直接查詢表**
   - EventsStruct → v_events_complete
   - Events2Struct → v_events_simple
   - TrandingEventsStruct → v_trending_events

2. ⚠️ **注意事項**
   - 不要直接從 events 表讀取資料給 EventsStruct
   - 計算欄位會影響查詢效能
   - 需要維護視圖邏輯的一致性

3. 🔧 **待補充**
   - app_constants 表插入語言資料
   - 部分活動缺少 ticket_types 資料

## 📊 實際資料統計

| 表/視圖 | 記錄數 | 關鍵欄位狀態 |
|---------|--------|-------------|
| events | 14 | 缺少 5 個計算欄位 |
| v_events_complete | 14 | ✅ 所有欄位完整 |
| ticket_types | 4 | ✅ 完整 |
| categories | 8 | ✅ 完整 |
| users (organizers) | 7 | ✅ 有 follower_count, is_organizer |
| comments | 6 | ✅ 完整 |
| articles | 3 | ✅ 完整 |
| collections | 3 | ✅ 完整 |
| faqs | 10 | ✅ 完整 |

## ⚠️ 重要提醒

**絕對不要假設 events 表有 price, tickets, dayLeft, ticketStatus, tag 欄位！**

這些都是計算欄位，只存在於視圖中，不是實體欄位。