import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/custom_button.dart';
import 'package:soccer_mobile_app/core/components/custom_text_field.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/features/auth/helpers/common_widget.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  TextEditingController newPassController = TextEditingController();
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
                      text: "Create New",
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
              50.height,
              Text(
                'New Password',
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondaryColor400,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              12.height,
              WidgetTextField(controller: passController),
              12.height,
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Circular Container
                  Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor600, // You can change the color
                      shape: BoxShape.circle,
                    ),
                  ),
                  8.width,
                  Text(
                    'Minimum of 8 characters',
                    style: textTheme.bodySmall?.copyWith(color: AppColors.secondaryColor600),
                  ),
                ],
              ),
              8.height,
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Circular Container
                  Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor600, // You can change the color
                      shape: BoxShape.circle,
                    ),
                  ),
                  8.width,
                  Text(
                    'Uppercase, Lowercase letter and one numeric.',
                    style: textTheme.bodySmall?.copyWith(color: AppColors.secondaryColor600),
                  ),
                ],
              ),
              24.height,
              Text(
                'Confirm New Password',
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondaryColor400,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              12.height,
              WidgetTextField(controller: newPassController),
              (MediaQuery.sizeOf(context).height * .25).height,
              CustomElevatedButton(
                title: 'Save Password',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
