import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_mobile_app/Provider/auth_provider.dart';
import 'package:soccer_mobile_app/config/routes/app_navigation.dart';
import 'package:soccer_mobile_app/config/routes/app_routes.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/custom_button.dart';
import 'package:soccer_mobile_app/core/components/custom_text_field.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/features/auth/helpers/common_widget.dart';

class LoginScreen extends StatefulWidget {
  final dynamic arguments;
  const LoginScreen({super.key, this.arguments});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.blackColor500,
      resizeToAvoidBottomInset: true,
      body: CommonWidget(
        child: SingleChildScrollView(
          child: Consumer<AuthProvider>(
            builder: (context, loginProvider, c) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Welcome',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryColor400,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  6.height,
                  Text(
                    'Login to your account',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryColor600,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  24.height,
                  Text(
                    'Email Address',
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryColor400,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  12.height,
                  WidgetTextField(
                    controller: loginProvider.emailController,
                    hintText: 'abc@example.com',
                  ),
                  24.height,
                  Text(
                    'Password',
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryColor400,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  12.height,
                  WidgetTextField(
                    controller: loginProvider.passController,
                    hintText: '**********',
                    suffix: InkWell(
                      onTap: () {
                        loginProvider.setObscure();
                      },
                      child: Icon(
                        loginProvider.isObscure ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.secondaryColor600,
                        size: 18,
                      ),
                    ),
                    isObscureText: loginProvider.isObscure,
                  ),
                  16.height,
                  InkWell(
                    onTap: () {
                      AppNavigation.navigateTo(AppRoutes.routeResetPasswordScreen);
                    },
                    child: Text(
                      'Forget your Password?',
                      textAlign: TextAlign.end,
                      style: textTheme.headlineSmall?.copyWith(
                        color: AppColors.secondaryColor300,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  50.height,
                  CustomElevatedButton(
                    title: 'Login',
                    onPressed: () {
                      loginProvider.login();
                    },
                  ),
                  50.height,
                  InkWell(
                    onTap: () => AppNavigation.navigateTo(AppRoutes.routeSignUpScreen),
                    child: RichText(
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 5,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account?",
                            style: textTheme.bodySmall?.copyWith(
                              color: AppColors.secondaryColor200,
                            ),
                          ),
                          TextSpan(
                            text: " Sign Up",
                            style: textTheme.headlineSmall?.copyWith(
                              color: AppColors.secondaryColor300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
