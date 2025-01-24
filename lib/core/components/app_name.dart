import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          'SPORT',
          textAlign: TextAlign.center,
          style: textheme.headlineMedium?.copyWith(
            color: AppColors.whiteColor,
            fontSize: 50,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
