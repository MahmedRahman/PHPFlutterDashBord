import 'package:dashbord/app/routes/app_pages.dart';
import 'package:dashbord/common/service.auth.dart';
import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/generic/app_dialog.dart';
import 'package:dashbord/web_serives/exception.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersAddController extends GetxController with StateMixin {
  TextEditingController name = TextEditingController(text: "Mohamed");
  TextEditingController email = TextEditingController(text: "atpfreelance@gmail.com");
  TextEditingController password = TextEditingController(text: "atp@5797895");
  TextEditingController vacationDays = TextEditingController(text: "1");
  TextEditingController isActive = TextEditingController(text: "true");
  TextEditingController role = TextEditingController(text: "employee");
  TextEditingController joinDate = TextEditingController(text: DateTime.now().toString());
  final formkey = GlobalKey<FormState>();
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void onPressedRegisterButton() async {
    formkey!.currentState!.save();
    if (!formkey.currentState!.validate()) {
      return;
    }

    change(null, status: RxStatus.loading());
    try {
      ResponseModel responseModel = await WebServices().addUser(
        name: name.text,
        email: email.text,
        password: password.text,
        isActive: bool.parse(isActive.text.toString()),
        role: role.text,
        joinDate: joinDate.text.split(" ").first,
        vacationDays: int.parse(vacationDays.text.toString()),
      );
      APPSnackbar.showMessageSuccess(message: responseModel.data["message"].toString());

      change(null, status: RxStatus.success());
    } on BadRequestException catch (e) {
      APPSnackbar.showMessageFailure(message: e.message.toString());
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
