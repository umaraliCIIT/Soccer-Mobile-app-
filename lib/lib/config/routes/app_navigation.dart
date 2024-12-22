import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppNavigation {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext? get currentContext => navigatorKey.currentState?.overlay?.context;

  static goBack() {
    return navigatorKey.currentState!.pop();
  }

  static bool canGoback() {
    return navigatorKey.currentState!.canPop();
  }

  static Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  static void popUntil(String routeName) {
    navigatorKey.currentState!.popUntil((route) {
      return route.settings.name == routeName;
    });
  }

  static Future<dynamic> pushAndKillAll(String routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, ModalRoute.withName(AppRoutes.initial));
  }

  static Future<dynamic> pushReplacementTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }
}
