import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/routes/app_navigation.dart';
import 'package:soccer_mobile_app/config/routes/app_routes.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/custom_button.dart';
import 'package:soccer_mobile_app/core/components/custom_text_field.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/features/auth/helpers/common_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.blackColor500,
      resizeToAvoidBottomInset: true,
      body: CommonWidget(
        child: SingleChildScrollView(
          child: Column(
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
              WidgetTextField(controller: emailController),
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
              WidgetTextField(controller: passController),
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
                  ),
                ),
              ),
              50.height,
              CustomElevatedButton(
                title: 'Login',
                onPressed: () {},
              ),
              50.height,
              RichText(
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
            ],
          ),
        ),
      ),
    );
  }
}
