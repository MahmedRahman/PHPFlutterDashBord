import 'package:dashbord/app/modules/users/users/controllers/users_list_controller.dart';
import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/web_serives/exception.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersUpdateController extends GetxController with StateMixin {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController vacationDays = TextEditingController();
  TextEditingController isActive = TextEditingController();
  TextEditingController role = TextEditingController();
  TextEditingController joinDate = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    getUser(Get.parameters["id"].toString());
  }

  void getUser(userID) async {
    try {
      ResponseModel responseModel = await WebServices().getUser(userID.toString());

      name.text = responseModel.data["data"]["name"].toString();
      email.text = responseModel.data["data"]["email"].toString();
      vacationDays.text = responseModel.data["data"]["vacation_days"].toString();
      isActive.text = responseModel.data["data"]["is_active"].toString();
      role.text = responseModel.data["data"]["role"].toString();
      joinDate.text = responseModel.data["data"]["join_date"].toString();

      change(responseModel.data["data"], status: RxStatus.success());
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
      ResponseModel responseModel = await WebServices().updateUser(
        userId: Get.parameters["id"].toString(),
        name: name.text,
        email: email.text,
        isActive: bool.parse(isActive.text.toString()),
        role: role.text,
        joinDate: joinDate.text.split(" ").first,
        vacationDays: int.parse(vacationDays.text.toString()),
      );
      APPSnackbar.showMessageSuccess(message: responseModel.data["message"].toString());
      Get.find<UsersListController>().getUsers();

      change(null, status: RxStatus.success());
    } on BadRequestException catch (e) {
      APPSnackbar.showMessageFailure(message: e.message.toString());
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
