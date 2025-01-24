import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/routes/app_routes.dart';
import 'package:soccer_mobile_app/features/auth/create_new_password/create_new_password.dart';
import 'package:soccer_mobile_app/features/auth/login/login_screen.dart';
import 'package:soccer_mobile_app/features/auth/otp_verification/otp_verification.dart';
import 'package:soccer_mobile_app/features/auth/reset_password/reset_password.dart';
import 'package:soccer_mobile_app/features/dashboard/home/widget/overview_widget.dart';
import 'package:soccer_mobile_app/features/dashboard/home/widget/player_data_widget.dart';
import 'package:soccer_mobile_app/features/dashboard/medal/widget/medal_detail_widget.dart';
import 'package:soccer_mobile_app/features/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
        return _screenRoute(screen: const SplashScreen());
      case AppRoutes.routeLoginScreen:
        return _screenRoute(screen: const LoginScreen());
      case AppRoutes.routeResetPasswordScreen:
        return _screenRoute(screen: const ResetPasswordScreen());
      case AppRoutes.routeOtpVerifyScreen:
        return _screenRoute(screen: const OtpVerifyScreen());
      case AppRoutes.routeCreateNewPasswordScreen:
        return _screenRoute(screen: const CreateNewPasswordScreen());
      case AppRoutes.routeMedalDetailScreen:
        return _screenRoute(screen: const MedalDetailWidget());
      case AppRoutes.routeOverviewScreen:
        return _screenRoute(screen: const OverviewWidget());
      case AppRoutes.routePlayerDataScreen:
        return _screenRoute(screen: const PlayerDataWidget());

      default:
        return _screenRoute(screen: const SplashScreen());
    }
  }

  static Route<dynamic> _screenRoute({Widget? screen}) {
    return MaterialPageRoute(builder: (context) => screen!);
  }
}
