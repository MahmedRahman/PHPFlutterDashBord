import 'package:dashbord/app/routes/app_pages.dart';
import 'package:dashbord/common/service.auth.dart';
import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/generic/app_dialog.dart';
import 'package:dashbord/web_serives/exception.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController with StateMixin {
  TextEditingController email = TextEditingController(text: "admin@admin.com");
  TextEditingController password = TextEditingController(text: "123456");
  final formkey = GlobalKey<FormState>();

  @override
  void onInit() {
    if (Get.find<AuthService>().isLoggedIn == true) {
      Get.toNamed(Routes.HOME);
    }

    change(null, status: RxStatus.success());
    super.onInit();
  }

  void onPressedLoginButton() async {
    if (!formkey.currentState!.validate()) {
      return;
    }
    change(null, status: RxStatus.loading());
    try {
      ResponseModel responseModel = await WebServices().loginWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      if (responseModel.data["data"]["user"]["is_active"] == false) {
        APPDialog.showDialogue(
          "Account Inactive",
          "Your account is currently inactive. Please wait for an administrator to activate your account, or contact support for further assistance.",
        );

        change(null, status: RxStatus.success());
        return;
      }
      Get.find<AuthService>().saveLoginData(responseModel.data["data"]);
      // Get.find<AuthService>().token = responseModel.data["data"]["access_token"].toString();
      // final box = GetStorage();
      // box.write('token', '${responseModel.data["data"]["access_token"].toString()}');

      Get.offAllNamed(Routes.HOME);
      change(null, status: RxStatus.success());
    } on BadRequestException catch (e) {
      APPSnackbar.showMessageFailure(message: e.message.toString());
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  void onPressedRegisterButton() {
    Get.toNamed(Routes.REGISTER);
  }
}
