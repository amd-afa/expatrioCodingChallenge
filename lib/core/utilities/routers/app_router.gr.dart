// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return MaterialPageX<Type>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    DashboardRoute.name: (routeData) {
      return MaterialPageX<Type>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        RouteConfig(
          DashboardRoute.name,
          path: '/dashboaed',
          guards: [authGuard],
        ),
      ];
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/dashboaed',
        );

  static const String name = 'DashboardRoute';
}
