# EPIC-001C: 用戶管理功能 Supabase 整合 - Brownfield Enhancement

## Epic Goal

將 FlutterFlow Event Platform 的用戶管理功能 (my_tickets/*, favorites/*, profile/*) 從 FFAppState 模擬資料完全遷移到 Supabase 真實資料，實現票券管理、收藏功能、用戶個人資料管理，同時保持所有現有 UI 流程的完整性。

## Epic Description

**Existing System Context:**

- Current relevant functionality: 票券管理 (my_tickets/*) 、收藏系統 (favorites/*)、用戶個人資料 (profile/*) 使用 FFAppState 模擬資料
- Technology stack: FlutterFlow 視覺編輯器 + Flutter + FFAppState 用戶資料與狀態管理
- Integration points: 用戶票券、收藏列表、個人資料編輯、QR Code 顯示

**Enhancement Details:**

- What's being added/changed:
  - FFAppState 票券模擬 → Supabase registrations 表真實票券資料
  - 記憶體收藏列表 → user_favorites 表持久化收藏
  - 靜態個人資料 → users 表動態個人資料管理
  - 模擬 QR 碼 → 基於真實票券 ID 的 QR 碼生成

- How it integrates:
  - 透過 FlutterFlow 的用戶認證狀態綁定個人資料查詢
  - 使用 Supabase RLS (Row Level Security) 確保用戶只能存取自己的資料
  - 整合已建立的票券與活動資料結構
  - 保持現有組件的資料顯示格式

- Success criteria:
  - 用戶可以查看和管理真實購買的票券
  - 收藏功能可以持久化儲存和同步
  - 個人資料修改可以正確儲存到資料庫
  - QR 碼功能基於真實票券資料運作

## Stories

1. **Story C1:** 票券管理系統 Supabase 整合
   - my_tickets/my_tickets, my_tickets/my_tickets_single 頁面資料源遷移
   - registrations 表的用戶票券查詢
   - QR 碼顯示 (show_q_r) 基於真實票券資料
   - 票券狀態管理與取消功能

2. **Story C2:** 收藏系統 Supabase 整合
   - favorites/favorites 頁面資料源遷移
   - user_favorites 表的建立與整合
   - 收藏/取消收藏功能的即時同步
   - 收藏列表的篩選與排序功能

3. **Story C3:** 用戶個人資料管理 Supabase 整合
   - profile/account_edit 頁面的資料庫整合
   - users 表的個人資料更新功能
   - 頭像上傳與 Supabase Storage 整合
   - 個人設定的持久化儲存

## Compatibility Requirements

- [ ] 現有票券卡片組件 (my_tickets_card*) 資料格式保持一致
- [ ] 收藏按鈕與列表組件功能保持相同操作體驗
- [ ] 個人資料表單驗證邏輯保持一致
- [ ] QR 碼顯示組件格式與掃描相容性保持

## Risk Mitigation

- **Primary Risk:** 用戶個人資料或票券資料遺失，或 RLS 安全設定錯誤導致資料洩露
- **Mitigation:** 
  - 完整的 RLS 測試確保資料安全隔離
  - 段階式遷移：先測試環境驗證再生產部署
  - 完整的資料備份機制
  - 用戶資料匯入驗證流程
- **Rollback Plan:** FFAppState 備用資料與快速資料源切換功能

## Definition of Done

- [ ] 所有用戶管理頁面成功連接到 Supabase 個人資料資料
- [ ] 票券管理功能完全基於真實 registrations 資料
- [ ] 收藏功能可以正確新增、移除並同步到資料庫
- [ ] 個人資料編輯可以正確更新 users 表
- [ ] RLS 安全政策正確保護用戶隱私資料
- [ ] 所有現有 UI 組件與流程功能驗證無影響

---

## Story Manager Handoff

**Story Manager Instructions:**

"請為此 brownfield epic 開發詳細的用戶故事。關鍵考量：

- 這是對現有 FlutterFlow Event Platform 用戶管理功能的增強
- 整合點：my_tickets/*、favorites/*、profile/* 頁面，用戶認證狀態，個人資料管理
- 現有模式：FlutterFlow 用戶狀態管理，資料表單處理，列表顯示模式
- 關鍵相容性要求：RLS 資料安全，個人資料隱私，票券資料完整性
- 每個故事必須包含資料安全性驗證與現有功能完整性確認

此 epic 依賴 EPIC-001A 的認證系統整合，應確保用戶身份驗證與資料存取的安全性。"

---

## Epic Metadata

**Epic ID:** EPIC-001C  
**Epic Type:** Brownfield Enhancement - User Management Integration  
**Estimated Duration:** 1-2 weeks  
**Story Count:** 3 stories  
**Priority:** High - Critical user personal data functionality  
**Risk Level:** High - Personal data and security sensitive  
**Complexity:** Advanced - RLS security, personal data management

**Dependencies:**
- EPIC-001A completion (Authentication system)
- Story 1.1 completion (Custom DataTypes compatibility)
- Supabase RLS policies setup
- User data migration planning

**Success Metrics:**
- 100% user personal data sourced from Supabase with RLS protection
- Zero data leakage between users verified
- Personal profile update success rate >99%
- Favorites sync functionality <200ms response time
- QR code generation based on real ticket data functional

---

## Change Log

| Date | Version | Description | Author |
|------|---------|-------------|---------|
| 2025-09-12 | 1.0 | Initial epic creation for user management functionality Supabase integration | Sarah (PO) |