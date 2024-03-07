import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/web_serives/exception.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VacationUpdateController extends GetxController with StateMixin {
  //TODO: Implement VacationUpdateController
  TextEditingController stating = TextEditingController(text: "2024-03-10");
  TextEditingController ending = TextEditingController(text: "2024-03-10");
  TextEditingController days = TextEditingController(text: "0");
  TextEditingController type = TextEditingController(text: "annual");
  TextEditingController state = TextEditingController(text: "wait_for_reply");
  TextEditingController comments = TextEditingController(text: "");
  TextEditingController userId = TextEditingController(text: "");
  String VacationId = "1";
  final formkey = GlobalKey<FormState>();

  @override
  void onInit() {
    getVacation(Get.arguments);

    super.onInit();
  }

  void getVacation(vacation) async {
    try {
      VacationId = vacation["id"].toString();
      stating.text = vacation["stating"].toString();
      ending.text = vacation["ending"].toString();
      days.text = vacation["days"].toString();
      type.text = vacation["type"].toString();
      state.text = vacation["state"].toString();
      comments.text = vacation["comments"].toString();
      userId.text = vacation["user_id"].toString();

      change(vacation, status: RxStatus.success());
    } catch (e) {
      APPSnackbar.showMessageFailure(message: e.toString());
    }
  }

  void onPressedUpdateButton() async {
    formkey!.currentState!.save();
    if (!formkey.currentState!.validate()) {
      return;
    }

    change(null, status: RxStatus.loading());
    try {
      ResponseModel responseModel = await WebServices().updateVacation(
        vacationId: VacationId,
        user_id: userId.text.toString(),
        stating: stating.text.toString(),
        ending: ending.text.toString(),
        days: days.text.toString(),
        type: type.text.toString(),
        state: state.text.toString(),
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
