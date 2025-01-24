import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/custom_button.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/features/auth/helpers/common_widget.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  TextEditingController otpController = TextEditingController();
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
                      text: "Verify",
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.secondaryColor400,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: " Email Address",
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
                  'Enter 4 digit code you received on registered email',
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
              50.height,
              PinFieldAutoFill(
                // controller: otpController,
                decoration: UnderlineDecoration(
                  textStyle: const TextStyle(fontSize: 20, color: AppColors.primaryColor600),
                  colorBuilder: FixedColorBuilder(Colors.white.withOpacity(0.3)),
                ),
                currentCode: '',
                codeLength: 4,
                onCodeSubmitted: (code) {
                  print('code submitted $code');
                },
                onCodeChanged: (code) {
                  print('code lenggth--- $code');
                  if (code!.length == 4) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
              ),
              // Text(
              //   'Email Address',
              //   style: textTheme.bodyMedium?.copyWith(
              //     color: AppColors.secondaryColor400,
              //     fontSize: 14,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              16.height,
              RichText(
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 5,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Didnt get OTP?",
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.secondaryColor200,
                      ),
                    ),
                    TextSpan(
                      text: " Resend again",
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.secondaryColor300,
                      ),
                    ),
                  ],
                ),
              ),

              (MediaQuery.sizeOf(context).height * .15).height,
              RichText(
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 5,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Code Expires in:",
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.secondaryColor500,
                      ),
                    ),
                    TextSpan(
                      text: " 1:20",
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.primaryColor600,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              (MediaQuery.sizeOf(context).height * .25).height,

              CustomElevatedButton(
                title: 'Verify',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
