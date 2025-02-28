import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/features/auth/create_new_password/create_new_password.dart';
import 'package:soccer_mobile_app/features/auth/login/login_screen.dart';
import 'package:soccer_mobile_app/features/auth/reset_password/reset_password.dart';
import 'package:soccer_mobile_app/features/auth/sign_up/sign_up.dart';
import 'package:soccer_mobile_app/features/dashboard/dashboard_screen.dart';
import 'package:soccer_mobile_app/features/dashboard/home/widget/overview_widget.dart';
import 'package:soccer_mobile_app/features/dashboard/home/widget/player_data_widget.dart';
import 'package:soccer_mobile_app/features/dashboard/medal/widget/medal_detail_widget.dart';
import 'package:soccer_mobile_app/features/splash_screen.dart';
import 'package:soccer_mobile_app/features/type_selection.dart';
import 'package:soccer_mobile_app/features/walk_through.dart';

class AppRoutes {
  static const String initial = "/";
  static const String walkThrough = "/walkThrough";
  static const String routeTypeSelectionScreen = "/typeSelection";
  static const String routeLoginScreen = "/login";
  static const String routeResetPasswordScreen = "/resetPassword";
  static const String routeOtpVerifyScreen = "/otpVerify";
  static const String routeDashboardScreen = "/dashboard";
  static const String routeCreateNewPasswordScreen = "/newPassword";
  static const String routeMedalDetailScreen = "/medalDetail";
  static const String routeOverviewScreen = "/homeOverview";
  static const String routePlayerDataScreen = "/homePlayerData";
  static const String routeHomeDetailsScreen = "/homeDetails";
  static const String routeSignUpScreen = "/signUp";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      AppRoutes.initial: (context) => SplashScreen(),
      AppRoutes.walkThrough: (context) => const FirstWalkThrough(),
      AppRoutes.routeLoginScreen: (context) => const LoginScreen(),
      AppRoutes.routeSignUpScreen: (context) => const SignUp(),
      AppRoutes.routeTypeSelectionScreen: (context) => const TypeSelection(),
      AppRoutes.routeDashboardScreen: (context) => const DashboardScreen(),
      AppRoutes.routeResetPasswordScreen: (context) => const ResetPasswordScreen(),
      // AppRoutes.routeOtpVerifyScreen: (context) => OtpVerifyScreen(),
      AppRoutes.routeCreateNewPasswordScreen: (context) => const CreateNewPasswordScreen(),
      AppRoutes.routeMedalDetailScreen: (context) => const MedalDetailWidget(),
      AppRoutes.routeOverviewScreen: (context) => const OverviewWidget(),
      AppRoutes.routePlayerDataScreen: (context) => const PlayerDataWidget(),
      AppRoutes.routeHomeDetailsScreen: (context) => const OverviewWidget(),
    };
  }
}
