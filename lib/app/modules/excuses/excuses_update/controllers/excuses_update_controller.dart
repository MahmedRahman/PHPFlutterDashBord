import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/web_serives/exception.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExcusesUpdateController extends GetxController with StateMixin {
  TextEditingController state = TextEditingController(text: "wait_for_reply");
  TextEditingController comments = TextEditingController(text: "");
  final formkey = GlobalKey<FormState>();

  String excusesId = "1";
  @override
  void onInit() {
    excusesId = Get.arguments["id"].toString();
    state.text = Get.arguments["state"];
    comments.text = Get.arguments["comments"] ?? "";
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void onPressedUpdateButton() async {
    formkey!.currentState!.save();
    if (!formkey.currentState!.validate()) {
      return;
    }

    change(null, status: RxStatus.loading());
    try {
      ResponseModel responseModel = await WebServices().updateExcuses(
        id: excusesId.toString(),
        state: state.text.toString(),
        comments: comments.text.toString(),
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
