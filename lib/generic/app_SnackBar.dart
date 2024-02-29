import 'package:flutter/material.dart';
import 'package:get/get.dart';

class APPSnackbar {
  static void showMessageSuccess({
    String title = '',
    required String message,
    Duration duration = const Duration(seconds: 1),
  }) {
    Get.rawSnackbar(
      message: message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Color(0xff109A8F),
      borderRadius: 10,
      margin: EdgeInsets.all(10),
      duration: duration,
    );
  }

  static void showMessageFailure({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.rawSnackbar(
      message: message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Color(0xffE65955),
      borderRadius: 10,
      margin: EdgeInsets.all(10),
      duration: duration,
    );
  }
}
