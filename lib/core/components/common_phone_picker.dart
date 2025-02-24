import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';

class CommonPhonePicker extends StatefulWidget {
  TextEditingController? controller;
  String? isoCode;
  Color? mOutlineColor;
  bool? enable;
  Key keys;
  bool? isLogin;
  String? hintText;
  final FontWeight? weight;
  final Function(PhoneNumber value) onChanged;
  final double? textSize;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? textInputType;
  final Function(String)? onFieldSubmit;
  final Iterable<String>? autofillHint;

  CommonPhonePicker(
      {super.key,
      required this.keys,
      this.onFieldSubmit,
      this.isLogin,
      this.autofillHint,
      this.controller,
      this.isoCode,
      this.mOutlineColor,
      this.enable,
      this.hintText,
      this.weight,
      this.textSize,
      this.inputFormatter,
      required this.onChanged,
      this.textInputType});

  @override
  State<CommonPhonePicker> createState() => _CommonPhonePickerState();
}

class _CommonPhonePickerState extends State<CommonPhonePicker> {
  TextEditingController countryCode = TextEditingController();
  TextEditingController number = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    initData();
    super.initState();
  }

  initData() async {
    if (widget.controller!.text.isNotEmpty) {
      try {
        var value = await PhoneNumber.getRegionInfoFromPhoneNumber(widget.controller?.text ?? '');
        countryCode = TextEditingController(text: (widget.isoCode != null && widget.isoCode!.isNotEmpty && widget.isoCode != "null") ? widget.isoCode : value.isoCode);
        number = TextEditingController(text: value.phoneNumber);
        widget.controller?.text = widget.controller!.text.replaceFirst("+${value.dialCode}", '');
        print("countryCode >${widget.controller?.text} ");
      } catch (e) {
        countryCode = TextEditingController(text: "US");
        number = TextEditingController(text: "");
      }
    } else {
      countryCode = TextEditingController(text: "US");
      number = TextEditingController(text: "");
    }
    setState(() {});
    print("country===== ${countryCode.text} //// ${widget.controller?.text} ${number.text}");
  }

  @override
  void didUpdateWidget(covariant CommonPhonePicker oldWidget) {
    // TODO: implement didUpdateWidget
    update();
    super.didUpdateWidget(oldWidget);
  }

  update() async {
    if (widget.isoCode == null || widget.isoCode!.isEmpty) {
      countryCode.text = "US";
    } else if (widget.isoCode != countryCode.text) {
      countryCode.text = widget.isoCode ?? "US";
    }
    log("commonphone=====  ${widget.controller!.text}. ${widget.isoCode} .. ${countryCode.text} ... ${widget.controller?.text.isEmpty}. ${(widget.isoCode != countryCode.text)}");

    if (widget.controller!.text.isNotEmpty) {
      try {
        print('country------> ${widget.controller!.text}');
        var value = await PhoneNumber.getRegionInfoFromPhoneNumber(widget.controller?.text ?? '');
        widget.controller?.text = widget.controller!.text.replaceFirst("+${value.dialCode}", '');
      } catch (e) {
        print('errrrr0>>>>>> $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      key: widget.keys,
      onInputChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmit,
      hintText: widget.hintText,
      autofillHints: widget.autofillHint ?? [],
      isEnabled: widget.enable ?? true,
      spaceBetweenSelectorAndTextField: 2,
      textStyle: commonTextStyle(),
      selectorTextStyle: commonTextStyle(),
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
        useBottomSheetSafeArea: false,
        trailingSpace: false,
        leadingPadding: 0,
        showFlags: widget.isLogin ?? true,
      ),
      ignoreBlank: false,
      inputBorder: InputBorder.none,
      textAlignVertical: TextAlignVertical.top,
      autoValidateMode: AutovalidateMode.disabled,
      initialValue: PhoneNumber(isoCode: countryCode.text),
      textFieldController: widget.controller,
      formatInput: false,
      onSubmit: () {
        FocusScope.of(context).unfocus();
      },
      onSaved: (value) {
        FocusScope.of(context).unfocus();
      },
      keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
      inputDecoration: widget.enable ?? true
          ? InputDecoration(
              contentPadding: const EdgeInsets.only(right: 0, left: 8, top: 12),
              fillColor: AppColors.blackColor500,
              filled: true,
              counterStyle: const TextStyle(
                color: AppColors.neutralColor500,
                fontSize: 10,
              ),
              border: InputBorder.none,
              focusedBorder: commonOutlineBorder(
                AppColors.neutralColor400,
              ),
              enabledBorder: commonOutlineBorder(
                AppColors.neutralColor400,
              ),
              disabledBorder: commonOutlineBorder(
                AppColors.neutralColor400,
              ),
              errorBorder: commonOutlineBorder(
                AppColors.neutralColor400,
              ),
              focusedErrorBorder: commonOutlineBorder(
                AppColors.neutralColor400,
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: widget.enable ?? true ? AppColors.neutralColor400 : AppColors.neutralColor400,
              ),
            )
          : const InputDecoration(
              contentPadding: EdgeInsets.only(right: 0, left: 0),
              fillColor: AppColors.neutralColor400,
              filled: true,
              border: InputBorder.none,
            ),
      searchBoxDecoration: InputDecoration(
        contentPadding: const EdgeInsets.only(right: 8, left: 8, top: 12),
        fillColor: Colors.white,
        filled: true,
        counterStyle: const TextStyle(
          color: AppColors.neutralColor400,
          fontSize: 10,
        ),
        border: InputBorder.none,
        focusedBorder: commonOutlineBorder(
          AppColors.neutralColor400,
        ),
        enabledBorder: commonOutlineBorder(
          AppColors.neutralColor400,
        ),
        disabledBorder: commonOutlineBorder(
          AppColors.neutralColor400,
        ),
        errorBorder: commonOutlineBorder(
          AppColors.neutralColor400,
        ),
        focusedErrorBorder: commonOutlineBorder(
          AppColors.neutralColor400,
        ),
        hintText: 'Select a country',
        hintStyle: TextStyle(
          color: widget.enable ?? true ? Colors.grey : AppColors.neutralColor400,
        ),
      ),
    );
  }

  commonTextStyle() {
    return TextStyle(
      fontSize: widget.textSize ?? 15,
      color: widget.enable ?? true ? AppColors.whiteColor : AppColors.neutralColor400,
      fontWeight: widget.weight ?? FontWeight.normal,
    );
  }

  commonOutlineBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        color: widget.mOutlineColor ?? color,
        width: 0.5,
      ),
    );
  }
}
