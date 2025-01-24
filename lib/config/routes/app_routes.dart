import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/features/auth/create_new_password/create_new_password.dart';
import 'package:soccer_mobile_app/features/auth/login/login_screen.dart';
import 'package:soccer_mobile_app/features/auth/otp_verification/otp_verification.dart';
import 'package:soccer_mobile_app/features/auth/reset_password/reset_password.dart';
import 'package:soccer_mobile_app/features/dashboard/home/widget/overview_widget.dart';
import 'package:soccer_mobile_app/features/dashboard/medal/widget/medal_detail_widget.dart';
import 'package:soccer_mobile_app/features/splash_screen.dart';

class AppRoutes {
  static const String initial = "/";
  static const String routeLoginScreen = "/login";
  static const String routeResetPasswordScreen = "/resetPassword";
  static const String routeOtpVerifyScreen = "/otpVerify";
  static const String routeCreateNewPasswordScreen = "/newPassword";
  static const String routeMedalDetailScreen = "/medalDetail";
  static const String routeOverviewScreen = "/homeOverview";
  static const String routePlayerDataScreen = "/homePlayerData";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      AppRoutes.initial: (context) => const SplashScreen(),
      AppRoutes.routeLoginScreen: (context) => const LoginScreen(),
      AppRoutes.routeResetPasswordScreen: (context) => const ResetPasswordScreen(),
      AppRoutes.routeOtpVerifyScreen: (context) => const OtpVerifyScreen(),
      AppRoutes.routeCreateNewPasswordScreen: (context) => const CreateNewPasswordScreen(),
      AppRoutes.routeMedalDetailScreen: (context) => const MedalDetailWidget(),
      AppRoutes.routeOverviewScreen: (context) => const OverviewWidget(),
      AppRoutes.routePlayerDataScreen: (context) => const OverviewWidget(),
    };
  }
}
