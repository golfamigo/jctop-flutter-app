# EPIC-001A: FlutterFlow 認證系統 Supabase 整合 - Brownfield Enhancement

## Epic Goal

將 FlutterFlow Event Platform 的認證系統從 FFAppState 模擬資料完全遷移到 Supabase Auth，實現真實的用戶註冊、登入與密碼管理功能，同時保持 100% 的現有 UI/UX 一致性。

## Epic Description

**Existing System Context:**

- Current relevant functionality: 完整的認證 UI 流程 (register/*, auth/*) 使用 FFAppState 模擬用戶狀態
- Technology stack: FlutterFlow 視覺編輯器 + Flutter + FFAppState (記憶體資料)
- Integration points: FFAppState.User, 認證狀態管理，頁面路由控制

**Enhancement Details:**

- What's being added/changed: 
  - FFAppState 認證模擬 → Supabase Auth 真實認證
  - 假用戶資料 → 真實用戶註冊與資料庫存儲
  - 記憶體狀態 → 持久化認證狀態
  - 靜態路由 → 動態認證路由保護

- How it integrates: 
  - 透過 FlutterFlow 視覺編輯器的 Supabase Auth 集成
  - 使用 Custom Functions 處理認證狀態轉換
  - 維持現有頁面組件結構，僅更改資料源綁定

- Success criteria: 
  - 用戶可以真實註冊、登入、登出
  - 密碼重設功能正常運作
  - 認證狀態在應用重啟後保持
  - 所有現有 UI 組件無變更地正常運作

## Stories

1. **Story A1:** Supabase Auth 設置與 FlutterFlow 整合配置
   - 設置 Supabase Auth providers
   - FlutterFlow 項目的 Supabase 配置
   - 基本認證流程測試

2. **Story A2:** 用戶註冊與登入頁面 Supabase 整合
   - register/login, register/questions 頁面資料源遷移
   - 用戶個人資料的資料庫存儲
   - 認證錯誤處理與用戶體驗優化

3. **Story A3:** 密碼管理與認證狀態持久化
   - register/forgot_password 功能實現
   - 應用啟動時的認證狀態恢復
   - 登出功能與狀態清理

## Compatibility Requirements

- [ ] 現有認證相關 UI 組件保持不變
- [ ] FFAppState.User 結構在遷移期間並存
- [ ] 頁面路由邏輯保持現有模式
- [ ] 現有的表單驗證和錯誤顯示邏輯保持一致

## Risk Mitigation

- **Primary Risk:** 破壞現有認證流程導致用戶無法存取應用功能
- **Mitigation:** 平行開發模式，保持 FFAppState 認證作為後備方案直到 Supabase Auth 完全穩定
- **Rollback Plan:** 透過 FlutterFlow 編輯器一鍵切換回 FFAppState 認證資料源，無需程式碼更改

## Definition of Done

- [ ] 所有認證功能透過 Supabase Auth 實現
- [ ] 現有 UI 組件功能驗證無影響
- [ ] 用戶資料正確存儲在 Supabase users 表
- [ ] 認證狀態持久化正常運作
- [ ] 密碼重設郵件功能正常
- [ ] 所有認證相關頁面的 FlutterFlow 視覺綁定更新完成

---

## Story Manager Handoff

**Story Manager Instructions:**

"請為此 brownfield epic 開發詳細的用戶故事。關鍵考量：

- 這是對現有 FlutterFlow Event Platform 系統的增強，運行於 Flutter + FFAppState
- 整合點：register/*、auth/* 頁面，FFAppState.User，Supabase Auth
- 現有模式：FlutterFlow 視覺編輯器操作，Custom Functions 資料轉換
- 關鍵相容性要求：所有 UI 組件保持不變，僅更改資料源綁定
- 每個故事必須包含驗證現有功能保持完整性

此 epic 應在保持系統完整性的同時實現真實認證系統整合。"

---

## Epic Metadata

**Epic ID:** EPIC-001A  
**Epic Type:** Brownfield Enhancement - Authentication Integration  
**Estimated Duration:** 1-2 weeks  
**Story Count:** 3 stories  
**Priority:** High - Foundation for other integrations  
**Risk Level:** Medium - Authentication is critical system component  
**Complexity:** Intermediate - Existing patterns with new data source

**Dependencies:**
- Supabase project setup and Auth configuration
- FlutterFlow project access and permissions
- Story 1.1 completion (Custom DataTypes analysis)

**Success Metrics:**
- 100% authentication flow functionality preserved
- Zero UI/UX changes visible to users
- Authentication state persistence working
- Password reset email delivery functional
- User registration and login success rate >99%

---

## Change Log

| Date | Version | Description | Author |
|------|---------|-------------|---------|
| 2025-09-12 | 1.0 | Initial epic creation for FlutterFlow Auth Supabase integration | Sarah (PO) |