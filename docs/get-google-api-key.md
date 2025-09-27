# 如何取得 Google Maps API Key

## 步驟指南

### 1. 建立 Google Cloud 專案
1. 前往 [Google Cloud Console](https://console.cloud.google.com/)
2. 點擊專案選擇器（頂部導航列）
3. 點擊「新增專案」
4. 輸入專案名稱（例如：「My FlutterFlow App」）
5. 點擊「建立」

### 2. 啟用 Geocoding API
1. 在 Google Cloud Console 中，前往「API 和服務」→「程式庫」
2. 搜尋「Geocoding API」
3. 點擊「Geocoding API」
4. 點擊「啟用」按鈕

### 3. 建立 API Key
1. 前往「API 和服務」→「憑證」
2. 點擊頂部的「+ 建立憑證」
3. 選擇「API 金鑰」
4. API Key 會自動產生並顯示
5. **複製並保存這個 API Key**

### 4. 限制 API Key（建議但非必要）
1. 點擊剛建立的 API Key
2. 在「應用程式限制」下：
   - 選擇「HTTP 參照網址」（用於網頁應用）
   - 或選擇「Android 應用程式」/「iOS 應用程式」（用於手機應用）
3. 在「API 限制」下：
   - 選擇「限制金鑰」
   - 勾選「Geocoding API」
4. 點擊「儲存」

### 5. 啟用計費（必要）
Google Maps API 需要啟用計費帳戶，但提供每月 $200 美元的免費額度：
1. 前往「計費」頁面
2. 連結信用卡或簽帳金融卡
3. 設定預算警示（建議）

## 免費額度
- 每月前 40,000 次 Geocoding API 請求是免費的
- 超過後每 1,000 次請求收費 $5 美元

## 在 FlutterFlow 中使用
1. 複製你的 API Key
2. 在 FlutterFlow 的 API Call 設定中
3. 將 API Key 貼到 `key` 參數中

## 安全提示
- **不要**將 API Key 直接寫在程式碼中
- 使用 FlutterFlow 的環境變數功能
- 在生產環境中限制 API Key 的使用範圍

## 測試 API Key
使用瀏覽器測試（將 YOUR_API_KEY 替換成你的 key）：
```
https://maps.googleapis.com/maps/api/geocode/json?latlng=25.0330,121.5654&key=YOUR_API_KEY
```

如果看到 JSON 回應，表示 API Key 有效！