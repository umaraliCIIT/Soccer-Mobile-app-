import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:soccer_mobile_app/Provider/auth_provider.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/common_phone_picker.dart';
import 'package:soccer_mobile_app/core/components/custom_button.dart';
import 'package:soccer_mobile_app/core/components/custom_text_field.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/features/auth/helpers/common_widget.dart';
import 'package:soccer_mobile_app/features/auth/helpers/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey _phoneKey = GlobalKey();
  String phoneNum = '';
  String phoneIso = "";

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.blackColor500,
      resizeToAvoidBottomInset: true,
      body: CommonWidget(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // Adjusts padding when keyboard opens
          ),
          child: Consumer<AuthProvider>(
            builder: (context, signUpProvider, c) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryColor400,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  6.height,
                  Text(
                    'Create your account',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryColor600,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  24.height,
                  WidgetImagePicker(),
                  24.height,
                  WidgetTextField(
                    controller: signUpProvider.fNameController,
                    hintText: 'First Name',
                  ),
                  24.height,
                  WidgetTextField(
                    controller: signUpProvider.lNameController,
                    hintText: 'Last Name',
                  ),
                  24.height,
                  WidgetTextField(
                    controller: signUpProvider.emailController,
                    hintText: 'abc@example.com',
                  ),
                  24.height,
                  WidgetTextField(
                    controller: signUpProvider.passController,
                    hintText: '**********',
                    suffix: InkWell(
                      onTap: () {
                        signUpProvider.setObscure();
                      },
                      child: Icon(
                        signUpProvider.isObscure ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.secondaryColor600,
                        size: 18,
                      ),
                    ),
                    isObscureText: signUpProvider.isObscure,
                  ),
                  24.height,
                  CommonPhonePicker(
                    controller: TextEditingController(text: phoneNum),
                    hintText: '+123456789',
                    keys: _phoneKey,
                    isoCode: phoneIso,
                    onChanged: (PhoneNumber phone) {
                      phoneNum = phone.phoneNumber!;
                      phoneIso = phone.isoCode!;
                      String phoneWithoutCountryCode = phoneNum.replaceFirst("${phone.dialCode}", '');
                      print("login format is:${phone.phoneNumber!.isNotEmpty} ${phone.phoneNumber} $phoneIso // $phoneWithoutCountryCode ");
                      if (phoneWithoutCountryCode.isNotEmpty) {
                        signUpProvider.phoneController.text = phoneNum;
                      }
                      setState(() {});
                    },
                    textInputType: TextInputType.phone,
                    onFieldSubmit: (_) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  50.height,
                  CustomElevatedButton(
                    title: 'Sign Up',
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      signUpProvider.signup();
                    },
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
