import 'package:auto_route/auto_route.dart';
import 'package:coding_challenge/core/utilities/routers/app_guards.dart';
import 'package:flutter/material.dart';
import 'package:coding_challenge/features/dashboard/view/dashboard_screen.dart';
import 'package:coding_challenge/features/login/view/login_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute<Type>(
      path: '/',
      page: LoginScreen,
    ),
    AutoRoute<Type>(
      path: '/dashboaed',
      page: DashboardScreen,
      guards: <Type>[AuthGuard],
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({
    required super.authGuard,
  });
}
