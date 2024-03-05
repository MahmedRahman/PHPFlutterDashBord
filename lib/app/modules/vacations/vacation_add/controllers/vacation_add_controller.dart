import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/web_serives/exception.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final formkey = GlobalKey<FormState>();

class VacationAddController extends GetxController with StateMixin {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void onPressedSaveButton() async {
    formkey!.currentState!.save();
    if (!formkey.currentState!.validate()) {
      return;
    }
    try {
      ResponseModel responseModel = await WebServices().addVacation(
        comments: "",
        create_date: "",
        days: "",
        ending: "",
        state: "",
        stating: "",
        type: "",
      );

      APPSnackbar.showMessageSuccess(
        message: responseModel.data["message"].toString(),
      );

      change(null, status: RxStatus.success());
    } on BadRequestException catch (e) {
      APPSnackbar.showMessageFailure(message: e.message.toString());
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
