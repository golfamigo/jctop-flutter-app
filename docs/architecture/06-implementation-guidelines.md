# FlutterFlow 事件平台：實施指南和最佳實踐

> **專案類型：** Brownfield 整合  
> **架構版本：** 1.0  
> **建立日期：** 2025-01-15  

---

## 📋 目錄

- [1. FlutterFlow 開發工作流程](#1-flutterflow-開發工作流程)
- [2. 程式碼組織標準](#2-程式碼組織標準)
- [3. 品質保證指南](#3-品質保證指南)
- [4. 部署和協作規範](#4-部署和協作規範)

---

## 🤖 **開發代理重要提醒**

**對於標記為 🔄 需互動指導 的檔案和操作：**
- ❌ **禁止直接修改** - 這些檔案由 FlutterFlow 管理
- ✅ **改用互動指導** - 逐步引導用戶在 FlutterFlow 編輯器中操作
- 🎯 **確認每一步** - 每個操作都要等用戶確認成功再繼續
- 📋 **參考 §4.2** - 詳細的互動協助指導原則

**互動指導觸發關鍵字：**
`修改頁面` `設定資料源` `建立 Custom Function` `更改組件` `多語言設定` `UI 布局`

---

## 1. FlutterFlow 開發工作流程

### 1.1 標準開發流程

**🔄 完整開發週期：**
1. **設計階段**: FlutterFlow 視覺編輯器設計 UI
2. **資料整合**: Custom Functions 轉換資料格式
3. **邏輯實作**: Custom Actions 處理複雜邏輯
4. **本地測試**: VS Code 中測試和調試
5. **平台測試**: FlutterFlow 預覽模式驗證
6. **部署發布**: FlutterFlow 平台部署

### 1.2 關鍵原則

**✅ 必須遵循的原則：**
- **視覺優先**: 所有 UI 修改在 FlutterFlow 編輯器中完成
- **資料綁定**: 使用標準 FutureBuilder + Table.queryRows() 模式
- **純函數**: Custom Functions 保持無副作用
- **漸進遷移**: 新舊資料源並行，降低風險

**❌ 絕對禁止的操作：**
- 直接修改頁面 widget 檔案
- 在 Custom Functions 中使用 import 語句
- 自定義 Widget 生命週期方法
- 跳過 FlutterFlow 平台直接部署

---

## 2. 程式碼組織標準

### 2.1 檔案結構規範

```
lib/
├── flutter_flow/
│   └── custom_functions.dart        # ✅ 可修改：所有 Custom Functions
├── custom_code/
│   ├── actions/                     # ✅ 可修改：Complex Actions
│   └── widgets/                     # ⚠️  小心修改：Custom Widgets
├── backend/schema/structs/          # ✅ 可修改：Data Structures
├── [page_name]/
│   ├── [page_name]_widget.dart      # 🔄 需互動指導：FlutterFlow 視覺編輯器操作
│   └── [page_name]_model.dart       # 🔄 需互動指導：FlutterFlow 視覺編輯器操作
└── components/                      # 🔄 需互動指導：FlutterFlow 視覺編輯器操作
```

### 2.1.1 開發代理協助策略

**🤖 對於需要互動指導的檔案，開發代理應採用以下方式：**

#### ✅ 正確的協助方式：
- **逐步互動式指導**: 一步一步引導用戶在 FlutterFlow 編輯器中操作
- **實時確認**: 每一步都確認用戶操作成功後再繼續
- **具體操作指令**: 給出明確的點擊、選擇、輸入指令
- **視覺化驗證**: 指導用戶確認畫面變化和結果

#### ❌ 錯誤的協助方式：
- 直接修改 [page_name]_widget.dart 檔案
- 提供長篇文字操作指南
- 假設用戶已知如何操作 FlutterFlow
- 跳過操作驗證步驟

#### 📋 互動指導模式範例：

**範例：修改 HomePage 資料源**
```
開發代理: "我們需要將 HomePage 的資料源從 FFAppState 改為 Supabase。
         請打開 FlutterFlow 編輯器，您看到主畫面了嗎？"

用戶: "是的，看到了"

開發代理: "很好！現在請點擊左側頁面樹狀結構中的 'HomePage'"

用戶: "已點擊"

開發代理: "您現在應該看到 HomePage 的設計畫面。
         請在右側找到包含事件列表的 ListView 組件，並點擊它"

[繼續逐步指導...]
```

### 2.2 命名規範

**Custom Functions 命名：**
```dart
// 資料轉換函數
convertVEventsListToEventStruct()
convertSupabaseRowToEventStruct()

// 格式化函數
formatEventDate()
formatPriceRange()
calculateDaysLeft()

// 國際化函數  
getLocalizedInterests()
getLocalizedSortOptions()
```

**Custom Actions 命名：**
```dart
// 資料載入
loadEventsFromSupabase()
loadUserTicketsFromSupabase()

// 用戶操作
registerForEvent()
addEventToFavorites()
updateUserProfile()

// 搜尋功能
searchEventsAdvanced()
```

### 2.3 資料結構標準

**Supabase 到 Struct 對應：**
```dart
// 標準轉換模式
EventsStruct convertVEventsListToEventStruct(VEventsListRow row) {
  return EventsStruct(
    title: row.title ?? '',
    descr: row.description?.substring(0, 200) ?? '',
    date: row.startDate,
    img: row.imageUrl ?? '',
    location: '${row.venueName ?? ''} - ${row.city ?? ''}',
    price: row.minPrice?.toDouble(),
    tag: row.categoryName ?? '',
    rating: 4.5, // 預設值
  );
}
```

---

## 3. 品質保證指南

### 3.1 程式碼品質標準

**Custom Functions 檢查清單：**
- [ ] 無 import 語句使用
- [ ] 所有參數都有空值檢查
- [ ] 返回值有適當的預設值
- [ ] 函數功能單一且明確
- [ ] 效能考量（避免複雜迭代）

**資料轉換驗證：**
```dart
// 標準驗證模式
EventsStruct validateEventStruct(EventsStruct event) {
  assert(event.title?.isNotEmpty == true, 'Event title cannot be empty');
  assert(event.date != null, 'Event date is required');
  assert(event.img?.isNotEmpty == true, 'Event image is required');
  return event;
}
```

### 3.2 測試策略

**功能測試檢查：**
- [ ] 資料載入測試（成功、失敗、空資料）
- [ ] UI 狀態測試（載入中、錯誤、正常）
- [ ] 多語言切換測試
- [ ] 效能基準測試（載入時間 < 2秒）
- [ ] 記憶體使用測試（< 150MB）

### 3.3 錯誤處理標準

**統一錯誤處理模式：**
```dart
FutureBuilder<List<VMyEventsRow>>(
  future: VMyEventsTable().queryRows(...),
  builder: (context, snapshot) {
    // 載入狀態
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }
    
    // 錯誤狀態
    if (snapshot.hasError) {
      return Center(child: Text('載入失敗，請重試'));
    }
    
    // 空資料狀態
    if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return Center(child: Text('暫無資料'));
    }
    
    // 正常資料顯示
    return ListView.separated(...);
  },
)
```

---

## 4. 部署和協作規範

### 4.1 版本控制策略

**Git 工作流程：**
```bash
# 1. 拉取最新代碼
git pull origin main

# 2. 建立功能分支
git checkout -b feature/supabase-integration

# 3. 只修改允許的檔案
# - lib/flutter_flow/custom_functions.dart
# - lib/backend/schema/structs/
# - lib/custom_code/actions/

# 4. 提交修改
git add lib/flutter_flow/custom_functions.dart
git commit -m "Add event data conversion functions"

# 5. 推送到 FlutterFlow
# 在 FlutterFlow 中 Pull 最新代碼並測試
```

### 4.2 開發代理 FlutterFlow 協助指導原則

#### 🤖 代理互動協助標準：

**1. 識別協助需求**
```
當用戶提到以下需求時，啟動互動式指導模式：
- "修改頁面資料源"
- "設定 Supabase 查詢"
- "建立 Custom Function"
- "更改元件參數"
- "設定多語言切換"
- "修改 UI 布局"
```

**2. 互動指導流程**
```
第1步: 環境準備確認
  → 確認 FlutterFlow 編輯器已開啟
  → 確認正確的專案已載入
  → 確認用戶可以看到編輯介面

第2步: 逐步操作引導
  → 每次只給一個具體操作指令
  → 等待用戶確認完成再繼續
  → 提供視覺化的確認標準

第3步: 結果驗證
  → 指導用戶驗證操作結果
  → 確認功能正常運作
  → 記錄任何異常或問題
```

**3. 標準對話模式**
```
代理: "請在 [具體位置] 點擊 [具體元素]"
用戶: "已完成" 或 "沒有找到"
代理: [根據回應決定下一步或提供替代指導]
```

**4. 常見協助場景**

#### 場景A: 資料源切換
```
代理指導重點:
- 找到正確的組件
- 定位資料綁定選項
- 選擇正確的 Supabase 查詢
- 設定查詢參數
- 驗證資料載入
```

#### 場景B: Custom Function 建立
```
代理指導重點:
- 導航到 Custom Functions 區域
- 設定函數名稱和參數
- 輸入函數實作代碼
- 測試函數功能
- 在組件中使用函數
```

#### 場景C: 多語言設定
```
代理指導重點:
- 設定語言切換器
- 配置文字本地化
- 測試語言切換效果
- 驗證所有文字正確顯示
```

### 4.3 團隊協作流程

**團隊協作標準：**
1. **單一編輯**: 同時間只有一人編輯 FlutterFlow 專案
2. **定期同步**: 每日同步代碼變更到版本控制
3. **測試優先**: 所有更改必須通過 FlutterFlow 預覽測試
4. **文件更新**: 重要變更更新相關文件
5. **代理協助**: 複雜操作請開發代理提供互動式指導

### 4.3 部署檢查清單

**預部署驗證：**
- [ ] 所有 Custom Functions 編譯成功
- [ ] FlutterFlow 預覽模式測試通過
- [ ] 效能指標符合基準
- [ ] 多裝置相容性測試完成
- [ ] 資料庫連接和查詢正常

**部署後監控：**
- [ ] 應用啟動成功率 > 95%
- [ ] API 響應時間 < 1秒
- [ ] 錯誤率 < 1%
- [ ] 用戶回饋收集和分析

---

## 📋 快速參考

### 4.4 常用指令

```bash
# FlutterFlow 專案管理
flutter run                    # 本地執行
flutter build apk             # Android APK 建置
flutter clean                 # 清理快取

# 程式碼品質檢查
dart analyze lib/flutter_flow/custom_functions.dart
dart format lib/flutter_flow/custom_functions.dart
```

### 4.5 重要資源

**開發工具：**
- **FlutterFlow Editor**: 主要開發平台
- **VS Code Extension**: 程式碼編輯和調試
- **Supabase Dashboard**: 資料庫管理和監控
- **Git**: 版本控制和協作

**效能監控：**
- **Flutter Inspector**: UI 效能分析
- **Supabase Metrics**: 資料庫效能監控
- **Custom Monitoring**: 業務指標追蹤

### 4.6 常見問題解決

| 問題 | 症狀 | 解決方案 |
|------|------|---------|
| **Custom Function 錯誤** | 編譯失敗 | 檢查語法，移除 import 語句 |
| **資料載入失敗** | FutureBuilder 顯示錯誤 | 檢查 Supabase 連接和查詢語法 |
| **效能問題** | 載入緩慢 | 優化查詢，檢查索引，實施快取 |
| **UI 不同步** | 視覺編輯器與代碼不一致 | 重新 Pull FlutterFlow 代碼 |

這個實施指南確保團隊能夠高效、一致地開發和維護 Event Platform。