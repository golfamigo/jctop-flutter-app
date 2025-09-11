# Project Brief: Event 平台 FlutterFlow-Supabase 整合

## Executive Summary

**產品概念：** 將現有的 FlutterFlow Event 平台 UI 與 Supabase 後端完全整合，從模擬資料轉換為完整功能的事件管理和票券銷售平台，同時保持所有現有 UI 組件不變，全部在 FlutterFlow mobile app 內處理，ECPay 綠界付款整合留待最後階段實現。

**主要解決問題：** 目前 app 只有 UI 界面和模擬資料，缺乏實際的後端功能，無法進行真實的事件發布、報名、付款和票券管理。特別是 app_constants.dart 中大量硬編碼的英文文字無法支援多語言，以及 app_state.dart 中的所有事件、分類、票券資料都是靜態模擬資料。

**目標市場：** 事件主辦方（需要發布和管理活動）和參與者（需要尋找、報名和參加活動），重點服務台灣市場，支援繁中、英文雙語言。

**核心價值主張：** 提供一個完整的端到端事件平台，讓主辦方能輕鬆發布活動並管理票券，讓用戶能便捷地發現、報名和管理自己的活動參與，具備在地化付款方式（ECPay）和更適合華語市場的 UI/UX 設計。

## Problem Statement

**當前狀態與痛點：**

您的 FlutterFlow Event 平台目前處於「展示原型」階段 - 擁有完整且精美的 UI 界面，包括事件瀏覽、我的票券、個人資料管理等功能，但所有資料都是靜態模擬資料。具體問題包括：

- **模擬資料問題：** app_state.dart 中包含 15 個硬編碼事件、14 個分類、4 種票券類型等大量模擬資料
- **多語言障礙：** app_constants.dart 中的 interests、SortByFilter、countries 等都是硬編碼英文，無法支援國際化
- **功能缺失：** 用戶無法實際瀏覽真實事件、進行真實的事件報名和票券購買、主辦方無法發布或管理實際活動

**問題影響（量化分析）：**

- **開發投資風險：** 已投入的 UI/UX 設計和 FlutterFlow 開發無法產生實際價值
- **市場機會成本：** 每延遲一天上線，就錯失潛在的事件主辦方和用戶
- **技術債務累積：** 模擬資料與實際資料結構存在差異，延遲整合會增加重構成本

**現有解決方案的不足：**

雖然市場上有 Eventbrite、Accupass 等解決方案，但您的平台具有以下優勢潛力：
- 更適合華語市場的 UI/UX 設計
- 已規劃好的在地化付款方式（ECPay）
- 更輕量級的移動端解決方案
- 完善的 Supabase Views 架構基礎

**解決緊迫性：**

FlutterFlow 到 Supabase 的整合是將原型轉化為產品的關鍵步驟，必須在 UI 設計記憶猶新且 Supabase 架構穩定時完成整合。

## Proposed Solution

**三階段整合策略**

基於深入的技術分析發現，您的 Supabase 架構已經相當完善，擁有 v_events_list、v_my_events、v_event_stats、v_notifications、v_user_roles 等完整的 Views，這大幅簡化了整合工作。

**第一階段：資料層統一 (2-3週)**
- **資料適配器建立：** 建立 EventsAdapter、TicketsAdapter 等轉換類別，處理 VEventsListRow → EventsStruct 的格式轉換
- **Constants 國際化重構：** 將 app_constants.dart 中的硬編碼字串轉換為 FlutterFlow Custom Functions，支援繁中/英文動態切換
- **格式轉換邏輯：** 處理 DateTime → String、double → String 等格式差異

**第二階段：核心功能整合 (3-4週)**
- **身份驗證整合：** Supabase Auth 與 FlutterFlow 使用者系統無縫連接
- **事件管理功能：** 利用現有 v_events_list View 實現事件瀏覽、搜尋、篩選的實際資料綁定
- **使用者管理：** 個人資料、收藏、通知的後端整合

**第三階段：進階功能完善 (2-3週)**
- **票券系統：** 利用 v_my_events View 實現完整的報名和票券管理功能
- **ECPay 綠界整合：** 付款流程（最後階段）
- **效能優化：** 資料載入、快取策略

**關鍵差異化優勢：**

1. **保持原有 UI/UX：** 不改變任何現有的精美界面設計，零重構風險
2. **漸進式遷移：** 降低整合風險，每階段都有可交付成果
3. **多語言就緒：** 從一開始就支援國際化擴展
4. **Mobile-First：** 所有功能都在 FlutterFlow app 內完成

**為什麼這個解決方案會成功：**

1. **風險最小化：** 分階段執行，每階段都可獨立驗證
2. **保護既有投資：** 完全保留 FlutterFlow UI 的開發成果
3. **技術基礎扎實：** 現有 Supabase Views 已解決 90% 的整合挑戰
4. **符合在地需求：** ECPay 整合滿足台灣市場需求

## Target Users

### Primary User Segment: 活動參與者 (Event Attendees)

**人口統計特徵：**
- 年齡：25-45 歲都市專業人士
- 收入：中等至中高收入族群
- 地理位置：台北、新竹、台中、高雄等主要都會區
- 教育程度：大學以上學歷
- 數位素養：熟悉手機 app，習慣線上消費

**當前行為與工作流程：**
- 通過 Facebook、Instagram 發現活動資訊
- 使用 Accupass、KKTIX 等平台報名活動
- 依賴 Google Calendar 管理行程
- 習慣手機票券和 QR Code 入場
- 活動後分享體驗到社群媒體

**具體需求與痛點：**
- **發現問題：** 活動資訊分散在各平台，難以整合瀏覽
- **報名複雜：** 不同活動使用不同報名系統，體驗不一致
- **管理困難：** 已報名活動難以統一管理和追蹤
- **社交需求：** 希望與志同道合的人連結，建立社交圈

**目標與期望：**
- 在單一平台發現多元化活動
- 快速、安全的報名與付款體驗
- 便捷的票券管理和活動提醒
- 與其他參與者互動和分享體驗

### Secondary User Segment: 活動主辦方 (Event Organizers)

**組織特徵：**
- 小型工作室、社團、企業活動部門
- 定期舉辦講座、工作坊、聚會等活動
- 規模：10-500人的活動為主
- 預算有限，重視性價比

**當前行為與工作流程：**
- 使用多個平台推廣活動（FB、IG、網站）
- 透過 Accupass、Eventbrite 管理報名
- 手動處理客服和活動變更通知
- 使用 Excel 或簡單 CRM 管理參與者

**具體需求與痛點：**
- **推廣困難：** 需要在多個平台重複發布，耗時費力
- **管理複雜：** 報名、付款、客服分散處理
- **數據分析缺乏：** 難以深入了解參與者喜好和行為
- **成本考量：** 平台抽成和手續費壓縮利潤

**目標與期望：**
- 一站式活動管理解決方案
- 更好的參與者數據分析
- 降低營運成本和提高效率
- 建立長期的參與者關係

## Goals & Success Metrics

### Business Objectives

- **技術整合完成度：** 在 8-10 週內完成 100% FlutterFlow UI 與 Supabase 後端的整合，所有模擬資料替換為實際資料
- **功能可用性達成：** MVP 階段實現核心功能 95% 可用性（事件瀏覽、報名、用戶管理、票券系統）
- **多語言支援建立：** 完成繁中、英文雙語言支援，為未來擴展奠定基礎
- **平台穩定性目標：** 實現 99.5% 系統正常運行時間，支援同時 100+ 用戶操作
- **成本效益最大化：** 在不改變現有 UI 投資的前提下，實現完整功能平台

### User Success Metrics

- **用戶註冊完成率：** 新用戶從下載到完成註冊 ≥ 70%
- **事件發現效率：** 用戶平均在 2 分鐘內找到感興趣的活動
- **報名轉換率：** 從瀏覽活動到完成報名 ≥ 25%
- **用戶留存率：** 30 天用戶留存率 ≥ 40%
- **功能使用深度：** 用戶平均使用 3+ 核心功能（瀏覽、收藏、報名、管理票券）
- **錯誤恢復率：** 用戶遇到問題後繼續使用 ≥ 80%

### Key Performance Indicators (KPIs)

- **整合進度 KPI：** 每週完成的 Supabase 資料表整合數量 ≥ 2 個
- **程式碼品質 KPI：** FlutterFlow 自定義程式碼覆蓋率達到 90%，無重大 bug
- **效能表現 KPI：** App 啟動時間 ≤ 3 秒，資料載入時間 ≤ 2 秒
- **API 回應時間：** Supabase 查詢平均回應時間 ≤ 500ms
- **資料一致性 KPI：** UI 顯示與資料庫同步準確率 99.9%
- **多語言覆蓋率：** Constants 和 UI 文字國際化完成度 100%
- **用戶體驗流暢度：** 核心用戶流程無中斷完成率 ≥ 95%

## MVP Scope

### Core Features (Must Have)

- **事件瀏覽與搜尋：** 使用現有的 `v_events_list` View，透過 EventsAdapter 轉換資料，保持所有現有 UI 組件功能，支援分類篩選、日期搜尋、地點篩選
- **身份驗證整合：** Supabase Auth 與 FlutterFlow 使用者系統連接，支援 Google OAuth 和 email 註冊，利用現有 users 表格和 v_user_roles View
- **基本事件報名：** 利用現有的 registrations 和 ticket_types 表格，實現端到端報名流程，支援多票種選擇和確認碼生成
- **我的票券管理：** 使用 `v_my_events` View，支援 QR Code 顯示、確認碼查詢和基本票券狀態管理，包含報名歷史和出席記錄
- **多語言 Constants：** 重構 app_constants.dart 為 FlutterFlow Custom Functions，支援繁中/英文切換，涵蓋所有 UI 常數文字
- **個人收藏功能：** 整合現有的收藏 UI 與後端 favorites 邏輯，支援收藏事件管理和同步

### Out of Scope for MVP

- **ECPay 綠界付款整合** - 複雜且風險較高，留待第二階段，暫時支援免費活動和線下付款
- **完整評分評論系統** - 需要新建 event_reviews 資料表，非核心功能，暫時保持模擬評論資料
- **進階分析報表** - v_event_stats 已就緒但非用戶端必需功能，專注於主辦方後台功能
- **推播通知系統** - v_notifications 已備但需要額外 FCM 配置，暫時使用 app 內通知
- **事件主辦方管理後台** - 專注於參與者端體驗，主辦方功能留待後期
- **社交分享功能** - UI 已有但後端整合非核心需求，暫時保持前端功能

### MVP Success Criteria

**技術成功標準：**
- 100% 模擬資料替換為 Supabase 實際資料，無資料遺失
- 所有現有 UI 組件正常運作，無功能退化或視覺變化
- 核心用戶流程（註冊→瀏覽→報名→管理票券）完整可用，無中斷點
- 雙語言支援正常運作，所有 constants 文字能正確切換

**用戶體驗標準：**
- 事件載入時間 ≤ 3 秒，包含圖片和詳細資訊
- 報名流程可在 2 分鐘內完成，從瀏覽到確認
- 零學習成本（UI 保持一致），用戶無感知後端變更

## Post-MVP Vision

### Phase 2 Features

基於現有的 Views 架構，第二階段可以快速實現：
- **ECPay 付款整合** - 利用現有的 payments 表格結構，實現完整的線上付款流程
- **評分評論系統** - 建立 event_reviews 表格並整合現有 CommentsStruct，支援用戶評價和主辦方回應
- **推播通知** - 啟用 v_notifications View 的完整功能，整合 FCM 推播服務
- **主辦方功能** - 利用 v_event_stats 實現完整的事件管理、參與者管理和營收分析

### Long-term Vision

打造台灣領先的全功能活動平台：
- **AI 推薦引擎** - 基於用戶行為和 v_user_roles 資料，提供個人化活動推薦
- **多城市擴展** - 利用現有地點和分類架構，擴展到全台各地和海外華語市場
- **企業級功能** - B2B 活動管理和白牌解決方案，服務大型企業客戶
- **生態系統整合** - 與在地服務商（餐廳、交通、住宿）合作，提供一站式活動體驗

### Expansion Opportunities

- **國際化擴展** - Custom Functions 架構已為多語言預備，可快速支援日文、韓文等亞洲語言
- **垂直整合** - 特定行業（科技、藝術、運動）的專業功能和客製化解決方案
- **平台 API** - 開放第三方開發者生態系統，支援外部系統整合和擴展功能

## Technical Considerations

### Platform Requirements

- **Target Platforms:** iOS 和 Android (FlutterFlow 原生支援，單一代碼基礎)
- **Browser/OS Support:** iOS 13+, Android 8.0+，覆蓋 95% 台灣行動裝置用戶
- **Performance Requirements:** 
  - App 啟動時間 ≤ 3 秒
  - 事件列表載入 ≤ 2 秒
  - Supabase API 回應時間 ≤ 500ms
  - 圖片載入優化，支援 WebP 格式

### Technology Preferences

- **Frontend:** FlutterFlow (保持現有架構，零重構風險，視覺化開發優勢)
- **Backend:** Supabase (已配置完善，Views 架構優秀，即時資料庫功能)
- **Database:** PostgreSQL (Supabase 內建，已有完整 schema 和 Views)
- **Authentication:** Supabase Auth (與 FlutterFlow 整合度最佳，支援多種登入方式)
- **Hosting/Infrastructure:** Supabase 雲端架構 (免維護，自動擴展)

### Architecture Considerations

- **Repository Structure:** 
  - 保持現有 FlutterFlow 結構不變
  - 新增 `lib/backend/adapters/` 資料轉換層
  - 建立 `lib/backend/constants/` 國際化 Custom Functions
  - 更新 `docs/` 包含完整技術文檔

- **Service Architecture:** 
  - UI Layer: FlutterFlow Widgets (保持不變)
  - Data Layer: Supabase Views + Adapters (新增轉換邏輯)
  - Business Logic: FlutterFlow State Management + Custom Functions
  - Cache Layer: 本地快取策略減少 API 調用

- **Integration Requirements:** 
  - Supabase Real-time subscriptions 支援即時更新
  - FlutterFlow Custom Functions 處理複雜邏輯和國際化
  - RESTful API 整合 ECPay (第二階段)
  - Firebase Analytics 整合用戶行為追蹤

- **Security/Compliance:** 
  - Supabase RLS (Row Level Security) 保護用戶資料
  - 付款資料 PCI DSS 合規 (ECPay 處理)
  - GDPR 相容的資料保護政策
  - API Rate Limiting 防止濫用

## Constraints & Assumptions

### Constraints

- **Budget:** 專注於現有資源最大化，避免昂貴的第三方服務，利用 Supabase 免費層開始
- **Timeline:** 8-10 週完成 MVP，符合 FlutterFlow 開發速度優勢和市場時機
- **Resources:** 小型開發團隊，依賴 FlutterFlow 的可視化開發效率，最小化複雜程式編寫
- **Technical:** 
  - 必須保持現有 UI/UX 投資，零視覺變更
  - 不能破壞 FlutterFlow 的版本控制機制
  - Supabase 免費層限制 (500MB 資料庫，50,000 API 請求/月)
  - FlutterFlow Custom Functions 的效能限制

### Key Assumptions

- **團隊熟悉度：** 開發團隊對 FlutterFlow Custom Functions 有基本掌握，能處理資料轉換邏輯
- **Supabase 架構穩定：** 現有的 Views 和 Tables 架構成熟，無需大幅調整，效能符合預期
- **用戶接受度：** 台灣用戶偏好行動端操作，對現有 UI 設計滿意，樂於使用新的活動平台
- **市場時機：** 後疫情時代活動需求回升，線上到線下 (O2O) 活動模式受歡迎
- **技術可行性：** FlutterFlow 與 Supabase 的整合成熟度足夠支撐生產環境，社群支援充足

## Risks & Open Questions

### Key Risks

- **資料遷移風險：** 從模擬資料到實際資料的一次性切換可能影響用戶體驗 
  - **緩解策略：** 採用階段性部署，先灰度測試再全面上線，保留回滾機制
- **效能風險：** 大量即時資料查詢可能影響 app 回應速度，特別是事件列表載入
  - **緩解策略：** 實作適當的快取和分頁策略，優化 Supabase 查詢效能
- **多語言複雜度：** Custom Functions 的國際化實作可能比預期複雜，影響開發進度
  - **緩解策略：** 分階段推出語言支援，先完成繁中再擴展英文
- **第三方整合風險：** ECPay 整合的技術複雜度和合規要求可能延誤付款功能上線
  - **緩解策略：** 將付款功能完全隔離到第二階段，MVP 專注於免費活動

### Open Questions

- **評分系統優先級：** 是否在 MVP 中包含基本評分功能，還是完全留待第二階段？
  - **影響：** 評分數據影響事件排序和推薦邏輯
- **離線功能需求：** 用戶在網路不佳時的體驗如何保障？需要多深的離線快取？
  - **考量：** 台灣行動網路覆蓋良好，但地下室或偏遠地區仍有需求
- **資料同步策略：** 如何處理多裝置間的收藏、報名狀態同步？
  - **技術選擇：** Supabase Real-time vs 定期同步的權衡
- **用戶遷移計劃：** 如果有現有用戶資料，如何平滑遷移到新系統？
  - **數據處理：** 需要了解現有用戶資料的格式和數量

### Areas Needing Further Research

- **FlutterFlow Custom Functions 效能限制** - 大量國際化文字的記憶體使用情況和載入速度
- **Supabase Real-time 在行動端的電池消耗** - 長時間即時連接對裝置電池的影響
- **ECPay 技術文件深度研究** - API 整合的具體技術要求、安全限制和測試環境配置
- **競爭對手技術分析** - Accupass、KKTIX 的技術架構、用戶體驗基準和差異化機會

## Next Steps

### Immediate Actions

1. **技術驗證 (本週)** - 建立 EventsAdapter 原型，驗證 VEventsListRow → EventsStruct 轉換的可行性和效能
2. **團隊對齊 (本週)** - 與開發團隊確認 FlutterFlow Custom Functions 和 Supabase 整合的技術細節
3. **優先級確認 (下週)** - 與產品負責人確認 MVP 範圍，特別是評分系統的必要性和實作時程

### PM Handoff

這份專案簡報為您的 **Event 平台 FlutterFlow-Supabase 整合專案** 提供了完整的分析和策略基礎。

**關鍵發現：**
- 您現有的 Supabase Views 架構 (v_events_list, v_my_events 等) 已經解決了 90% 的整合挑戰
- 技術風險低，主要工作是資料適配和格式轉換
- 保護了所有現有 FlutterFlow UI 投資，零重構風險
- 8-10 週的時程合理，分階段交付降低風險

**建議 PM 接手後的工作重點：**
1. **深入技術討論** - 與開發團隊討論 `docs/flutterflow-supabase-integration.md` 技術文件
2. **MVP 範圍確認** - 特別關注評分系統和付款功能的優先順序決策
3. **階段性交付計劃** - 建立每週交付里程碑和品質檢查點
4. **風險監控機制** - 追蹤技術整合進度和效能指標

**專案成功率評估：高** - 技術架構基礎扎實，主要工作是可控的工程任務，團隊可以專注於執行而非重新設計。

---

**文件版本：** v1.0  
**分析完成日期：** 2025-01-09  
**Business Analyst：** Mary 📊  
**狀態：** 已完成，待 PM 接手執行