import 'package:coding_challenge/core/utilities/routers/app_guards.dart';
import 'package:coding_challenge/core/utilities/routers/app_router.dart';
import 'package:flutter/material.dart';

class ExpatrioApp extends StatefulWidget {
  const ExpatrioApp({super.key});

  @override
  State<ExpatrioApp> createState() => _ExpatrioAppState();
}

class _ExpatrioAppState extends State<ExpatrioApp> {
  final AppRouter _appRouter = AppRouter(
    authGuard: AuthGuard(),
  );
  final appTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    canvasColor: Colors.transparent,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color.fromRGBO(65, 171, 158, 1),
      selectionColor: Color.fromRGBO(65, 171, 158, 1),
      selectionHandleColor: Color.fromRGBO(65, 171, 158, 1),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme:
        ColorScheme.fromSwatch(primarySwatch: createMaterialColor(Colors.white))
            .copyWith(
      secondary: createMaterialColor(const Color.fromRGBO(65, 171, 158, 1)),
    ),
    primaryColorDark: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Flutter Expatrio Challenge',
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
