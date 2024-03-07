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
  TextEditingController employeeNo = TextEditingController(text: "0");
  TextEditingController name = TextEditingController(text: "");
  TextEditingController email = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "pass@123456");
  TextEditingController vacationDays = TextEditingController(text: "1");
  TextEditingController isActive = TextEditingController(text: "true");
  TextEditingController role = TextEditingController(text: "employee");
  TextEditingController joinDate = TextEditingController(text: DateTime.now().toString());
  TextEditingController departmentID = TextEditingController();
  TextEditingController jobTitlesID = TextEditingController();

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
        employee_no: employeeNo.text,
        name: name.text,
        email: email.text,
        password: password.text,
        isActive: bool.parse(isActive.text.toString()),
        role: role.text,
        joinDate: joinDate.text.split(" ").first,
        vacationDays: int.parse(vacationDays.text.toString()),
        department_id: departmentID.text,
        job_titles_id: jobTitlesID.text,
      );
      APPSnackbar.showMessageSuccess(message: responseModel.data["message"].toString());

      change(null, status: RxStatus.success());
      Get.offAllNamed("/users");
    } on BadRequestException catch (e) {
      APPSnackbar.showMessageFailure(message: e.message.toString());
      change(null, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
