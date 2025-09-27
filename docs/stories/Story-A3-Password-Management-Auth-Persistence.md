# Story A3: 密碼管理與認證狀態持久化 - Brownfield Addition

## User Story

**As a** Event Platform User,  
**I want** to reset my password when forgotten and maintain my login session across app restarts,  
**So that** I have reliable access to my account without repeatedly entering credentials.

## Story Context

**Existing System Integration:**
- 整合對象：register/forgot_password 頁面 + 應用啟動認證狀態檢查
- 技術：FlutterFlow Auth Session Management + Supabase Auth 持久化
- 遵循模式：FlutterFlow 內建認證狀態管理，應用生命週期認證檢查
- 接觸點：應用啟動流程，register/forgot_password，登出功能，路由保護

## Acceptance Criteria

**Functional Requirements:**
1. register/forgot_password 頁面可以發送真實密碼重設郵件到用戶信箱
2. 應用重啟後認證狀態自動恢復，已登入用戶無需重新登入
3. 登出功能正確清理所有認證狀態和本地儲存的用戶資料

**Integration Requirements:**
4. 密碼重設郵件模板包含適當的品牌設計和多語言支援
5. 認證狀態檢查與現有應用路由和頁面保護邏輯完美整合  
6. FFAppState 中的用戶相關狀態在登出時正確清理，避免資料洩露

**Quality Requirements:**
7. 密碼重設郵件發送 <5 秒，重設連結 24 小時有效期
8. 應用啟動認證狀態檢查 <2 秒，不影響啟動體驗
9. 登出操作完全清理認證資料，通過安全性檢查

## Technical Notes

**Integration Approach:** 
- 在 FlutterFlow 中配置 Supabase Auth 的密碼重設功能和郵件模板
- 使用 FlutterFlow 內建的 "Send Password Reset Email" Action
- 應用啟動時透過 FlutterFlow 的 Initial Page Logic 檢查 currentUser 狀態
- 登出使用 "Log User Out" Action 並清理相關 FFAppState

**Existing Pattern Reference:** 
- 遵循 FlutterFlow 認證狀態管理的標準模式
- 使用 FlutterFlow 內建的路由保護和認證檢查機制
- 保持與現有頁面導航邏輯的完全相容性

**Key Constraints:** 
- 密碼重設功能依賴 Supabase Auth 的郵件配置正確設定
- 認證狀態持久化必須與 FlutterFlow 內建機制配合，不可自定義狀態管理
- 遵循「🚫 絕對禁止的模式」中關於自定義認證狀態變數的限制

## Definition of Done

- [ ] register/forgot_password 頁面成功發送密碼重設郵件
- [ ] 密碼重設郵件包含正確的重設連結和品牌設計
- [ ] 應用重啟後登入狀態自動恢復正常
- [ ] 登出功能完全清理認證狀態和 FFAppState 用戶資料
- [ ] 認證狀態變化時頁面路由正確響應和保護
- [ ] 所有認證相關功能在多語言環境下正常運作
- [ ] 認證流程通過 FlutterFlow 完整測試驗證

## Risk Assessment

**Primary Risk:** 密碼重設功能失效或認證狀態持久化失敗導致用戶體驗問題
**Mitigation:** 完整測試密碼重設流程，確保 Supabase Auth 郵件配置正確
**Rollback:** 保持 FFAppState 認證系統並存，可快速切換回原有認證方式

## FlutterFlow Integration Notes

**Visual Editor Operations Required:**
1. 密碼重設頁面 (register/forgot_password)：
   - 忘記密碼按鈕：Add Action > Authentication > Send Password Reset Email
   - 設定 email 參數綁定到輸入欄位
   - 配置成功/錯誤訊息顯示

2. 應用啟動邏輯配置：
   - 在 Main App 設定中配置 Initial Page Logic
   - 設定認證檢查條件：if currentUser != null
   - 配置已登入/未登入的導航路徑

3. 登出功能實現：
   - 登出按鈕：Add Action > Authentication > Log User Out
   - 後續 Action：Add Action > App State > Reset App State
   - 導航到登入頁面：Add Action > Navigation > Navigate To

**Supabase Configuration Required:**
- 在 Supabase Dashboard 中配置 SMTP 設定
- 自定義密碼重設郵件模板
- 設定重設連結的有效期限和重導向 URL

**Authentication Flow Testing:**
- 測試密碼重設郵件發送和連結有效性
- 驗證應用重啟後認證狀態保持
- 確認登出後完全清理用戶資料
- 檢查多語言環境下的錯誤訊息顯示

## Change Log

| Date | Version | Description | Author |
|------|---------|-------------|---------|
| 2025-09-12 | 1.0 | Initial story creation for password management and authentication persistence | Sarah (PO) |