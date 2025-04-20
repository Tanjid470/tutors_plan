part of 'app_pages.dart';
abstract class Routes {
  Routes._();
  static const dashboardView = _Paths.dashboardView;
  static const loginView = _Paths.loginView;
}

abstract class _Paths {
  _Paths._();
  static const dashboardView = '/dashboard_view';
  static const loginView = '/login_view';
}