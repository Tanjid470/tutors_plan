part of 'app_pages.dart';
abstract class RouteNames {
  RouteNames._();
  static const bottomNavigationWidget = _Paths.bottomNavigationWidget;
  static const onboardView = _Paths.onboardView;
  static const dashboardView = _Paths.dashboardView;
  static const loginView = _Paths.loginView;
}

abstract class _Paths {
  _Paths._();
  static const bottomNavigationWidget = '/bottom_navigation_widget';
  static const onboardView = '/onboard_view';
  static const dashboardView = '/dashboard_view';
  static const loginView = '/login_view';
}