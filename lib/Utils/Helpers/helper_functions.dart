import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/main.dart';
import 'package:toastification/toastification.dart';

class HelperFunctions {
  static Future<void> initializeApplication() async {}

  static void showSuccessToast(String message) {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.simple,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      margin: const EdgeInsets.all(34),
      title: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      alignment: Alignment.bottomCenter,
      borderSide: BorderSide.none,

      autoCloseDuration: const Duration(seconds: 3),
      backgroundColor: AppColors.primaryColor600, // Green background for success
    );
  }

  static void showErrorToast(String message) {
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.simple,
      borderSide: BorderSide.none,
      title: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      margin: const EdgeInsets.all(34),
      autoCloseDuration: const Duration(seconds: 3),
      backgroundColor: Colors.redAccent, // Red background for error
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

  static bool calculateTimeDifference(var targetDateTime, int index, textValue) {
    final currentDateTime = DateTime.now();
    if (targetDateTime == null) {
      box.write('duration ${textValue}', 300);
      return false;
    } // Calcu
    // late the time difference in seconds
    final timeDifferenceInSeconds = currentDateTime.difference(DateTime.parse(targetDateTime));
    var difference = 300 - timeDifferenceInSeconds.inSeconds;
    if (difference > 0) {
      box.write('duration ${textValue}', difference);
      return true;
    } else {
      box.write('duration ${textValue}', 300);
      return false;
    }
  }
}
