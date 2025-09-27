# FlutterFlow 編碼規則與模式指南

> 通過實際代碼修改和測試發現的 FlutterFlow 編碼標準和最佳實踐

## 🎯 核心原則

FlutterFlow 遵循 **90% 視覺化，10% 代碼** 的開發理念，強制執行特定的編碼模式以確保與視覺化編輯器的同步。FlutterFlow 不可以直接修改頁面及元件，所有需要修改頁面及元件的部分都需要用互動式指導的方式操作。

## 📋 必須遵循的編碼規則

### 1. **數據查詢模式**

#### ✅ 正確：使用 FutureBuilder + Table.queryRows()
```dart
FutureBuilder<List<VMyEventsRow>>(
  future: VMyEventsTable().queryRows(
    queryFn: (q) => q
        .eqOrNull('user_id', currentUserUid)
        .gteOrNull('start_date', getCurrentTimestamp)
        .order('start_date', ascending: true)
        .limit(2),
  ),
  builder: (context, snapshot) {
    // 處理邏輯
  },
)
```

#### ❌ 錯誤：直接使用 SupaFlow.client
```dart
// 這會導致 push 失敗
final response = await SupaFlow.client
    .from('v_my_events')
    .select()
    .eq('user_id', currentUserUid);
```

### 2. **狀態管理模式**

#### ✅ 正確：使用 FutureBuilder 自動管理狀態
```dart
FutureBuilder<List<VMyEventsRow>>(
  future: VMyEventsTable().queryRows(...),
  builder: (context, snapshot) {
    // 自動處理 loading、error、data 狀態
    if (!snapshot.hasData) {
      return CircularProgressIndicator();
    }
    // 使用數據
  },
)
```

#### ❌ 錯誤：自定義狀態變數
```dart
// FlutterFlow 不允許這些自定義狀態
bool _isLoading = true;
String? _errorMessage;
List<EventsStruct> _events = [];
```

### 3. **異步處理模式**

#### ✅ 正確：聲明式異步處理
- 使用 `FutureBuilder` 處理 Future
- 使用 `StreamBuilder` 處理 Stream
- 依賴 Flutter 內建的異步 Widget

#### ❌ 錯誤：命令式異步處理
```dart
// 不允許自定義異步方法
Future<void> _loadMyEvents() async {
  // 自定義邏輯
}

// 不允許在 initState 中調用
@override
void initState() {
  super.initState();
  _loadMyEvents(); // ❌ 違規
}
```

### 4. **數據映射模式**

#### ✅ 最佳：分離參數模式（FlutterFlow 偏好）
```dart
child: MyTicketsCardWidget(
  dataDate: EventsStruct(date: listViewVMyEventsRow.startDate),
  dataLocation: EventsStruct(location: listViewVMyEventsRow.city),
  dataTitle: EventsStruct(title: listViewVMyEventsRow.title),
  dataImg: EventsStruct(img: listViewVMyEventsRow.imageUrl),
),
```

#### ✅ 可接受：單一 Struct 模式
```dart
data: EventsStruct(
  title: listViewVMyEventsRow.title,
  descr: listViewVMyEventsRow.description,
  date: listViewVMyEventsRow.startDate,
  img: listViewVMyEventsRow.imageUrl,
  location: '${listViewVMyEventsRow.venueName ?? ''} - ${listViewVMyEventsRow.city ?? ''}',
  price: listViewVMyEventsRow.paymentAmount,
  rating: 4.5,
  tag: listViewVMyEventsRow.categoryName,
),
```

#### ❌ 錯誤：手動數據轉換
```dart
// 避免大量手動映射邏輯
final events = response.map((data) => EventsStruct(
  title: data['title'] ?? '',
  descr: data['description'] ?? '',
  // ... 大量手動處理
)).toList();
```

### 5. **查詢構建模式**

#### ✅ 最佳：簡單查詢（FlutterFlow 偏好）
```dart
queryFn: (q) => q.eqOrNull('user_id', currentUserUid),
```

#### ✅ 進階：複雜查詢（適合特殊需求）
```dart
queryFn: (q) => q
    .eqOrNull('user_id', currentUserUid)                    // 用戶過濾
    .gteOrNull('start_date', getCurrentTimestamp)           // 日期過濾
    .order('start_date', ascending: true)                   // 排序
    .limit(2),                                              // 限制
```

#### 📝 實際案例：日期篩選查詢
```dart
// Upcoming Events - 未來事件查詢
FutureBuilder<List<VMyEventsRow>>(
  future: VMyEventsTable().queryRows(
    queryFn: (q) => q
        .eqOrNull('user_id', currentUserUid)
        .gteOrNull('start_date', getCurrentTimestamp)   // 大於等於當前時間
        .order('start_date', ascending: true),          // 升序排列
  ),
  builder: (context, snapshot) { ... },
)

// Past Events - 歷史事件查詢  
FutureBuilder<List<VMyEventsRow>>(
  future: VMyEventsTable().queryRows(
    queryFn: (q) => q
        .eqOrNull('user_id', currentUserUid)
        .ltOrNull('start_date', getCurrentTimestamp)    // 小於當前時間
        .order('start_date', ascending: false),         // 降序排列
  ),
  builder: (context, snapshot) { ... },
)
```

#### 📋 查詢複雜度建議
- **簡單查詢**: 用戶身份過濾 + 基本條件
- **複雜邏輯**: 使用 Custom Actions 或 FFAppState 後處理
- **日期篩選**: 使用 `gteOrNull` 和 `ltOrNull` 進行時間範圍查詢

#### ❌ 錯誤：直接 SQL 或複雜查詢邏輯
```dart
// FlutterFlow 偏好簡單的鏈式查詢
queryFn: (q) => q.rawSql('SELECT * FROM v_my_events WHERE ...')
```

## 🏗️ Widget 結構模式

### 1. **ListView 結構**
```dart
ListView.separated(
  padding: EdgeInsets.zero,
  primary: false,
  shrinkWrap: true,                    // 嵌套 ListView 必須
  scrollDirection: Axis.vertical,
  itemCount: listViewRowList.length,
  separatorBuilder: (_, __) => SizedBox(height: 12.0),
  itemBuilder: (context, index) {
    final rowItem = listViewRowList[index];
    return wrapWithModel(             // FlutterFlow 特有的 model 包裝
      model: _model.cardModels.getModel(
        rowItem.eventId!,
        index,
      ),
      updateCallback: () => safeSetState(() {}),
      child: CardWidget(
        key: Key('Key_${rowItem.eventId!}'),  // 唯一 Key
        data: rowItem,
      ),
    );
  },
);
```

### 2. **錯誤和空狀態處理**
```dart
builder: (context, snapshot) {
  // Loading 狀態
  if (!snapshot.hasData) {
    return Center(
      child: SizedBox(
        width: 25.0,
        height: 25.0,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            FlutterFlowTheme.of(context).primary,
          ),
        ),
      ),
    );
  }

  final dataList = snapshot.data!;

  // 空狀態
  if (dataList.isEmpty) {
    return Center(
      child: Text(
        'No data found',
        style: FlutterFlowTheme.of(context).bodyMedium.override(
          color: FlutterFlowTheme.of(context).secondaryText,
        ),
      ),
    );
  }

  // 正常數據展示
  return ListView.separated(...);
}
```

### 6. **漸進式遷移模式**

FlutterFlow 允許 **Supabase** 和 **FFAppState** 混合使用：

#### ✅ 混合模式示例
```dart
// Tab 1: 使用 Supabase 查詢
if (FFAppState().MyTicketsTAB == 0)
  FutureBuilder<List<VMyEventsRow>>(
    future: VMyEventsTable().queryRows(...),
    builder: (context, snapshot) { ... },
  ),

// Tab 2: 仍使用 FFAppState（漸進遷移）
if (FFAppState().MyTicketsTAB == 1)
  Builder(
    builder: (context) {
      final events = FFAppState().EVENTS.sortedList(...);
      return ListView.separated(...);
    },
  ),
```

#### 📋 漸進遷移策略
1. **第一階段**: 關鍵頁面遷移到 Supabase
2. **第二階段**: 保留 FFAppState 作為備用數據源
3. **第三階段**: 逐步替換所有 FFAppState 使用

#### 📝 實際案例分析：`my_ticket_test_widget.dart`
基於你現有的代碼，這是完美的混合模式實現：

```dart
// Tab 0: 已遷移到 Supabase（推薦方式）
if (FFAppState().MyTicketsTAB == 0)
  FutureBuilder<List<VMyEventsRow>>(
    future: VMyEventsTable().queryRows(
      queryFn: (q) => q.eqOrNull('user_id', currentUserUid),
    ),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Center(child: CircularProgressIndicator());
      }
      
      return ListView.separated(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          final rowData = snapshot.data![index];
          return MyTicketsCardWidget(
            dataDate: EventsStruct(date: rowData.startDate),
            dataLocation: EventsStruct(location: rowData.city),
            dataTitle: EventsStruct(title: rowData.title),
            dataImg: EventsStruct(img: rowData.imageUrl),
          );
        },
      );
    },
  ),

// Tab 1: 仍使用 FFAppState（舊系統保留）
if (FFAppState().MyTicketsTAB == 1)
  Builder(
    builder: (context) {
      final upcomingEvents = FFAppState()
          .EVENTS
          .sortedList(keyOf: (e) => e.date!, desc: true)
          .take(7)
          .toList();
      
      return ListView.separated(
        itemCount: upcomingEvents.length,
        itemBuilder: (context, index) {
          return MyTicketsCard2Widget(
            data: upcomingEvents[index],  // 直接使用 EventsStruct
          );
        },
      );
    },
  ),
```

**核心優勢：**
- ✅ 漸進式遷移，降低風險
- ✅ 新功能使用 Supabase，舊功能保持穩定
- ✅ 使用相同的 UI 組件系統
- ✅ 保持用戶體驗一致性

## 🔧 技術細節

### 1. **導入規則**
```dart
// 必須的導入
import '/auth/supabase_auth/auth_util.dart';      // 認證相關
import '/backend/supabase/supabase.dart';         // Supabase 整合
import '/backend/schema/structs/index.dart';      // 數據結構
```

### 2. **命名規則**
- **Widget Keys**: `Key('Key_${uniqueId}')`
- **Model Keys**: 使用唯一 ID，如 `eventId` 而非 index
- **變數名稱**: 遵循 FlutterFlow 生成的模式

### 3. **數據類型**
- **直接使用**: `VMyEventsRow` (Supabase 生成)
- **轉換為**: `EventsStruct` (UI 數據結構)
- **避免**: 手動 Map 或 JSON 處理

## 🚫 絕對禁止的模式

### 1. **自定義 Widget 狀態**
```dart
// ❌ 這些會導致 push 失敗
class _MyWidgetState extends State<MyWidget> {
  bool _isLoading = true;                    // ❌ 自定義狀態
  List<EventsStruct> _events = [];          // ❌ 自定義列表
  String? _errorMessage;                     // ❌ 自定義錯誤
}
```

### 2. **修改生命週期方法**
```dart
// ❌ 不要修改 initState
@override
void initState() {
  super.initState();
  _loadData();  // ❌ 自定義調用
}
```

### 3. **直接 Supabase 客戶端調用**
```dart
// ❌ 使用低層 API
final response = await SupaFlow.client.from('table').select();
```

## ✅ 最佳實踐總結

1. **使用 FutureBuilder/StreamBuilder** 處理所有異步操作
2. **使用 Table.queryRows()** 進行 Supabase 查詢
3. **保持 Widget 結構完整** 不破壞生成的模式
4. **最小化自定義邏輯** 依賴 FlutterFlow 的內建模式
5. **按需數據映射** 只映射必要的字段到 Struct
6. **使用鏈式查詢** 構建複雜的數據庫查詢
7. **遵循命名規則** 確保與視覺化編輯器同步

## 🧩 FlutterFlow 組件參數化模式

### 1. **組件參數定義**

#### ✅ FlutterFlow 標準組件結構
```dart
class MyTicketsCardWidget extends StatefulWidget {
  const MyTicketsCardWidget({
    super.key,
    this.dataDate,      // 分離的參數
    this.dataLocation,  // 分離的參數
    this.dataTitle,     // 分離的參數
    this.dataImg,       // 分離的參數
  });

  /// Event Date
  final EventsStruct? dataDate;

  /// Event Location  
  final EventsStruct? dataLocation;

  /// eventTitle
  final EventsStruct? dataTitle;

  /// Event Img
  final EventsStruct? dataImg;
}
```

### 2. **組件參數使用模式**

#### ✅ 參數訪問模式
```dart
// 圖片訪問
Image.network(widget!.dataDate!.img)

// 位置顯示  
Text(widget!.dataLocation?.location ?? 'Default Location')

// 標題顯示
Text(widget!.dataTitle?.title ?? 'Default Title')

// 日期格式化
dateTimeFormat("MMM d, y, h:mm a", widget!.dataDate?.date)
```

#### 📝 參數使用規則
- **非空檢查**: 使用 `widget!.paramName` 模式
- **空值處理**: 使用 `??` 運算符提供預設值
- **字符串截斷**: 使用 `.maybeHandleOverflow(maxChars: 20)`

### 3. **組件間數據傳遞**

#### ✅ 導航時參數傳遞
```dart
context.pushNamed(
  MyTicketsSingleWidget.routeName,
  queryParameters: {
    'isCompleted': serializeParam(false, ParamType.bool),
    'data': serializeParam(widget!.dataDate, ParamType.DataStruct),
  }.withoutNulls,
);
```

#### 📋 參數序列化規則
- **布爾值**: `ParamType.bool`
- **數據結構**: `ParamType.DataStruct`  
- **清理空值**: `.withoutNulls`

### 4. **組件設計最佳實踐**

#### ✅ 單一職責原則
```dart
// 每個參數負責特定功能
dataDate    → 日期相關顯示和邏輯
dataLocation → 位置相關顯示  
dataTitle   → 標題相關顯示
dataImg     → 圖片相關顯示
```

#### ✅ 預設值處理
```dart
// 總是提供有意義的預設值
valueOrDefault<String>(
  widget!.dataLocation?.location,
  'Default Location',  // 預設值
)
```

#### ✅ 本地化支持
```dart
// 使用 FFLocalizations 處理多語言
Text(FFLocalizations.of(context).getText('zfqwkvie' /* Paid */))
```

### 5. **視覺化編輯器整合**

#### 📋 組件參數在 FlutterFlow 中的對應
- **Visual Editor**: 在組件屬性面板中設置參數
- **Code Generation**: 自動生成參數化構造函數
- **Data Binding**: 直接綁定到頁面變數或 Supabase 查詢結果

#### ✅ 組件重用性
```dart
// 同一組件可用於不同場景
MyTicketsCardWidget(
  dataDate: upcomingEvent,    // Upcoming Events
  dataLocation: upcomingEvent,
  dataTitle: upcomingEvent,
  dataImg: upcomingEvent,
)

MyTicketsCardWidget(
  dataDate: pastEvent,        // Past Events  
  dataLocation: pastEvent,
  dataTitle: pastEvent,
  dataImg: pastEvent,
)
```

### 6. **組件狀態管理**

#### ✅ FlutterFlow Model 模式
```dart
late MyTicketsCardModel _model;

@override
void initState() {
  super.initState();
  _model = createModel(context, () => MyTicketsCardModel());
}

@override
void setState(VoidCallback callback) {
  super.setState(callback);
  _model.onUpdate();  // 同步更新 Model
}
```

### 7. **列表中的 Model 管理**

#### ✅ 正確：使用唯一 ID 作為 Model Key
```dart
// ListView 中使用事件 ID 作為唯一標識
wrapWithModel(
  model: _model.myTicketsCardModels.getModel(
    listViewVMyEventsRow.eventId!,     // 使用唯一的事件 ID
    listViewIndex,                     // 索引作為第二參數
  ),
  updateCallback: () => safeSetState(() {}),
  child: MyTicketsCardWidget(
    key: Key('Key1y1_${listViewVMyEventsRow.eventId!}'),  // Key 也使用唯一 ID
    // ... 參數
  ),
)
```

#### ❌ 錯誤：僅使用索引作為 Model Key
```dart
// 不穩定的 Model 管理方式
wrapWithModel(
  model: _model.myTicketsCardModels.getModel(
    listViewIndex.toString(),     // ❌ 只使用索引，資料變動時會有問題
    listViewIndex,
  ),
  // ...
)
```

#### 📋 Model 管理最佳實踐
- **ListView**: 使用資料的唯一 ID（如 `eventId`）
- **固定列表**: 可以使用索引或固定字串
- **動態內容**: 必須使用穩定的唯一標識符
- **Widget Key**: 與 Model Key 保持一致

## 🎉 成功案例

完整修改的 `my_ticket_test_widget.dart` 成功展示了：
- ✅ **Upcoming Events**: 使用 FutureBuilder + 日期過濾 + 排序
- ✅ **Past Events**: 使用 FutureBuilder + 日期過濾 + 反向排序  
- ✅ **完整數據映射**: VMyEventsRow → EventsStruct
- ✅ **錯誤處理**: Loading 和空狀態處理
- ✅ **編譯成功**: 0 個編譯錯誤，只有代碼風格警告

這個修改完全符合 FlutterFlow 的編碼標準，可以成功 push 回 FlutterFlow 編輯器！

## 🛠️ Custom Functions 開發規則

### 1. **Custom Functions 參數類型處理**

#### ✅ 正確：使用 `dynamic` 接收 FlutterFlow 自動解析的數據
```dart
int experimentCalculateTicketCount(dynamic ticketsData) {
  // FlutterFlow 會自動解析 JSON，直接處理 List/Map 物件
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
  return 1;
}
```

#### ❌ 錯誤：使用 `String` 參數會導致函數結果顯示為 JSON
```dart
// 這會讓 FlutterFlow 將函數識別為 JSON 處理器
int wrongFunction(String jsonData) {
  // 即使返回 int，FlutterFlow 也會顯示原始 JSON
  return 1;
}
```

### 2. **Custom Functions 使用模式**

#### ✅ 正確：在 EventsStruct 中調用 Custom Function
```dart
// 在 FlutterFlow 視覺編輯器中：
dataTickets: EventsStruct(
  tickets: functions.experimentCalculateTicketCount(listViewVMyEventsRow.tickets!),
  dayLeft: functions.experimentCalculateDaysLeft(listViewVMyEventsRow.startDate),
  ticketStatus: functions.experimentFormatPaymentStatus(
    listViewVMyEventsRow.paymentStatus, 
    listViewVMyEventsRow.paymentAmount
  ),
),
```

#### 📋 關鍵要點
- **使用 `!` 運算符**: 確保非 null 值傳遞給函數
- **數據來源設定**: 必須在 FlutterFlow 視覺編輯器中正確設定數據來源
- **參數類型**: 使用 `dynamic` 讓 FlutterFlow 自動處理 JSON 解析

### 3. **Custom Functions 限制**

#### ❌ FlutterFlow Custom Functions 禁止事項
```dart
// 1. 不能使用 imports
import 'dart:convert';  // ❌ 不允許

// 2. 不能使用私有函數
int _privateFunction() { return 1; }  // ❌ 不允許

// 3. 不能直接訪問 FFAppState
final state = FFAppState();  // ❌ 不允許在函數內部使用
```

#### ✅ 正確的 Custom Functions 結構
```dart
// 純函數，無 imports，無私有方法
int calculateSomething(dynamic data) {
  // 只進行計算和轉換
  return result;
}
```

## 🚫 頁面檔案編輯限制

### **絕對禁止：直接修改頁面檔案後上傳**

#### ❌ 嚴禁修改的檔案類型
```
lib/[page_name]/[page_name]_widget.dart  // 頁面主檔案
lib/[page_name]/[page_name]_model.dart   // 頁面模型檔案
```

**原因：**
- FlutterFlow 會在 push 時**完全覆蓋**頁面檔案
- 任何手動修改都會**永久丟失**
- 會導致 FlutterFlow 編輯器與代碼不同步

#### ✅ 可以修改的檔案類型
```
lib/flutter_flow/custom_functions.dart           // Custom Functions
lib/backend/schema/structs/[struct_name].dart    // 自定義 Struct
lib/[component_name]/[component_name]_widget.dart // 自定義組件（小心使用）
```

#### 📋 正確的開發流程
1. **在 FlutterFlow 視覺編輯器中**進行頁面修改
2. **Pull 最新代碼**到本地
3. **只修改 Custom Functions 和 Structs**
4. **Push 回 FlutterFlow**
5. **在 FlutterFlow 中測試**確認功能正常

#### ⚠️ 特殊注意事項
- **緊急修復**：即使是小改動也必須在 FlutterFlow 中進行
- **數據設定**：必須在 FlutterFlow 視覺編輯器中設定數據來源
- **參數傳遞**：頁面間參數必須在 FlutterFlow 中配置

## 📂 項目結構與文件組織

### 1. **數據結構定義**
```
lib/backend/schema/structs/
├── events_struct.dart          // 事件數據結構
├── comments_struct.dart        // 評論數據結構
├── ticket_struct.dart          // 票券數據結構
├── events2_struct.dart         // 事件數據結構 v2
├── tranding_events_struct.dart // 熱門事件數據結構
└── index.dart                  // 所有 Struct 導出文件
```

**重要：** 所有 FlutterFlow 的自定義數據類型 (DataType/Struct) 都位於此目錄

### 2. **數據庫相關文件**
```
lib/backend/supabase/database/
├── tables/
│   ├── events.dart             // events 表
│   ├── registrations.dart      // registrations 表
│   ├── ticket_types.dart       // ticket_types 表
│   ├── v_my_events.dart        // v_my_events 視圖
│   └── [其他 tables...]
├── views/
│   └── [數據庫視圖文件]
└── database.dart               // 數據庫導出文件
```

**重要：** 所有 Supabase 表格 (Tables) 和視圖 (Views) 的 Dart 對應文件都位於此目錄

### 3. **頁面組織結構**
```
lib/
├── custom_calendar/            // 自定義日曆頁面
├── explore/                    // 探索/發現頁面
├── favorites/                  // 收藏頁面
├── home/                       // 首頁
├── my_tickets/                 // 我的票券頁面
├── profile/                    // 個人資料頁面
└── register/                   // 註冊/登入頁面
```

**每個頁面目錄通常包含：**
```
[page_name]/
├── [page_name]_widget.dart     // 頁面主文件 (❌ 禁止手動修改)
├── [page_name]_model.dart      // 頁面模型 (❌ 禁止手動修改)
└── components/                 // 頁面專用組件
    ├── [component_name]/
    │   ├── [component_name]_widget.dart  // 組件文件 (⚠️ 小心修改)
    │   └── [component_name]_model.dart   // 組件模型
    └── ...
```

### 4. **共用組件結構**
```
lib/components/                 // 全局共用組件
├── [component_name]/
│   ├── [component_name]_widget.dart
│   └── [component_name]_model.dart
└── ...
```

### 5. **FlutterFlow 核心文件**
```
lib/flutter_flow/
├── custom_functions.dart       // ✅ 可修改 - Custom Functions
├── flutter_flow_theme.dart     // 主題配置
├── flutter_flow_util.dart      // 工具函數
├── internationalization.dart   // 國際化
└── nav/
    └── nav.dart                // 導航配置
```

## 📋 文件修改權限總結

### ✅ **可以修改的文件**
- `lib/flutter_flow/custom_functions.dart` - Custom Functions
- `lib/backend/schema/structs/[struct_name].dart` - 自定義數據結構
- `lib/[component_name]/[component_name]_widget.dart` - 自定義組件 (小心使用)

### ❌ **絕對禁止修改的文件**
- `lib/[page_name]/[page_name]_widget.dart` - 所有頁面主文件
- `lib/[page_name]/[page_name]_model.dart` - 所有頁面模型文件
- `lib/backend/supabase/database/` - 所有數據庫文件 (由 Supabase 生成)

### ⚠️ **謹慎修改的文件**
- 組件文件 - 只在必要時修改，優先在 FlutterFlow 中編輯
- 配置文件 - 除非完全理解其影響

## 🔧 MCP 服務器配置

### **Supabase MCP 服務器**

當需要直接操作 Supabase 數據庫時，可以使用 MCP (Model Context Protocol) 服務器來進行數據庫查詢和操作。

#### 配置文件位置
```
.mcp.json
```

#### 當前配置
```json
{
  "mcpServers": {
    "supabase": {
      "command": "npx",
      "args": [
        "-y",
        "@supabase/mcp-server-supabase",
        "--read-only",
        "--project-ref=pgttirminootppecowef"
      ],
      "env": {
        "SUPABASE_ACCESS_TOKEN": "sbp_3d1d2cfc727e582518d5a583eaf10332ceb2039a"
      }
    },
    "context7": {
      "command": "npx",
      "args": [
        "-y",
        "@upstash/context7-mcp@latest"
      ]
    }
  }
}
```

#### 使用場景
- **數據庫查詢驗證**: 檢查 Custom Functions 的計算結果是否正確
- **數據結構分析**: 了解數據庫中實際的數據格式和內容
- **性能分析**: 檢查查詢效率和數據分布
- **數據一致性檢查**: 驗證 FlutterFlow 顯示與數據庫實際數據的一致性

#### 重要說明
- **只讀模式**: 當前配置為 `--read-only`，確保不會意外修改數據
- **項目特定**: 配置中的 `project-ref` 對應特定的 Supabase 項目
- **認證需要**: 需要有效的 `SUPABASE_ACCESS_TOKEN` 才能訪問

#### 常用 MCP 工具功能
- 查詢表格數據
- 檢查數據庫結構
- 驗證索引和性能
- 分析數據分布和統計

---

**記錄時間**: 2025-01-11  
**測試狀態**: ✅ 編譯通過  
**Push 狀態**: ✅ 已驗證可行  
**更新狀態**: 🔄 新增 MCP Supabase 服務器配置 (2025-01-11)