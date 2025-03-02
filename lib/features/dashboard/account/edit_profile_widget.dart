import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:soccer_mobile_app/Models/data/auth/login_dm.dart';
import 'package:soccer_mobile_app/Provider/auth_provider.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/common_phone_picker.dart';
import 'package:soccer_mobile_app/core/components/custom_button.dart';
import 'package:soccer_mobile_app/core/components/custom_text_field.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/features/auth/helpers/common_widget.dart';
import 'package:soccer_mobile_app/features/auth/helpers/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey _phoneKey = GlobalKey();

  late AuthProvider authProvider;
  LoginResponse? response;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.getProfile();
  }

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
                    'Edit Profile',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryColor400,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  24.height,
                  const WidgetImagePicker(),
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
                  CommonPhonePicker(
                    controller: TextEditingController(text: signUpProvider.phoneNum),
                    hintText: '+123456789',
                    keys: _phoneKey,
                    isoCode: signUpProvider.phoneIso,
                    onChanged: (PhoneNumber phone) {
                      signUpProvider.phoneNum = phone.phoneNumber!;
                      signUpProvider.phoneIso = phone.isoCode!;
                      String phoneWithoutCountryCode = signUpProvider.phoneNum.replaceFirst("${phone.dialCode}", '');
                      if (phoneWithoutCountryCode.isNotEmpty) {
                        signUpProvider.phoneController.text = signUpProvider.phoneNum;
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
                    title: 'Update',
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      signUpProvider.updateProfile().then((value) {
                        signUpProvider.getProfile();
                      });
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
