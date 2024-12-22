import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/lib/config/routes/app_routes.dart';
import 'package:soccer_mobile_app/lib/features/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
        return _screenRoute(screen: const SplashScreen());

      default:
        return _screenRoute(screen: const SplashScreen());
    }
  }

  static Route<dynamic> _screenRoute({Widget? screen}) {
    return MaterialPageRoute(builder: (context) => screen!);
  }
}
