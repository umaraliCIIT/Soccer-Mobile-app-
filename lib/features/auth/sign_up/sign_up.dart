import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:soccer_mobile_app/Provider/auth_provider.dart';
import 'package:soccer_mobile_app/Utils/Helpers/helper_functions.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/common_phone_picker.dart';
import 'package:soccer_mobile_app/core/components/custom_button.dart';
import 'package:soccer_mobile_app/core/components/custom_text_field.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/features/auth/helpers/common_widget.dart';
import 'package:soccer_mobile_app/features/auth/helpers/image_picker.dart';
import 'package:soccer_mobile_app/features/auth/helpers/sign_up_hooks.dart';

/*
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
*/

class SignUp extends HookWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final authProvider = context.read<AuthProvider>(); // Use context.read
    final signUpHooks = useSignUpHooks();

    return Scaffold(
      backgroundColor: AppColors.blackColor500,
      resizeToAvoidBottomInset: true,
      body: CommonWidget(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
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
              const WidgetImagePicker(), // Assuming this handles its own state or uses AuthProvider
              24.height,
              WidgetTextField(
                controller: signUpHooks.fNameController,
                hintText: 'First Name',
              ),
              // You can add validation messages based on signUpHooks.isFNameValidNotifier.value if needed
              24.height,
              WidgetTextField(
                controller: signUpHooks.lNameController,
                hintText: 'Last Name',
              ),
              24.height,
              WidgetTextField(
                controller: signUpHooks.emailController,
                hintText: 'abc@example.com',
              ),
              24.height,
              WidgetTextField(
                controller: signUpHooks.passController,
                hintText: '**********',
                suffix: InkWell(
                  onTap: () {
                    signUpHooks.isObscureNotifier.value = !signUpHooks.isObscureNotifier.value;
                  },
                  child: Icon(
                    signUpHooks.isObscureNotifier.value ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.secondaryColor600,
                    size: 18,
                  ),
                ),
                isObscureText: signUpHooks.isObscureNotifier.value,
              ),
              24.height,

              CommonPhonePicker(
                controller: TextEditingController(text: signUpHooks.phoneNumberNotifier.value), // For UI part if needed
                hintText: '+123456789',
                keys: signUpHooks.phoneKey,
                isoCode: signUpHooks.phoneIsoNotifier.value,
                onChanged: (PhoneNumber phone) {
                  signUpHooks.phoneNumberNotifier.value = phone.phoneNumber ?? ''; // Store just the number part for UI
                  signUpHooks.phoneIsoNotifier.value = phone.isoCode ?? '';
                  String phoneWithoutCountryCode = signUpHooks.phoneNumberNotifier.value.replaceFirst("${phone.dialCode}", '');

                  if (phoneWithoutCountryCode.isNotEmpty) {
                    signUpHooks.phoneController.text = phone.phoneNumber ?? '';
                  }
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

                  // Validation logic (similar to LoginScreen)
                  String? error;
                  if (signUpHooks.fNameController.text.isEmpty) {
                    error = 'Please enter your first name.';
                  } else if (signUpHooks.lNameController.text.isEmpty) {
                    error = 'Please enter your last name.';
                  } else if (signUpHooks.emailController.text.isEmpty) {
                    error = 'Please enter your email.';
                  } else if (!signUpHooks.isEmailValidNotifier.value) {
                    error = 'Invalid email format.';
                  } else if (signUpHooks.passController.text.isEmpty) {
                    error = 'Please enter a password.';
                  } else if (!signUpHooks.isPassValidNotifier.value) {
                    error = 'Password must be at least 8 characters long.';
                  } else if (signUpHooks.phoneController.text.isEmpty) {
                    // This uses the controller holding the full E.164 number
                    error = 'Please enter your phone number.';
                  }
                  // Add more validation checks as needed (e.g., for isPhoneValidNotifier if you have complex logic)

                  if (error != null && error.isNotEmpty) {
                    HelperFunctions.showErrorToast(error); // Make sure this function exists
                    return;
                  }
                  // If all valid, proceed with signup
                  // Prepare data for AuthProvider.
                  // This assumes AuthProvider's signup method takes a Map or individual parameters.
                  // Also, WidgetImagePicker needs to somehow provide the image to AuthProvider.
                  // This example focuses on the text fields.
                  final signUpData = {
                    'firstName': signUpHooks.fNameController.text,
                    'lastName': signUpHooks.lNameController.text,
                    'email': signUpHooks.emailController.text,
                    'password': signUpHooks.passController.text,
                    'phoneNumber': signUpHooks.phoneController.text, // Full international number
                    // 'profileImage': ... // Get this from WidgetImagePicker or AuthProvider's state
                  };

                  // If AuthProvider has its own controllers for these fields,
                  // you might need to update them like this (though less ideal with hooks):
                  // authProvider.fNameController.text = signUpHooks.fNameController.text;
                  // authProvider.lNameController.text = signUpHooks.lNameController.text;
                  // authProvider.emailController.text = signUpHooks.emailController.text;
                  // authProvider.passController.text = signUpHooks.passController.text;
                  // authProvider.phoneController.text = signUpHooks.phoneController.text;

                  // Call AuthProvider's signup method
                  authProvider.signup(signUpData); // Or however your signup method is defined
                },
              ),
              // Optional: Add "Already have an account? Login" text
            ],
          ),
        ),
      ),
    );
  }
}
