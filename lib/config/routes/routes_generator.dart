import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/routes/app_routes.dart';
import 'package:soccer_mobile_app/features/auth/create_new_password/create_new_password.dart';
import 'package:soccer_mobile_app/features/auth/login/login_screen.dart';
import 'package:soccer_mobile_app/features/auth/otp_verification/otp_verification.dart';
import 'package:soccer_mobile_app/features/auth/reset_password/reset_password.dart';
import 'package:soccer_mobile_app/features/auth/sign_up/sign_up.dart';
import 'package:soccer_mobile_app/features/dashboard/account/edit_profile_widget.dart';
import 'package:soccer_mobile_app/features/dashboard/dashboard_screen.dart';
import 'package:soccer_mobile_app/features/dashboard/home/widget/overview_widget.dart';
import 'package:soccer_mobile_app/features/dashboard/home/widget/player_data_widget.dart';
import 'package:soccer_mobile_app/features/dashboard/home/widget/student_requests.dart';
import 'package:soccer_mobile_app/features/dashboard/medal/widget/medal_detail_widget.dart';
import 'package:soccer_mobile_app/features/splash_screen.dart';
import 'package:soccer_mobile_app/features/type_selection.dart';
import 'package:soccer_mobile_app/features/walk_through.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
        return _screenRoute(screen: SplashScreen());
      case AppRoutes.walkThrough:
        return _screenRoute(screen: const FirstWalkThrough());
      case AppRoutes.routeSignUpScreen:
        return _screenRoute(screen: const SignUp());
      case AppRoutes.routeDashboardScreen:
        return _screenRoute(screen: const DashboardScreen());
      case AppRoutes.routeLoginScreen:
        return _screenRoute(screen: LoginScreen(arguments: settings.arguments));
      case AppRoutes.routeTypeSelectionScreen:
        return _screenRoute(screen: const TypeSelection());
      case AppRoutes.routeResetPasswordScreen:
        return _screenRoute(screen: const ResetPasswordScreen());
      case AppRoutes.routeOtpVerifyScreen:
        return _screenRoute(
            screen: OtpVerifyScreen(
          arguments: settings.arguments,
        ));
      case AppRoutes.routeCreateNewPasswordScreen:
        return _screenRoute(
            screen: CreateNewPasswordScreen(
          isProfile: settings.arguments as bool,
        ));
      case AppRoutes.routeMedalDetailScreen:
        return _screenRoute(screen: const MedalDetailWidget());
      case AppRoutes.routeEditProfileScreen:
        return _screenRoute(screen: const ProfileScreen());
      case AppRoutes.routeHomeDetailsScreen:
        return _screenRoute(
            screen: OverviewWidget(
          arguments: settings.arguments as Map<String, dynamic>,
        ));
      case AppRoutes.routePlayerDataScreen:
        return _screenRoute(screen: const PlayerDataWidget());
      case AppRoutes.routeStudentRequestScreen:
        return _screenRoute(
            screen: StudentRequests(
          arguments: settings.arguments,
        ));

      default:
        return _screenRoute(
            screen: LoginScreen(
          arguments: settings.arguments,
        ));
    }
  }

  static Route<dynamic> _screenRoute({Widget? screen}) {
    return MaterialPageRoute(builder: (context) => screen!);
  }
}
