# EPIC-001B: 核心瀏覽功能 Supabase 整合 - Brownfield Enhancement

## Epic Goal

將 FlutterFlow Event Platform 的核心瀏覽功能 (home/*, explore/*) 從 FFAppState 模擬資料完全遷移到 Supabase 真實資料，實現動態活動瀏覽、搜尋、篩選功能，同時保持所有現有 UI 組件的完美運作。

## Epic Description

**Existing System Context:**

- Current relevant functionality: 主頁導航 (home/*) 與活動瀏覽系統 (explore/*) 使用 FFAppState 靜態活動資料
- Technology stack: FlutterFlow 視覺編輯器 + Flutter + FFAppState 列表資料
- Integration points: 活動卡片組件、篩選組件、搜尋功能、分類系統

**Enhancement Details:**

- What's being added/changed:
  - FFAppState 靜態活動列表 → Supabase v_events_complete 檢視查詢
  - 假分類資料 → categories 表動態資料
  - 模擬搜尋 → 真實全文搜索功能
  - 靜態篩選 → 動態資料庫篩選查詢

- How it integrates:
  - 透過 FlutterFlow 的 Supabase Query 替換 FFAppState 資料綁定
  - 使用已建立的資料庫檢視 (v_events_complete, v_trending_events)
  - 活用 Story 1.1 完成的 Custom DataTypes 相容性設計
  - 保持現有組件的參數結構 (dataTitle, dataDate, dataLocation 等)

- Success criteria:
  - 所有活動資料來自 Supabase 資料庫
  - 搜尋與篩選功能正常運作
  - 活動卡片顯示正確的動態資料
  - 頁面載入效能符合要求 (<3 秒)

## Stories

1. **Story B1:** 主頁活動資料源 Supabase 整合
   - home/home, home/find_new_events 頁面資料源遷移
   - 趨勢活動與推薦活動的動態查詢
   - 主頁導航組件的資料綁定更新

2. **Story B2:** 活動瀏覽與搜尋功能 Supabase 整合
   - explore/explore, explore/explore_search 頁面資料源遷移
   - 全文搜索功能實現
   - 活動卡片組件 (widget_event_card*) 的動態資料綁定

3. **Story B3:** 篩選與分類系統 Supabase 整合
   - 分類篩選 (filter_by_category) 功能實現
   - 日期篩選 (filter_by_date) 與排序功能
   - 所有篩選組件的 Supabase 查詢整合

## Compatibility Requirements

- [ ] 現有活動卡片組件參數結構保持不變 (dataTitle, dataDate, dataImg, dataLocation)
- [ ] 篩選與搜尋 UI 組件功能保持一致
- [ ] ListView 捲動與分頁效能保持相同體驗
- [ ] 活動詳細頁面 (single_event*) 資料傳遞保持相容

## Risk Mitigation

- **Primary Risk:** 活動列表載入效能問題或資料格式不符導致 UI 組件顯示錯誤
- **Mitigation:** 
  - 使用已優化的資料庫檢視 (v_events_complete) 進行複雜計算
  - 段階式遷移：先單頁測試再全面部署
  - 保持 FFAppState 作為開發期間的備用資料源
- **Rollback Plan:** 透過 FlutterFlow 編輯器快速切換查詢回 FFAppState 資料源

## Definition of Done

- [ ] 所有 home/* 與 explore/* 頁面成功連接到 Supabase 資料
- [ ] 搜尋功能返回正確的資料庫查詢結果
- [ ] 所有篩選功能 (分類、日期、排序) 正常運作
- [ ] 活動卡片組件顯示正確的動態資料
- [ ] 頁面載入效能符合 <3 秒要求
- [ ] 現有 UI 組件功能驗證無影響

---

## Story Manager Handoff

**Story Manager Instructions:**

"請為此 brownfield epic 開發詳細的用戶故事。關鍵考量：

- 這是對現有 FlutterFlow Event Platform 核心瀏覽功能的增強
- 整合點：home/*、explore/* 頁面，活動卡片組件，篩選搜尋功能
- 現有模式：FlutterFlow 視覺資料綁定，ListView 組件，參數傳遞模式
- 關鍵相容性要求：保持組件參數結構 (dataTitle, dataDate 等)，維持 UI 效能
- 每個故事必須包含現有 UI 組件功能驗證

此 epic 基於 Story 1.1 的 Custom DataTypes 相容性成果，應確保完美的資料結構對齊。"

---

## Epic Metadata

**Epic ID:** EPIC-001B  
**Epic Type:** Brownfield Enhancement - Core Browse Integration  
**Estimated Duration:** 1-2 weeks  
**Story Count:** 3 stories  
**Priority:** High - Core user experience functionality  
**Risk Level:** Medium - High user visibility features  
**Complexity:** Intermediate - List views with complex filtering

**Dependencies:**
- EPIC-001A completion (Authentication integration)
- Story 1.1 completion (Custom DataTypes compatibility)
- Supabase v_events_complete and related views availability

**Success Metrics:**
- 100% event data sourced from Supabase
- Search response time <500ms
- Filter operations response time <300ms
- Zero UI component layout changes
- Page load time maintained <3 seconds

---

## Change Log

| Date | Version | Description | Author |
|------|---------|-------------|---------|
| 2025-09-12 | 1.0 | Initial epic creation for core browse functionality Supabase integration | Sarah (PO) |