import 'package:dashbord/common/service.lookup_data_service.dart';
import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/web_serives/exception.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepartmentAddController extends GetxController with StateMixin {
  TextEditingController title = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void onInit() {
    change(null, status: RxStatus.success());

    // TODO: implement onInit
    super.onInit();
  }

  void onPressedSaveButton() async {
    formkey!.currentState!.save();
    if (!formkey.currentState!.validate()) {
      return;
    }
    try {
      ResponseModel responseModel = await WebServices().addDepartments(title: title.text.toString());

      APPSnackbar.showMessageSuccess(message: responseModel.data["message"].toString());
      Get.offAllNamed("/departments");
      change(null, status: RxStatus.success());
    } on BadRequestException catch (e) {
      APPSnackbar.showMessageFailure(message: e.message.toString());
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
