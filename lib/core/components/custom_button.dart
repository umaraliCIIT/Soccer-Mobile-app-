import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final TextStyle? textStyle;
  final BorderSide? border;
  final double borderRadius;
  final Size? minSize;
  final Size? maxSize;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;
  final Color overlayColor;

  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.title,
    this.textStyle,
    this.padding,
    this.border = const BorderSide(color: Colors.transparent),
    this.borderRadius = 18.0,
    this.minSize,
    this.maxSize,
    this.backgroundColor = AppColors.primaryColor600,
    this.overlayColor = AppColors.secondaryColor500,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textheme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        overlayColor: overlayColor,
        padding: padding ?? EdgeInsets.zero,
        maximumSize: maxSize,
        minimumSize: minSize,
        shape: RoundedRectangleBorder(
          side: border ?? const BorderSide(color: AppColors.primaryColor600),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        title,
        style: textStyle ?? textheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
      ),
    );
  }
}
