import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:soccer_mobile_app/Provider/auth_provider.dart';
import 'package:soccer_mobile_app/Utils/Helpers/helper_functions.dart';
import 'package:soccer_mobile_app/config/routes/app_navigation.dart';
import 'package:soccer_mobile_app/config/routes/app_routes.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/custom_button.dart';
import 'package:soccer_mobile_app/core/components/custom_text_field.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/features/auth/helpers/common_widget.dart';
import 'package:soccer_mobile_app/features/auth/helpers/login_hooks.dart';

class LoginScreen extends HookWidget {
  final dynamic arguments;
  const LoginScreen({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final loginProvider = context.read<AuthProvider>();
    final loginHooks = useLoginHooks();
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
              WidgetTextField(
                controller: loginHooks.emailController,
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
                controller: loginHooks.passController,
                hintText: '**********',
                suffix: InkWell(
                  onTap: () {
                    loginHooks.isObscure.value = !loginHooks.isObscure.value;
                  },
                  child: Icon(
                    loginHooks.isObscure.value ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.secondaryColor600,
                    size: 18,
                  ),
                ),
                isObscureText: loginHooks.isObscure.value,
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
                  String? error;
                  if (loginHooks.emailController.text.isEmpty || loginHooks.passController.text.isEmpty) {
                    error = 'Please fill the required fields!';
                  } else if (!loginHooks.isEmailValid.value) {
                    error = 'Invalid Email format!';
                  } else if (!loginHooks.isPassValid.value) {
                    error = 'Password must be at least 8 characters long!';
                  } else {
                    error = '';
                  }
                  if (error != '') {
                    HelperFunctions.showErrorToast(error);
                    return;
                  } else {
                    loginProvider.login(Map<String, dynamic>.from({'email': loginHooks.emailController.text, 'password': loginHooks.passController.text}));
                  }
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
          ),
        ),
      ),
    );
  }
}
