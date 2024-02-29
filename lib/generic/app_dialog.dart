import 'package:flutter/material.dart';
import 'package:get/get.dart';

class APPDialog {
  // Static method to show dialog using GetX
  static void showDialogue(String title, String message) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Get.back(); // Close the dialog
            },
          ),
        ],
      ),
      barrierDismissible: false, // User must tap button to dismiss
    );
  }

  static void showYesNoDialog(
      {required String title, required String message, required Function onYesPressed, required Function onNoPressed}) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            child: Text("Yes"),
            onPressed: () {
              onYesPressed();
              Get.back(); // Close the dialog
            },
          ),
          TextButton(
            child: Text("No"),
            onPressed: () {
              onNoPressed();
              Get.back(); // Close the dialog
            },
          ),
        ],
      ),
      barrierDismissible: false, // User must tap button to dismiss
    );
  }
}
