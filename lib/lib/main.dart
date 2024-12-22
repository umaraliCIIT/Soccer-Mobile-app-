import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'Provider/app_provider.dart';
import 'config/routes/app_navigation.dart';
import 'config/routes/app_routes.dart';
import 'config/routes/routes_generator.dart';
import 'config/theme/app_theme.dart';
import 'core/constants/app_constant.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: appProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        title: AppConstant.appName,
        debugShowCheckedModeBanner: false,
        theme: AppThemes.defaultTheme,
        routes: AppRoutes.getRoutes(),
        navigatorKey: AppNavigation.navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
