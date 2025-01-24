import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/routes/app_navigation.dart';

class HelperFunctions {
  static Future<void> initializeApplication() async {}

  static showNotification(String message, {int seconds = 2}) {
    ScaffoldMessenger.of(AppNavigation.currentContext!).showSnackBar(
      SnackBar(
        duration: Duration(seconds: seconds),
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  static String formatMinutesAndSeconds(String timeString) {
    try {
      double time = double.parse(timeString);
      int minutes = time.floor();
      int seconds = ((time - minutes) * 60).round();
      return "$minutes min $seconds s";
    } catch (e) {
      log("Error parsing time string: $e");
      return "N/A";
    }
  }
}
