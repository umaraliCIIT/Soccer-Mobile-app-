import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_mobile_app/Provider/auth_provider.dart';
import 'package:soccer_mobile_app/config/routes/app_navigation.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/custom_button.dart';
import 'package:soccer_mobile_app/core/components/custom_text_field.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/features/auth/helpers/common_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.blackColor500,
      resizeToAvoidBottomInset: true,
      body: CommonWidget(
        child: SingleChildScrollView(
          child: Consumer<AuthProvider>(builder: (c, resetProvider, x) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  maxLines: 5,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Reset",
                        style: textTheme.bodySmall?.copyWith(
                          color: AppColors.secondaryColor400,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: " Password",
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppColors.secondaryColor400,
                        ),
                      ),
                    ],
                  ),
                ),
                6.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Text(
                    'Enter your email address you registered with club',
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    softWrap: true,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryColor600,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
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
                WidgetTextField(controller: resetProvider.emailController),
                50.height,
                CustomElevatedButton(
                  title: 'Send Verification',
                  onPressed: () {
                    resetProvider.resetPassword();
                  },
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .7,
                  child: InkWell(
                    onTap: () {
                      AppNavigation.goBack();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.rotate(
                          angle: 180 * 3.1415926535897932 / 180, // Rotate 180 degrees (π radians)
                          child: const Icon(
                            Icons.arrow_right_alt_rounded,
                            color: AppColors.whiteColor,
                            size: 30, // You can set the size as per your requirement
                          ),
                        ),
                        Text(
                          'Back to login',
                          style: textTheme.headlineSmall?.copyWith(color: AppColors.secondaryColor500),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
