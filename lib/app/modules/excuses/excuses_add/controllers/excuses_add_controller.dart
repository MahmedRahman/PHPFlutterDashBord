import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/web_serives/exception.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExcusesAddController extends GetxController with StateMixin {
  TextEditingController createDate = TextEditingController(text: "2024-03-10");

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
      ResponseModel responseModel = await WebServices().addExcuses(
        createDate: createDate.text.toString(),
        stating: stating.text.toString(),
        ending: ending.text.toString(),
        state: state.text.toString(),
        comments: comments.text.toString(),
        user_id: userId.text.toString(),
      );
      APPSnackbar.showMessageSuccess(message: responseModel.data["message"].toString());

      change(null, status: RxStatus.success());
      Get.offAllNamed('/excuses');
    } on BadRequestException catch (e) {
      APPSnackbar.showMessageFailure(message: e.message.toString());
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
