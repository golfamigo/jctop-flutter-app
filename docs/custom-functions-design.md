# Custom Functions Design Specification (Revised)

## 概述

**重要更新**: 基於 FlutterFlow 實際使用模式的驗證，本文檔已大幅簡化，只保留必要的計算型 Custom Functions。

FlutterFlow 偏好**直接欄位映射**而非複雜的轉換函數。Custom Functions 只用於**複雜計算和業務邏輯**。

## ⚠️ FlutterFlow 實際使用模式

### FlutterFlow 偏好的直接映射模式

```dart
// ✅ FlutterFlow 標準模式 - 直接映射
MyTicketsCardWidget(
  dataDate: EventsStruct(date: rowData.startDate),        // 直接映射
  dataTitle: EventsStruct(title: rowData.title),          // 直接映射
  dataImg: EventsStruct(img: rowData.imageUrl),           // 直接映射
  
  // ✅ 只在需要複雜計算時使用 Custom Functions
  dataLocation: EventsStruct(
    location: functions.formatEventLocation(rowData.venueName, rowData.city)
  ),
  dataTickets: EventsStruct(
    tickets: functions.calculateTicketCount(rowData.tickets)
  ),
)
```

## 1. 核心計算型 Custom Functions

### 1.1 票券數量計算 (已在生產環境使用)

```dart
// 計算可用票券數量 - 處理複雜的票券邏輯
int calculateTicketCount(dynamic ticketsData) {
  if (ticketsData == null) return 0;
  
  // 處理 JSON 數組格式的票券選擇
  if (ticketsData is List) {
    int totalQuantity = 0;
    for (final item in ticketsData) {
      if (item is Map && item['quantity'] != null) {
        final quantity = item['quantity'];
        if (quantity is num) {
          totalQuantity += quantity.toInt();
        }
      }
    }
    return totalQuantity > 0 ? totalQuantity : 1;
  }
  
  // 處理單一數值
  if (ticketsData is num) {
    return ticketsData.toInt();
  }
  
  return 1; // 預設值
}
```

### 1.2 剩餘天數計算 (已在生產環境使用)

```dart
// 計算活動剩餘天數
int calculateDaysLeft(dynamic startDate) {
  if (startDate == null) return 0;
  
  DateTime? date;
  if (startDate is DateTime) {
    date = startDate;
  } else if (startDate is String) {
    date = DateTime.tryParse(startDate);
  }
  
  if (date == null) return 0;
  
  DateTime now = DateTime.now();
  if (date.isBefore(now)) return 0;
  
  Duration difference = date.difference(now);
  return difference.inDays;
}
```

### 1.3 票券狀態格式化 (已在生產環境使用)

```dart
// 格式化付款狀態為票券狀態
String formatTicketStatus(dynamic paymentStatus, dynamic paymentAmount) {
  String status = paymentStatus?.toString() ?? '';
  double amount = 0.0;
  
  if (paymentAmount is num) {
    amount = paymentAmount.toDouble();
  } else if (paymentAmount is String) {
    amount = double.tryParse(paymentAmount) ?? 0.0;
  }
  
  switch (status.toLowerCase()) {
    case 'completed':
    case 'paid':
      return 'confirmed';
    case 'pending':
      return 'pending_payment';
    case 'cancelled':
    case 'refunded':
      return 'cancelled';
    case 'failed':
      return 'payment_failed';
    default:
      return amount > 0 ? 'pending_payment' : 'free';
  }
}
```

### 1.4 地點格式化 (新增 - 用於複雜地點組合)

```dart
// 組合場地名稱和城市為完整地點資訊
String formatEventLocation(dynamic venueName, dynamic city) {
  String venue = venueName?.toString()?.trim() ?? '';
  String cityStr = city?.toString()?.trim() ?? '';
  
  if (venue.isNotEmpty && cityStr.isNotEmpty) {
    return '$venue, $cityStr';
  } else if (venue.isNotEmpty) {
    return venue;
  } else if (cityStr.isNotEmpty) {
    return cityStr;
  } else {
    return '';
  }
}
```

## 2. 實際使用範例

### 2.1 在 FlutterFlow 中的正確使用方式

```dart
// ✅ 基於真實生產代碼的使用範例
FutureBuilder<List<VMyEventsRow>>(
  future: VMyEventsTable().queryRows(
    queryFn: (q) => q.eqOrNull('user_id', currentUserUid),
  ),
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return CircularProgressIndicator();
    }
    
    return ListView.separated(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        final rowData = snapshot.data![index];
        
        return MyTicketsCardWidget(
          // ✅ 直接映射 - FlutterFlow 偏好
          dataDate: EventsStruct(date: rowData.startDate),
          dataTitle: EventsStruct(title: rowData.title),
          dataImg: EventsStruct(img: rowData.imageUrl),
          
          // ✅ 複雜計算使用 Custom Functions
          dataLocation: EventsStruct(
            location: functions.formatEventLocation(
              rowData.venueName, 
              rowData.city
            )
          ),
          dataTickets: EventsStruct(
            tickets: functions.calculateTicketCount(rowData.tickets!)
          ),
          dataDayLeft: EventsStruct(
            dayLeft: functions.calculateDaysLeft(rowData.startDate)
          ),
          dataTicketsStatus: EventsStruct(
            ticketStatus: functions.formatTicketStatus(
              rowData.paymentStatus,
              rowData.paymentAmount
            )
          ),
        );
      },
    );
  },
)
```

## 3. FlutterFlow 約束條件

### 3.1 ✅ 必須遵循的規則

1. **純函數**: 無 import 語句，無全域變數存取
2. **Dynamic 參數**: 讓 FlutterFlow 自動處理 JSON 解析
3. **空值處理**: 所有函數都必須處理 null 輸入
4. **簡單回傳類型**: String, int, double, bool

### 3.2 ❌ 禁止的做法

```dart
// ❌ 不允許的範例
import 'dart:convert';  // 禁止 imports

int _privateFunction() { return 1; }  // 禁止私有函數

String processData(String jsonString) {  // 避免 String 參數用於 JSON
  // FlutterFlow 會將此識別為 JSON 處理器
  return jsonString;
}
```

## 4. 效能最佳化

### 4.1 避免不必要的轉換

```dart
// ❌ 不必要的轉換函數
EventsStruct convertRowToStruct(dynamic row) {
  // FlutterFlow 偏好直接映射，這種函數是多餘的
}

// ✅ 只做必要的計算
int calculateComplexValue(dynamic input) {
  // 只在需要複雜計算時使用
}
```

### 4.2 ListView 中的使用

FlutterFlow 在 ListView 中逐項調用函數，無需批量處理：

```dart
// ✅ FlutterFlow ListView 模式
ListView.builder(
  itemBuilder: (context, index) {
    final item = items[index];
    return Widget(
      data: EventsStruct(
        // 每個 item 單獨處理，無需批量函數
        value: functions.calculateValue(item.data)
      ),
    );
  },
)
```

## 5. 測試和驗證

### 5.1 函數測試建議

雖然 Custom Functions 無法在 FlutterFlow 中直接測試，但建議的驗證方法：

```dart
// 測試資料範例
Map<String, dynamic> testData = {
  'venue_name': 'Test Venue',
  'city': 'Taipei',
  'start_date': '2025-09-15T10:00:00Z',
  'payment_status': 'completed',
  'payment_amount': 100.0,
  'tickets': [{'quantity': 2}, {'quantity': 1}]
};

// 預期結果
formatEventLocation(testData['venue_name'], testData['city']); 
// 應該回傳: "Test Venue, Taipei"

calculateTicketCount(testData['tickets']); 
// 應該回傳: 3

calculateDaysLeft(testData['start_date']); 
// 應該回傳: 正確的天數差

formatTicketStatus(testData['payment_status'], testData['payment_amount']); 
// 應該回傳: "confirmed"
```

## 6. 版本控制策略

### 6.1 函數命名約定

基於生產環境中已使用的函數名稱：

- **實驗性函數**: `experiment*` 前綴（如現有的 `experimentCalculateTicketCount`）
- **正式函數**: 移除前綴，直接使用功能名稱
- **版本控制**: 如需更新，使用 `functionNameV2` 格式

### 6.2 向後兼容性

```dart
// 保持現有函數的兼容性
int experimentCalculateTicketCount(dynamic ticketsData) {
  return calculateTicketCount(ticketsData);  // 調用新版本
}
```

## 結論

**修正後的 Custom Functions 策略**:

✅ **只保留 4 個核心函數**: 用於複雜計算和業務邏輯  
✅ **移除所有轉換函數**: FlutterFlow 偏好直接映射  
✅ **基於實際使用驗證**: 所有函數都基於生產環境的實際需求  
✅ **完全符合 FlutterFlow 約束**: 純函數、動態參數、無 imports  

**實施優先級**:
1. **立即實施**: 4 個核心計算函數
2. **測試驗證**: 在實際 FlutterFlow 環境中測試
3. **性能監控**: 確保函數執行效率
4. **逐步優化**: 根據實際使用情況調整邏輯

這個精簡版本更符合 FlutterFlow 的實際使用模式，避免了不必要的複雜度。