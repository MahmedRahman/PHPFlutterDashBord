import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/web_serives/exception.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final formkey = GlobalKey<FormState>();

class VacationAddController extends GetxController with StateMixin {
  TextEditingController stating = TextEditingController(text: "2024-03-10");
  TextEditingController ending = TextEditingController(text: "2024-03-10");
  TextEditingController days = TextEditingController(text: "0");
  TextEditingController type = TextEditingController(text: "annual");
  TextEditingController state = TextEditingController(text: "wait_for_reply");
  TextEditingController comments = TextEditingController(text: "");
  TextEditingController userId = TextEditingController(text: "");
  final formkey = GlobalKey<FormState>();

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void onPressedSaveButton() async {
    formkey!.currentState!.save();
    if (!formkey.currentState!.validate()) {
      return;
    }

    change(null, status: RxStatus.loading());
    try {
      ResponseModel responseModel = await WebServices().addVacation(
        user_id: userId.text.toString(),
        stating: stating.text.toString(),
        ending: ending.text.toString(),
        days: days.text.toString(),
        type: type.text.toString(),
        //state: state.text.toString(),
        comments: comments.text.toString(),
      );
      APPSnackbar.showMessageSuccess(message: responseModel.data["message"].toString());

      change(null, status: RxStatus.success());
      Get.offAllNamed('/vacation');
    } on BadRequestException catch (e) {
      APPSnackbar.showMessageFailure(message: e.message.toString());
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
