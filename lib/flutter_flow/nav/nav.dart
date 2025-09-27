import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeWidget() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : LoginWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          builder: (context, params) => HomeWidget(
            fromRegister: params.getParam(
              'fromRegister',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: MyTicketsWidget.routeName,
          path: MyTicketsWidget.routePath,
          builder: (context, params) => MyTicketsWidget(),
        ),
        FFRoute(
          name: FavoritesWidget.routeName,
          path: FavoritesWidget.routePath,
          builder: (context, params) => FavoritesWidget(),
        ),
        FFRoute(
          name: AccountWidget.routeName,
          path: AccountWidget.routePath,
          builder: (context, params) => AccountWidget(),
        ),
        FFRoute(
          name: WalkthroughWidget.routeName,
          path: WalkthroughWidget.routePath,
          builder: (context, params) => WalkthroughWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: HelpCenterWidget.routeName,
          path: HelpCenterWidget.routePath,
          builder: (context, params) => HelpCenterWidget(),
        ),
        FFRoute(
          name: HelpCenterFAQWidget.routeName,
          path: HelpCenterFAQWidget.routePath,
          builder: (context, params) => HelpCenterFAQWidget(),
        ),
        FFRoute(
          name: HelpCenterSupportWidget.routeName,
          path: HelpCenterSupportWidget.routePath,
          builder: (context, params) => HelpCenterSupportWidget(),
        ),
        FFRoute(
          name: HelpCenterPrivacyWidget.routeName,
          path: HelpCenterPrivacyWidget.routePath,
          builder: (context, params) => HelpCenterPrivacyWidget(),
        ),
        FFRoute(
          name: HelpCenterTermsWidget.routeName,
          path: HelpCenterTermsWidget.routePath,
          builder: (context, params) => HelpCenterTermsWidget(),
        ),
        FFRoute(
          name: NotificationsWidget.routeName,
          path: NotificationsWidget.routePath,
          builder: (context, params) => NotificationsWidget(),
        ),
        FFRoute(
          name: AdditionalSettingsLanguagesWidget.routeName,
          path: AdditionalSettingsLanguagesWidget.routePath,
          builder: (context, params) => AdditionalSettingsLanguagesWidget(),
        ),
        FFRoute(
          name: PaymentWidget.routeName,
          path: PaymentWidget.routePath,
          builder: (context, params) => PaymentWidget(),
        ),
        FFRoute(
          name: SecurityWidget.routeName,
          path: SecurityWidget.routePath,
          builder: (context, params) => SecurityWidget(),
        ),
        FFRoute(
          name: AboutAppWidget.routeName,
          path: AboutAppWidget.routePath,
          builder: (context, params) => AboutAppWidget(),
        ),
        FFRoute(
          name: InviteFriendsWidget.routeName,
          path: InviteFriendsWidget.routePath,
          builder: (context, params) => InviteFriendsWidget(),
        ),
        FFRoute(
          name: AccountEditWidget.routeName,
          path: AccountEditWidget.routePath,
          builder: (context, params) => AccountEditWidget(),
        ),
        FFRoute(
          name: LoginEmailWidget.routeName,
          path: LoginEmailWidget.routePath,
          builder: (context, params) => LoginEmailWidget(),
        ),
        FFRoute(
          name: ForgotPasswordWidget.routeName,
          path: ForgotPasswordWidget.routePath,
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: ForgotPassword2Widget.routeName,
          path: ForgotPassword2Widget.routePath,
          builder: (context, params) => ForgotPassword2Widget(),
        ),
        FFRoute(
          name: ForgotPassword3Widget.routeName,
          path: ForgotPassword3Widget.routePath,
          builder: (context, params) => ForgotPassword3Widget(),
        ),
        FFRoute(
          name: QuestionsWidget.routeName,
          path: QuestionsWidget.routePath,
          builder: (context, params) => QuestionsWidget(),
        ),
        FFRoute(
          name: NotificatiosWidget.routeName,
          path: NotificatiosWidget.routePath,
          builder: (context, params) => NotificatiosWidget(),
        ),
        FFRoute(
          name: Reschedule1Widget.routeName,
          path: Reschedule1Widget.routePath,
          builder: (context, params) => Reschedule1Widget(),
        ),
        FFRoute(
          name: SimpleCalendarWidget.routeName,
          path: SimpleCalendarWidget.routePath,
          builder: (context, params) => SimpleCalendarWidget(),
        ),
        FFRoute(
          name: Reschedule2Widget.routeName,
          path: Reschedule2Widget.routePath,
          builder: (context, params) => Reschedule2Widget(),
        ),
        FFRoute(
          name: CancelTicketReasonsWidget.routeName,
          path: CancelTicketReasonsWidget.routePath,
          builder: (context, params) => CancelTicketReasonsWidget(),
        ),
        FFRoute(
          name: MyTicketsSingleWidget.routeName,
          path: MyTicketsSingleWidget.routePath,
          builder: (context, params) => MyTicketsSingleWidget(
            data: params.getParam(
              'data',
              ParamType.DataStruct,
              isList: false,
              structBuilder: EventsStruct.fromSerializableMap,
            ),
            isCompleted: params.getParam(
              'isCompleted',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: LeaveReviewWidget.routeName,
          path: LeaveReviewWidget.routePath,
          builder: (context, params) => LeaveReviewWidget(
            title: params.getParam(
              'title',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ExploreWidget.routeName,
          path: ExploreWidget.routePath,
          builder: (context, params) => ExploreWidget(),
        ),
        FFRoute(
          name: PaymentMethodWidget.routeName,
          path: PaymentMethodWidget.routePath,
          builder: (context, params) => PaymentMethodWidget(),
        ),
        FFRoute(
          name: ExploreSearchWidget.routeName,
          path: ExploreSearchWidget.routePath,
          builder: (context, params) => ExploreSearchWidget(
            filterType: params.getParam(
              'filterType',
              ParamType.String,
            ),
            startHour: params.getParam(
              'startHour',
              ParamType.String,
            ),
            minRating: params.getParam(
              'minRating',
              ParamType.String,
            ),
            city: params.getParam(
              'city',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PaymentAddCardWidget.routeName,
          path: PaymentAddCardWidget.routePath,
          builder: (context, params) => PaymentAddCardWidget(),
        ),
        FFRoute(
          name: AdditionalSettingsWidget.routeName,
          path: AdditionalSettingsWidget.routePath,
          builder: (context, params) => AdditionalSettingsWidget(),
        ),
        FFRoute(
          name: LocationWidget.routeName,
          path: LocationWidget.routePath,
          builder: (context, params) => LocationWidget(),
        ),
        FFRoute(
          name: MessageSupportWidget.routeName,
          path: MessageSupportWidget.routePath,
          builder: (context, params) => MessageSupportWidget(),
        ),
        FFRoute(
          name: SingleEventWidget.routeName,
          path: SingleEventWidget.routePath,
          builder: (context, params) => SingleEventWidget(
            data: params.getParam(
              'data',
              ParamType.DataStruct,
              isList: false,
              structBuilder: EventsStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: ReportEventWidget.routeName,
          path: ReportEventWidget.routePath,
          builder: (context, params) => ReportEventWidget(),
        ),
        FFRoute(
          name: SingleEventCheckoutWidget.routeName,
          path: SingleEventCheckoutWidget.routePath,
          builder: (context, params) => SingleEventCheckoutWidget(
            eventData: params.getParam(
              'eventData',
              ParamType.DataStruct,
              isList: false,
              structBuilder: EventsStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: PaymentMethodAddWidget.routeName,
          path: PaymentMethodAddWidget.routePath,
          builder: (context, params) => PaymentMethodAddWidget(),
        ),
        FFRoute(
          name: SingleEventCheckoutSuccessWidget.routeName,
          path: SingleEventCheckoutSuccessWidget.routePath,
          builder: (context, params) => SingleEventCheckoutSuccessWidget(
            eventData: params.getParam(
              'eventData',
              ParamType.DataStruct,
              isList: false,
              structBuilder: EventsStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: SingleEventOwnerWidget.routeName,
          path: SingleEventOwnerWidget.routePath,
          builder: (context, params) => SingleEventOwnerWidget(),
        ),
        FFRoute(
          name: LostItemsWidget.routeName,
          path: LostItemsWidget.routePath,
          builder: (context, params) => LostItemsWidget(),
        ),
        FFRoute(
          name: MyTicketsSearchWidget.routeName,
          path: MyTicketsSearchWidget.routePath,
          builder: (context, params) => MyTicketsSearchWidget(),
        ),
        FFRoute(
          name: LoginEmail2Widget.routeName,
          path: LoginEmail2Widget.routePath,
          builder: (context, params) => LoginEmail2Widget(),
        ),
        FFRoute(
          name: AllowNotificationsWidget.routeName,
          path: AllowNotificationsWidget.routePath,
          builder: (context, params) => AllowNotificationsWidget(),
        ),
        FFRoute(
          name: SingleEvent2Widget.routeName,
          path: SingleEvent2Widget.routePath,
          builder: (context, params) => SingleEvent2Widget(
            data: params.getParam(
              'data',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TrandingEventsStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: FindNewEventsWidget.routeName,
          path: FindNewEventsWidget.routePath,
          builder: (context, params) => FindNewEventsWidget(),
        ),
        FFRoute(
          name: HelpCenterPartnerWidget.routeName,
          path: HelpCenterPartnerWidget.routePath,
          builder: (context, params) => HelpCenterPartnerWidget(),
        ),
        FFRoute(
          name: MyTicketTestWidget.routeName,
          path: MyTicketTestWidget.routePath,
          builder: (context, params) => MyTicketTestWidget(),
        ),
        FFRoute(
          name: RegisterWidget.routeName,
          path: RegisterWidget.routePath,
          builder: (context, params) => RegisterWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/rfefrgrr.gif',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
