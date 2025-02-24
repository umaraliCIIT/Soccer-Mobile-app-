import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:soccer_mobile_app/config/routes/app_navigation.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';

class CustomLoading {
  static void hideLoadingIndicator() async {
    AppNavigation.goBack();
  }

  static void showLoadingIndicator({bool usePostFrameCallback = true}) {
    void showDialogFunction() {
      showDialog(
        context: AppNavigation.navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: LoadingAnimationWidget.waveDots(
              color: AppColors.primaryColor600,
              size: 55,
            ),
          ),
        ),
      );
    }

    if (usePostFrameCallback) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showDialogFunction());
    } else {
      showDialogFunction();
    }
  }
}
