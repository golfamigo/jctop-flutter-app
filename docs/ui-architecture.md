# Event Platform Frontend Architecture Document

## Change Log

| Date | Version | Description | Author |
|------|---------|-------------|--------|
| 2025-01-09 | 1.0 | Initial frontend architecture document | Winston (Architect) |

---

## 1. Template and Framework Selection

### Framework Analysis

基於您的專案文檔，您使用 **FlutterFlow** 作為主要前端框架，這是一個視覺化 Flutter 開發平台。這是一個特定且明確的選擇，影響所有架構決策。

**Framework Discovery:**
- **Primary Framework:** FlutterFlow (Visual Flutter Development)
- **Backend Integration:** Supabase (PostgreSQL + Real-time)
- **Platform Target:** iOS and Android native apps
- **Current State:** Complete UI with mock data, ready for backend integration

**Key Constraints Identified:**
1. Must preserve existing FlutterFlow UI components (no visual changes)
2. Integration limited to data layer adaptations
3. Custom Functions required for complex logic and i18n
4. Widget-based architecture with state management

**Starter Template Assessment:**
FlutterFlow provides its own project structure and tooling, which differs from traditional Flutter development. Your existing project already has:
- Complete widget hierarchy
- State management via `app_state.dart`
- Custom data structures in `lib/backend/schema/structs/`
- Supabase integration scaffolding

---

## 2. Frontend Tech Stack

### Technology Stack Table

| 類別 | 技術 | 版本 | 目的 | 選擇理由 |
|------|------|------|------|---------|
| **Framework** | FlutterFlow | Latest | 視覺化 Flutter 開發平台 | 現有投資保護，快速開發，內建 Supabase 支援 |
| **UI Library** | Flutter Widgets | Flutter 3.x | 原生 UI 組件庫 | FlutterFlow 內建，Material Design 3 支援 |
| **State Management** | FlutterFlow AppState + Riverpod | Built-in + 2.x | 全域狀態管理 | AppState 處理簡單狀態，Riverpod 處理複雜業務邏輯 |
| **Routing** | FlutterFlow Navigation | Built-in | 頁面路由管理 | 與視覺化開發工具完全整合 |
| **Build Tool** | FlutterFlow Compiler | Built-in | 代碼生成與編譯 | 自動化 Flutter 代碼生成，支援熱重載 |
| **Styling** | FlutterFlow Theme + Material 3 | Built-in | 主題與樣式系統 | 視覺化主題編輯，支援動態主題切換 |
| **Testing** | FlutterFlow Built-in Testing | Built-in | 內建測試機制 | 由 FlutterFlow 平台負責測試 |
| **Component Library** | Custom FlutterFlow Components | Built-in | 可重用組件庫 | 視覺化組件建立，支援參數化 |
| **Form Handling** | FlutterFlow Form Builder | Built-in | 表單驗證與處理 | 視覺化表單設計，內建驗證邏輯 |
| **Animation** | Flutter Animations + Lottie | Built-in + 3.x | 動畫與過場效果 | FlutterFlow 動畫編輯器 + 複雜動畫支援 |
| **Dev Tools** | FlutterFlow IDE + Flutter Inspector | Built-in | 開發調試工具 | 整合開發環境，即時預覽與調試 |

---

## 3. Project Structure

基於 FlutterFlow 的特殊約束和 Supabase 整合需求，正確的專案結構如下：

```plaintext
lib/
├── custom_code/                       # FlutterFlow Custom Code 專用目錄
│   ├── actions/                       # Custom Actions (可使用外部依賴)
│   │   ├── load_events_from_supabase.dart      # 從 Supabase 載入事件
│   │   ├── register_for_event.dart             # 事件報名邏輯
│   │   ├── sync_user_favorites.dart            # 同步用戶收藏
│   │   ├── update_app_state_events.dart        # 更新 AppState 事件數據
│   │   └── handle_supabase_auth.dart           # Supabase 認證處理
│   └── widgets/                       # Custom Widgets (可使用外部依賴)
│       ├── enhanced_event_card.dart            # 增強版事件卡片
│       └── qr_code_display.dart                # QR Code 顯示組件
├── flutter_flow/                      # FlutterFlow 核心檔案
│   └── custom_functions.dart          # Custom Functions (無法使用 import)
│       # 包含所有國際化和格式化函式：
│       # - formatEventDate()
│       # - formatPriceRange() 
│       # - getLocalizedInterests()
│       # - generateEventTag()
│       # - convertVEventsListToEventStruct()
├── backend/                           # FlutterFlow 自動生成 (不可修改)
│   ├── schema/structs/                # Custom Data Types 
│   │   ├── events_struct.dart         # 保持現有結構
│   │   ├── ticket_struct.dart
│   │   └── [其他 structs...]
│   ├── supabase/                      # Supabase 整合
│   │   └── database/tables/           # Supabase Tables & Views
│   └── api_requests/                  # API 請求 (FlutterFlow 管理)
├── components/                        # FlutterFlow 視覺化組件 (不可修改)
├── pages/                            # FlutterFlow 頁面 (不可修改)
├── app_state.dart                    # 全域狀態 (FlutterFlow 管理，可部分修改)
├── app_constants.dart                # 應用常數 (將被 Custom Functions 取代)
└── main.dart                         # 應用入口 (FlutterFlow 管理)

# VS Code 開發時的額外檔案 (推送到 FlutterFlow 時會同步)
pubspec.yaml                          # 依賴管理 (Custom Actions/Widgets 可添加)

# 開發文檔 (與 FlutterFlow 無關)
docs/
├── flutterflow-development-guide.md  # FlutterFlow 開發指南
├── custom-functions-reference.md     # Custom Functions 參考
├── supabase-integration-guide.md     # Supabase 整合指南
└── deployment-checklist.md           # 部署檢查清單
```

---

## 4. Component Standards

### Component Template

#### FlutterFlow 視覺化組件模板
```typescript
// FlutterFlow 視覺化組件開發指南
// 注意：這些組件在 FlutterFlow 介面中創建，不是直接程式碼

組件名稱：EventCard
參數：
├── eventData (EventsStruct) - 事件資料
├── showFavoriteButton (bool) - 是否顯示收藏按鈕  
├── onTap (Action) - 點擊回調
└── customHeight (double?) - 自定義高度

內部邏輯：
├── 使用 Custom Function: formatEventDate(eventData.date)
├── 使用 Custom Function: getEventTag(eventData.tag)  
├── 條件顯示：收藏按鈕根據 showFavoriteButton 參數
└── 動作觸發：點擊時執行 onTap 參數動作
```

#### Custom Widget 程式碼模板（複雜組件）
```dart
// lib/custom_code/widgets/enhanced_event_card.dart
import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;

class EnhancedEventCard extends StatefulWidget {
  const EnhancedEventCard({
    Key? key,
    this.width,
    this.height,
    required this.eventData,
    this.showQrCode = false,
    this.onCardTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final EventsStruct eventData;
  final bool showQrCode;
  final Future<void> Function()? onCardTap;

  @override
  State<EnhancedEventCard> createState() => _EnhancedEventCardState();
}

class _EnhancedEventCardState extends State<EnhancedEventCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: widget.onCardTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: FlutterFlowTheme.of(context).shadow,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 事件圖片
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                widget.eventData.img ?? '',
                width: double.infinity,
                height: 160,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 160,
                    color: FlutterFlowTheme.of(context).alternate,
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 事件標題
                  Text(
                    widget.eventData.title ?? '',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // 格式化日期（使用 Custom Function）
                  Text(
                    functions.formatEventDate(widget.eventData.date ?? ''),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                  
                  const SizedBox(height: 4),
                  
                  // 地點資訊
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          widget.eventData.location ?? '',
                          style: FlutterFlowTheme.of(context).bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // 價格和標籤
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.eventData.price ?? 'Free',
                        style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (widget.eventData.tag?.isNotEmpty == true)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent1,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            widget.eventData.tag!,
                            style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Naming Conventions

#### FlutterFlow 組件命名規範
```
視覺化組件：
├── EventCard           # 事件卡片
├── TicketItem         # 票券項目
├── CategoryChip       # 分類標籤
├── UserAvatar         # 用戶頭像
└── QRCodeDisplay      # QR Code 顯示

Custom Widgets：
├── EnhancedEventCard      # 增強版事件卡片
├── AnimatedTicketCard     # 動畫票券卡片
├── InteractiveMap         # 互動地圖
└── AdvancedSearchFilter   # 進階搜尋篩選器

Custom Functions：
├── formatEventDate()           # 格式化事件日期
├── getLocalizedInterests()     # 取得本地化興趣
├── convertSupabaseToStruct()   # Supabase 資料轉換
└── calculateEventDistance()    # 計算事件距離

Custom Actions：
├── loadEventsFromSupabase()    # 從 Supabase 載入事件
├── registerForEvent()          # 事件報名
├── syncUserFavorites()         # 同步用戶收藏
└── handlePaymentFlow()         # 處理付款流程
```

---

## 5. State Management

### Store Structure

#### FlutterFlow AppState 組織結構
```plaintext
FFAppState (FlutterFlow 全域狀態)
├── user/                           # 用戶相關狀態
│   ├── currentUser (UsersRow?)     # 當前登入用戶
│   ├── userPreferences (Map)       # 用戶偏好設定
│   ├── selectedLanguage (String)   # 選擇的語言
│   └── favoriteEvents (List<String>) # 收藏的事件 ID
├── events/                         # 事件相關狀態
│   ├── allEvents (List<EventsStruct>) # 所有事件列表
│   ├── trendingEvents (List<TrandingEventsStruct>) # 熱門事件
│   ├── filteredEvents (List<EventsStruct>) # 篩選後事件
│   ├── selectedEvent (EventsStruct?) # 當前選擇事件
│   ├── eventCategories (List<CategoriesStruct>) # 事件分類
│   └── isLoading (bool)            # 載入狀態
├── tickets/                        # 票券相關狀態  
│   ├── myTickets (List<VMyEventsRow>) # 我的票券
│   ├── availableTickets (List<TicketStruct>) # 可購買票券
│   ├── selectedTickets (Map<String, int>) # 已選票券數量
│   └── registrationStatus (String) # 報名狀態
├── ui/                            # UI 相關狀態
│   ├── currentPageIndex (int)      # 當前頁面索引
│   ├── searchQuery (String)        # 搜尋關鍵字
│   ├── selectedFilters (Map)       # 選擇的篩選器
│   ├── showFavoriteOnly (bool)     # 只顯示收藏
│   └── errorMessage (String?)      # 錯誤訊息
└── cache/                         # 快取相關狀態
    ├── lastUpdateTime (DateTime?)  # 最後更新時間
    ├── cacheExpired (bool)         # 快取是否過期
    └── offlineMode (bool)          # 離線模式
```

### State Management Template

#### FFAppState 狀態更新模板
```dart
// app_state.dart 中的狀態管理邏輯

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();
  factory FFAppState() => _instance;
  FFAppState._internal();

  // Events 狀態管理
  List<EventsStruct> _allEvents = [];
  List<EventsStruct> get allEvents => _allEvents;
  
  bool _isLoadingEvents = false;
  bool get isLoadingEvents => _isLoadingEvents;

  // 更新事件列表的方法
  void updateAllEvents(List<EventsStruct> events) {
    _allEvents = events;
    _isLoadingEvents = false;
    notifyListeners();
  }

  // 設定載入狀態
  void setEventsLoading(bool loading) {
    _isLoadingEvents = loading;
    notifyListeners();
  }

  // 添加單個事件到收藏
  void addToFavorites(String eventId) {
    if (!favoriteEvents.contains(eventId)) {
      favoriteEvents.add(eventId);
      notifyListeners();
    }
  }

  // 從收藏移除事件
  void removeFromFavorites(String eventId) {
    favoriteEvents.remove(eventId);
    notifyListeners();
  }

  // 篩選事件（使用 Custom Function）
  void filterEvents(String query, List<String> categories) {
    // 這裡會調用 Custom Function 處理篩選邏輯
    _filteredEvents = allEvents.where((event) {
      return functions.matchesSearchCriteria(event, query, categories);
    }).toList();
    notifyListeners();
  }

  // 錯誤處理
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  
  void setError(String? error) {
    _errorMessage = error;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // 快取管理
  DateTime? _lastUpdateTime;
  DateTime? get lastUpdateTime => _lastUpdateTime;
  
  void updateLastUpdateTime() {
    _lastUpdateTime = DateTime.now();
    notifyListeners();
  }

  bool get cacheExpired {
    if (_lastUpdateTime == null) return true;
    return DateTime.now().difference(_lastUpdateTime!).inMinutes > 15;
  }
}
```

---

## 6. API Integration

### Service Template

#### Supabase 整合 Custom Actions 模板
```dart
// lib/custom_code/actions/supabase_events_service.dart
import '/backend/supabase/supabase.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/app_state.dart';

Future<List<EventsStruct>> loadEventsFromSupabase({
  int limit = 20,
  int offset = 0,
  String? categoryFilter,
  String? searchQuery,
}) async {
  try {
    var query = SupaFlow.client
        .from('v_events_list')
        .select()
        .order('start_date', ascending: false)
        .range(offset, offset + limit - 1);

    // 套用篩選條件
    if (categoryFilter != null && categoryFilter.isNotEmpty) {
      query = query.eq('category_name', categoryFilter);
    }
    
    if (searchQuery != null && searchQuery.isNotEmpty) {
      query = query.or(
        'title.ilike.%$searchQuery%,description.ilike.%$searchQuery%'
      );
    }

    final response = await query;
    
    // 使用 Custom Functions 轉換資料
    List<EventsStruct> events = [];
    for (var row in response) {
      final eventStruct = functions.convertVEventsListToEventStruct(
        row['title'] ?? '',
        row['description'] ?? '',
        row['start_date'] ?? '',
        (row['min_price'] ?? 0.0).toDouble(),
        row['image_url'] ?? '',
        row['venue_name'] ?? '',
        row['category_name'] ?? '',
        row['is_featured'] ?? false,
      );
      events.add(eventStruct);
    }

    return events;
    
  } catch (e) {
    print('Error loading events from Supabase: $e');
    // 返回快取資料或空列表
    return FFAppState().allEvents;
  }
}
```

### API Client Configuration

#### Supabase 客戶端設定與錯誤處理
```dart
// lib/custom_code/actions/supabase_client_config.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import '/app_state.dart';

class SupabaseConfig {
  // 由 FlutterFlow 自動管理，無需手動配置環境
  
  // 認證狀態監聽器
  static void setupAuthListener() {
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      final user = data.session?.user;

      switch (event) {
        case AuthChangeEvent.signedIn:
          FFAppState().setCurrentUser(user);
          _loadUserProfile(user?.id);
          break;
        case AuthChangeEvent.signedOut:
          FFAppState().clearCurrentUser();
          break;
        case AuthChangeEvent.tokenRefreshed:
          // 靜默刷新，無需特別處理
          break;
        default:
          break;
      }
    });
  }

  // 載入用戶資料
  static Future<void> _loadUserProfile(String? userId) async {
    if (userId == null) return;
    
    try {
      final response = await Supabase.instance.client
          .from('users')
          .select()
          .eq('id', userId)
          .single();
      
      FFAppState().updateUserProfile(response);
    } catch (e) {
      print('Error loading user profile: $e');
    }
  }
}

// 統一錯誤處理中間件
class ApiErrorHandler {
  static T handleSupabaseError<T>(
    dynamic error, 
    T fallbackValue,
    {String? customMessage}
  ) {
    String errorMessage = customMessage ?? '操作失敗';
    
    if (error is PostgrestException) {
      errorMessage = _mapPostgrestError(error);
    } else if (error is AuthException) {
      errorMessage = _mapAuthError(error);
    } else {
      errorMessage = '網路連線錯誤，請檢查網路設定';
    }
    
    FFAppState().setError(errorMessage);
    return fallbackValue;
  }

  static String _mapPostgrestError(PostgrestException error) {
    switch (error.code) {
      case '23505': // unique_violation
        return '資料重複，請檢查輸入';
      case '23503': // foreign_key_violation
        return '資料關聯錯誤';
      case '42501': // insufficient_privilege
        return '權限不足';
      default:
        return '資料庫操作失敗: ${error.message}';
    }
  }

  static String _mapAuthError(AuthException error) {
    switch (error.statusCode) {
      case '400':
        return '登入資料有誤';
      case '401':
        return '認證失敗，請重新登入';
      case '403':
        return '帳號被停用';
      default:
        return '認證錯誤: ${error.message}';
    }
  }
}
```

---

## 7. Routing

### Route Configuration

#### FlutterFlow 路由結構設計
```dart
// FlutterFlow 視覺化路由配置指南
// 注意：這些路由在 FlutterFlow 介面中設定，非直接程式碼

主要路由結構：
├── / (根路由)
│   └── SplashPage → 啟動頁面，檢查認證狀態
├── /onboarding
│   └── OnboardingPage → 新用戶引導流程
├── /auth
│   ├── /auth/login → LoginPage
│   ├── /auth/register → RegisterPage
│   └── /auth/forgot-password → ForgotPasswordPage
├── /main (主要應用區域)
│   ├── /main/home → HomePage (底部導航標籤 1)
│   ├── /main/explore → ExplorePage (底部導航標籤 2)
│   ├── /main/tickets → MyTicketsPage (底部導航標籤 3)
│   ├── /main/favorites → FavoritesPage (底部導航標籤 4)
│   └── /main/profile → ProfilePage (底部導航標籤 5)
├── /event
│   ├── /event/details/:eventId → EventDetailsPage
│   ├── /event/register/:eventId → EventRegistrationPage
│   ├── /event/payment/:registrationId → PaymentPage
│   └── /event/confirmation/:registrationId → ConfirmationPage
├── /ticket
│   ├── /ticket/details/:ticketId → TicketDetailsPage
│   └── /ticket/qr/:ticketId → QRCodePage
└── /settings
    ├── /settings/profile → EditProfilePage
    ├── /settings/preferences → PreferencesPage
    ├── /settings/language → LanguageSelectionPage
    └── /settings/about → AboutPage

// FlutterFlow 路由參數配置
路由參數類型：
├── Path Parameters (路徑參數)
│   ├── :eventId (String) - 事件 ID
│   ├── :ticketId (String) - 票券 ID  
│   └── :registrationId (String) - 報名 ID
├── Query Parameters (查詢參數)
│   ├── ?category=music - 分類篩選
│   ├── ?search=keyword - 搜尋關鍵字
│   └── ?lang=zh_TW - 語言設定
└── Page Parameters (頁面參數)
    ├── selectedEvent (EventsStruct) - 選中的事件物件
    ├── userTicket (VMyEventsRow) - 用戶票券資料
    └── returnPage (String) - 返回頁面路徑
```

#### Custom Actions 路由管理邏輯
```dart
// lib/custom_code/actions/navigation_manager.dart
import '/flutter_flow/flutter_flow_util.dart';
import '/app_state.dart';

// 智能導航管理器
class NavigationManager {
  // 導航到事件詳情，支援深度連結
  static Future<void> navigateToEventDetails(
    BuildContext context,
    String eventId, {
    EventsStruct? eventData,
  }) async {
    try {
      // 如果沒有事件資料，先載入
      if (eventData == null) {
        eventData = await loadEventDetails(eventId);
        if (eventData == null) {
          FFAppState().setError('找不到此事件');
          return;
        }
      }

      // 更新當前選中事件
      FFAppState().setSelectedEvent(eventData);

      // 導航到事件詳情頁
      context.pushNamed(
        'EventDetailsPage',
        pathParameters: {'eventId': eventId},
        extra: {'eventData': eventData},
      );

      // 記錄用戶行為（分析用）
      await logUserNavigation('event_details', {'event_id': eventId});
      
    } catch (e) {
      FFAppState().setError('導航錯誤：${e.toString()}');
    }
  }

  // 處理事件報名流程導航
  static Future<void> startEventRegistration(
    BuildContext context,
    String eventId,
  ) async {
    try {
      // 檢查用戶登入狀態
      if (!FFAppState().isUserLoggedIn) {
        await _navigateToLogin(context, returnPath: '/event/register/$eventId');
        return;
      }

      // 檢查是否已報名
      final isRegistered = await checkUserRegistration(
        FFAppState().currentUser?.id,
        eventId,
      );

      if (isRegistered) {
        FFAppState().setError('您已報名此活動');
        return;
      }

      // 導航到報名頁面
      context.pushNamed(
        'EventRegistrationPage',
        pathParameters: {'eventId': eventId},
      );
      
    } catch (e) {
      FFAppState().setError('無法開始報名：${e.toString()}');
    }
  }

  // 私有方法：導航到登入頁
  static Future<void> _navigateToLogin(
    BuildContext context, {
    String? returnPath,
  }) async {
    // 儲存返回路徑
    if (returnPath != null) {
      FFAppState().setReturnPath(returnPath);
    }

    context.pushReplacementNamed('LoginPage');
  }
}
```

---

## 8. Styling Guidelines

### Styling Approach

#### FlutterFlow 主題系統架構
```
FlutterFlow 主題層次結構：
├── Global Theme (全域主題)
│   ├── Primary Colors (主色彩)
│   ├── Text Styles (文字樣式)
│   ├── Component Styles (組件樣式)
│   └── Spacing & Layout (間距與佈局)
├── Light Theme (淺色主題)
│   ├── Background Colors (背景色彩)
│   ├── Surface Colors (表面色彩)
│   └── Text Colors (文字色彩)
├── Dark Theme (深色主題)
│   ├── Background Colors (深色背景)
│   ├── Surface Colors (深色表面)
│   └── Text Colors (深色文字)
└── Custom Overrides (客製化覆寫)
    ├── Event Card Styles (事件卡片樣式)
    ├── Ticket Styles (票券樣式)
    └── Category Chip Styles (分類標籤樣式)

FlutterFlow 樣式管理方式：
├── 視覺化主題編輯器 (主要方式)
│   ├── 色彩面板設定
│   ├── 文字樣式定義
│   └── 組件樣式客製化
├── Custom CSS (限定使用)
│   └── 複雜動畫和特效
└── Custom Functions (樣式計算)
    ├── 動態色彩計算
    └── 響應式尺寸計算
```

### Global Theme Variables

#### Event Platform 色彩系統
```
Event Platform 色彩架構：

主要品牌色彩 (Primary Colors)：
├── Primary: #FF6B35 (活力橘)
│   ├── primary100: #FFF4F1 (最淺)
│   ├── primary300: #FFB299 (淺)
│   ├── primary500: #FF6B35 (標準)
│   ├── primary700: #CC4420 (深)
│   └── primary900: #991F0F (最深)

輔助色彩 (Secondary Colors)：
├── Secondary: #2E86AB (海洋藍)
│   ├── secondary100: #F0F8FC
│   ├── secondary300: #8CC8E3
│   ├── secondary500: #2E86AB
│   ├── secondary700: #1D5A78
│   └── secondary900: #0F2D3C

語義色彩 (Semantic Colors)：
├── Success: #28A745 (成功綠)
├── Warning: #FFC107 (警告黃)
├── Error: #DC3545 (錯誤紅)
└── Info: #17A2B8 (資訊藍)

中性色彩 (Neutral Colors)：
├── Gray50: #FAFAFA
├── Gray100: #F5F5F5
├── Gray200: #EEEEEE
├── Gray300: #E0E0E0
├── Gray400: #BDBDBD
├── Gray500: #9E9E9E
├── Gray600: #757575
├── Gray700: #616161
├── Gray800: #424242
└── Gray900: #212121
```

#### FlutterFlow 主題配置指南
```dart
// lib/flutter_flow/flutter_flow_theme.dart
// 這是 FlutterFlow 自動生成的主題檔案配置指南

FlutterFlow 主題設定建議：

Primary Color: #FF6B35 (活力橘)
├── 用於主要 CTA 按鈕
├── 事件卡片的 "立即報名" 按鈕
├── 底部導航的選中狀態
└── 載入指示器和進度條

Secondary Color: #2E86AB (海洋藍)
├── 次要操作按鈕
├── 連結文字顏色
├── 圖標高亮顯示
└── 標籤和徽章

文字樣式層次：
├── displayLarge: 36px, Bold (頁面標題)
├── displayMedium: 30px, SemiBold (區塊標題)
├── displaySmall: 24px, SemiBold (卡片標題)
├── headlineLarge: 20px, Medium (列表項目標題)
├── headlineMedium: 18px, Medium (子標題)
├── headlineSmall: 16px, Medium (標籤文字)
├── bodyLarge: 16px, Normal (正文內容)
├── bodyMedium: 14px, Normal (描述文字)
└── bodySmall: 12px, Normal (輔助資訊)

間距系統：
├── 內容間距: 16px
├── 區塊間距: 24px
├── 頁面邊距: 20px
├── 卡片內距: 16px
└── 按鈕內距: 12px vertical, 24px horizontal
```

---

## 9. Testing Requirements

**測試策略：** 所有測試由 FlutterFlow 平台負責，包括：
- 組件功能測試
- API 整合測試
- 用戶流程測試
- 效能測試

開發者專注於：
- Custom Functions 的邏輯正確性
- Custom Actions 的錯誤處理
- 資料轉換的準確性

---

## 10. Environment Configuration

**環境管理：** 所有與 Supabase 相關的配置由 FlutterFlow 統一管理，不分環境階段。

主要配置項目：
- Supabase URL 和 API 金鑰
- 應用程式基本設定
- 多語言支援配置
- 分析和監控設定

環境配置透過 FlutterFlow 平台的環境變數功能統一管理，確保部署的一致性和安全性。

---

## 11. Frontend Developer Standards

### Critical Coding Rules

#### FlutterFlow 專用開發規範

**1. FlutterFlow 架構遵循規範**
```dart
// ✅ 正確：遵循 FlutterFlow 檔案結構
lib/custom_code/actions/load_events_action.dart     // Custom Actions
lib/custom_code/widgets/enhanced_card.dart          // Custom Widgets  
lib/flutter_flow/custom_functions.dart              // Custom Functions（統一檔案）

// ❌ 錯誤：創建 FlutterFlow 不支援的目錄結構
lib/services/event_service.dart                     // FlutterFlow 不認識
lib/utils/helpers.dart                               // 會被覆寫
```

**2. Custom Functions 編寫規範**
```dart
// ✅ 正確：純函數，無副作用，無 import 語句
String formatEventDate(String isoDate) {
  if (isoDate.isEmpty) return '';
  
  try {
    // 純 Dart 邏輯，不依賴外部套件
    final date = DateTime.parse(isoDate);
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                   'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  } catch (e) {
    return isoDate; // 安全後備
  }
}

// ❌ 錯誤：使用 import、存取全域狀態
import 'package:intl/intl.dart';  // Custom Functions 不允許 import
String formatEventDate(String isoDate) {
  return DateFormat('MMM d, y').format(DateTime.parse(isoDate));
  // 也不能存取 FFAppState()
}
```

**3. Custom Actions 規範**
```dart
// ✅ 正確：返回 Future，處理錯誤，更新 AppState
Future<List<EventsStruct>> loadEventsFromSupabase() async {
  try {
    final response = await SupaFlow.client
        .from('v_events_list')
        .select()
        .order('start_date', ascending: false);
    
    List<EventsStruct> events = [];
    for (var row in response) {
      final eventStruct = functions.convertVEventsListToEventStruct(
        row['title'] ?? '',
        row['description'] ?? '',
        row['start_date'] ?? '',
        (row['min_price'] ?? 0.0).toDouble(),
      );
      events.add(eventStruct);
    }
    
    // 更新 AppState
    FFAppState().updateAllEvents(events);
    return events;
    
  } catch (e) {
    print('載入事件失敗: $e');
    FFAppState().setError('無法載入事件');
    return FFAppState().allEvents; // 返回快取資料
  }
}
```

### Quick Reference

#### FlutterFlow 專案開發備忘單

**常用指令：**
```bash
# FlutterFlow 專案管理（在 VS Code Extension 中）
FlutterFlow: Pull latest changes     # 拉取最新代碼
FlutterFlow: Push changes           # 推送本地修改
FlutterFlow: Download project code  # 下載專案代碼

# 本地開發指令
flutter run                         # 執行應用
flutter build apk                   # 建置 Android APK
flutter build ios                   # 建置 iOS（需要 Mac）
flutter clean                       # 清理建置快取
```

**關鍵 Import 模式：**
```dart
// Custom Actions 必要 imports
import '/backend/supabase/supabase.dart';           // Supabase 客戶端
import '/backend/schema/structs/index.dart';        // 資料結構
import '/flutter_flow/custom_functions.dart' as functions;  // Custom Functions
import '/app_state.dart';                           // 全域狀態

// Custom Widgets 必要 imports
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';     // 主題系統
import '/flutter_flow/flutter_flow_util.dart';      // FlutterFlow 工具函數
```

**專案特定模式和工具：**

**1. 資料載入模式**
```dart
// 標準資料載入流程
Future<List<DataType>> loadData() async {
  try {
    FFAppState().setLoading(true);
    final data = await SupaFlow.client.from('table').select();
    final convertedData = data.map((row) => functions.convertToStruct(row)).toList();
    FFAppState().updateData(convertedData);
    return convertedData;
  } catch (e) {
    FFAppState().setError('載入失敗');
    return FFAppState().cachedData;
  } finally {
    FFAppState().setLoading(false);
  }
}
```

**2. 用戶操作模式**
```dart
// 標準用戶操作流程
Future<bool> performUserAction() async {
  if (!FFAppState().isUserLoggedIn) {
    FFAppState().setError('請先登入');
    return false;
  }
  
  try {
    // 執行操作
    await SupaFlow.client.from('table').insert(data);
    FFAppState().updateLocalState();
    return true;
  } catch (e) {
    FFAppState().setError('操作失敗');
    return false;
  }
}
```

**3. 國際化模式**
```dart
// Custom Functions 中的國際化
String getLocalizedText(String key, String locale) {
  final translations = {
    'zh_TW': {'welcome': '歡迎', 'login': '登入'},
    'en': {'welcome': 'Welcome', 'login': 'Login'},
  };
  
  return translations[locale]?[key] ?? key;
}
```

**除錯提示：**
- FlutterFlow 控制台查看即時錯誤
- 使用 `print()` 語句調試 Custom Code
- VS Code Extension 提供語法檢查
- FlutterFlow 測試模式驗證功能

**效能最佳化：**
- Custom Functions 保持輕量，避免複雜計算
- Custom Actions 中適當使用快取
- 圖片載入使用 FlutterFlow 內建優化
- 列表組件使用 FlutterFlow 的分頁功能

---

## 總結

本文檔為您的 Event Platform FlutterFlow-Supabase 整合專案提供了完整的前端架構指導。主要特色包括：

**✅ 核心優勢：**
- **FlutterFlow 原生支援：** 完全遵循 FlutterFlow 的開發模式和限制
- **現有投資保護：** 保持所有現有 UI 組件不變，零重構風險
- **Supabase 深度整合：** 充分利用您現有的 Views 架構
- **多語言就緒：** 支援繁中、英文雙語言擴展
- **開發效率優化：** 視覺化開發配合 Custom Code 的混合模式

**🔑 關鍵決策：**
- 所有複雜邏輯透過 Custom Actions 處理
- 資料轉換邏輯集中在 Custom Functions
- 狀態管理統一由 FFAppState 管理
- 測試和環境管理由 FlutterFlow 平台負責

**📋 實施重點：**
1. 嚴格遵循 FlutterFlow 的檔案結構規範
2. Custom Functions 保持純函數特性
3. 統一的錯誤處理和狀態管理模式
4. 適當的資料快取和效能優化策略

這個架構設計確保您的專案能夠順利從模擬資料過渡到實際的 Supabase 後端整合，同時保持高度的可維護性和擴展性。

---

**文件版本：** 1.0  
**建立日期：** 2025-01-09  
**建立者：** Winston (Architect)  
**審核狀態：** 已完成，準備實施