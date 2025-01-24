import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';

class WidgetTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? mFocusNode;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? mLabelText, hintText;
  final bool? isObscureText;
  final Color? mOutlineColor;
  final bool? enable;
  final Widget? prefix;
  final Widget? suffix;
  final double? width;
  final double? heights;
  final int? mMaxLines;
  final int? mMinLines;
  final int? maxLengths;
  final double? textSize;
  final bool? autofocus;
  final bool? expand;
  final MaxLengthEnforcement? lengthEnforcement;
  final bool? readOnly;
  final Function()? mOnTap;
  final BorderRadius? borderRadius;
  final FontWeight? weight;
  final Function(dynamic)? onChange;
  final Function()? onEditingComplete;
  final Function(dynamic)? onFieldSubmitted;
  final EdgeInsetsGeometry? margin;

  const WidgetTextField({
    required this.controller,
    this.textSize,
    this.weight,
    this.mFocusNode,
    this.readOnly,
    this.expand,
    this.inputFormatter,
    this.mOutlineColor,
    this.textInputType,
    this.textInputAction,
    this.hintText,
    this.maxLengths,
    this.borderRadius,
    this.margin,
    this.lengthEnforcement,
    this.mLabelText,
    this.autofocus = false,
    this.mMaxLines,
    this.mMinLines,
    this.isObscureText,
    this.enable,
    this.width,
    this.heights,
    this.prefix,
    this.suffix,
    this.mOnTap,
    this.onChange,
    this.onEditingComplete,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heights,
      margin: margin,
      child: TextField(
        controller: controller,
        cursorColor: AppColors.primaryColor600,
        cursorWidth: 1,
        textAlign: TextAlign.left,
        maxLengthEnforcement: lengthEnforcement ?? MaxLengthEnforcement.enforced,
        focusNode: mFocusNode,
        expands: expand ?? false,
        autofocus: autofocus!,
        obscureText: isObscureText ?? false,
        inputFormatters: inputFormatter ?? [],
        keyboardType: textInputType ?? TextInputType.text,
        enabled: enable ?? true,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        style: TextStyle(
          fontSize: textSize ?? 15,
          fontFamily: 'Metropolis',
          color: enable ?? true ? AppColors.whiteColor : AppColors.secondaryColor500,
          fontWeight: weight ?? FontWeight.normal,
        ),
        readOnly: readOnly ?? false,
        maxLines: mMaxLines ?? 1,
        minLines: mMinLines ?? 1,
        onTap: mOnTap,
        maxLength: maxLengths,
        onChanged: onChange,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.blackColor500,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          counterStyle: const TextStyle(
            color: AppColors.neutralColor500,
            fontSize: 10,
            fontFamily: 'Metropolis',
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(50),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            // Add focused border for better visibility
            borderRadius: borderRadius ?? BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: AppColors.neutralColor400,
              width: 0.5,
            ),
          ),
          prefixIcon: prefix,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          suffixIcon: suffix,
          labelText: mLabelText,
          labelStyle: const TextStyle(
            color: AppColors.secondaryColor500,
            fontFamily: 'Metropolis',
          ),
        ),
      ),
    );
  }
}
