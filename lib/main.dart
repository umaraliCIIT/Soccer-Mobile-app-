import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:soccer_mobile_app/Models/data/auth/login_dm.dart';
import 'package:soccer_mobile_app/Utils/Constants/storage_keys.dart';
import 'package:toastification/toastification.dart';

import 'Provider/app_provider.dart';
import 'config/routes/app_navigation.dart';
import 'config/routes/app_routes.dart';
import 'config/routes/routes_generator.dart';
import 'config/theme/app_theme.dart';
import 'core/constants/app_constant.dart';

final box = GetStorage();

void main() async {
  await GetStorage.init();

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
    var response = box.read(Storage.userData);
    var result = box.read(Storage.userRole);

    return ToastificationWrapper(
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          title: AppConstant.appName,
          debugShowCheckedModeBanner: false,
          theme: AppThemes.defaultTheme,
          routes: AppRoutes.getRoutes(),
          navigatorKey: AppNavigation.navigatorKey,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: response != null
              ? (result != null && result == 'admin')
                  ? LoginResponse.fromJson(response).token != null
                      ? AppRoutes.routeDashboardScreen
                      : AppRoutes.initial
                  : LoginResponse.fromJson(response).data!.isVerified!
                      ? AppRoutes.routeDashboardScreen
                      : AppRoutes.routeLoginScreen
              : AppRoutes.initial,
          // home: DashboardScreen(),
        ),
      ),
    );
  }
}
