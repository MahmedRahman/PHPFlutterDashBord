import 'package:dashbord/app/modules/users/users/controllers/users_list_controller.dart';
import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/web_serives/exception.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersUpdateController extends GetxController with StateMixin {
  TextEditingController employeeNo = TextEditingController(text: "101");

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController vacationDays = TextEditingController();
  TextEditingController isActive = TextEditingController();
  TextEditingController role = TextEditingController();
  TextEditingController joinDate = TextEditingController();
  TextEditingController departmentID = TextEditingController();
  TextEditingController jobTitlesID = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    getUser(Get.arguments);
  }

  void getUser(user) async {
    try {
      employeeNo.text = user["emp_no"].toString();
      name.text = user["name"].toString();
      email.text = user["email"].toString();
      vacationDays.text = user["vacation_days"].toString();
      isActive.text = user["is_active"].toString();
      role.text = user["role"].toString();
      joinDate.text = user["join_date"].toString();
      departmentID.text = user["department_id"].toString();
      jobTitlesID.text = user["job_titles_id"].toString();
      change(user, status: RxStatus.success());
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
        employee_no: employeeNo.text,
        name: name.text,
        email: email.text,
        isActive: bool.parse(isActive.text.toString()),
        role: role.text,
        joinDate: joinDate.text.split(" ").first,
        vacationDays: int.parse(vacationDays.text.toString()),
        department_id: departmentID.text.toString(),
        job_titles_id: jobTitlesID.text.toString(),
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
