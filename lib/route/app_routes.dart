part of 'app_pages.dart';
abstract class RouteNames {
  RouteNames._();
  static const onboardView = _Paths.onboardView;
  static const dashboardView = _Paths.dashboardView;
  static const loginView = _Paths.loginView;
}

abstract class _Paths {
  _Paths._();
  static const onboardView = '/onboard_view';
  static const dashboardView = '/dashboard_view';
  static const loginView = '/login_view';
}