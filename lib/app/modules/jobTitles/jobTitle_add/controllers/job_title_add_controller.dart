import 'package:dashbord/common/service.lookup_data_service.dart';
import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/web_serives/exception.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobTitleAddController extends GetxController with StateMixin {
  //TODO: Implement JobTitleAddController
  TextEditingController title = TextEditingController();
  TextEditingController departmentID = TextEditingController();

  final formkey = GlobalKey<FormState>();

  void onPressedSaveButton() async {
    formkey!.currentState!.save();
    if (!formkey.currentState!.validate()) {
      return;
    }
    try {
      ResponseModel responseModel = await WebServices().addJobTitle(
        title: title.text.toString(),
        departments_id: departmentID.text.toString(),
      );

      APPSnackbar.showMessageSuccess(
        message: responseModel.data["message"].toString(),
      );
      Get.offAllNamed('/jobTitles');
      change(null, status: RxStatus.success());
    } on BadRequestException catch (e) {
      APPSnackbar.showMessageFailure(message: e.message.toString());
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  @override
  void onInit() async {
    await Get.find<LookupTableService>().getDepartments();
    change(null, status: RxStatus.success());
    super.onInit();
  }
}
