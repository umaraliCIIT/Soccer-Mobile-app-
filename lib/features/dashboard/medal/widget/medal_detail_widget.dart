import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/constants/app_constant.dart';

class MedalDetailWidget extends StatelessWidget {
  const MedalDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.actionColor600,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(
              "${AppConstant.assetImages}playerBackground.png",
              fit: BoxFit.fill, // Ensure the image covers the entire container
            ),
          ),
        ],
      ),
    );
  }
}
