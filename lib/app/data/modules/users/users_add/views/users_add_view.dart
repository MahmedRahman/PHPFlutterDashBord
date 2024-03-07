import 'package:dashbord/app/modules/users/users_add/controllers/users_add_controller.dart';
import 'package:dashbord/common/service.lookup_data_service.dart';
import 'package:dashbord/components/components.button.dart';
import 'package:dashbord/components/components.Input_date_picker.dart';
import 'package:dashbord/components/components.drop_down_form_field.dart';
import 'package:dashbord/components/components.form_field.dart';
import 'package:dashbord/generic/app_input_config.dart';
import 'package:dashbord/generic/app_input_validator.dart';
import 'package:dashbord/main.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UsersAddView extends GetView<UsersAddController> {
  const UsersAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white12,
      body: controller.obx(
        (snapshot) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.formkey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  AppTextFormField(
                    controller: controller.employeeNo,
                    hintText: 'Employee No',
                    label: "Employee No",
                    validator: APPInputValidator.validateFirstName,
                    onChanged: (data) {
                      controller.employeeNo.text = data.toString();
                    },
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  AppTextFormField(
                    controller: controller.name,
                    hintText: 'Name',
                    label: "Name",
                    validator: APPInputValidator.validateFirstName,
                    onChanged: (data) {
                      controller.name.text = data.toString();
                    },
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  AppTextFormField(
                    controller: controller.email,
                    hintText: 'Email',
                    label: "Email",
                    validator: APPInputValidator.validateEmail,
                    onChanged: (data) {
                      controller.email.text = data.toString();
                    },
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  AppTextFormField(
                    controller: controller.password,
                    hintText: 'Password',
                    label: "Password",
                    validator: APPInputValidator.validatePassword,
                    onChanged: (data) {
                      controller.password.text = data.toString();
                    },
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  AppDropdownFormField(
                    hintText: 'role',
                    label: "Role",
                    itemsValues: "employee",
                    items: [
                      DropdownMenuItem(
                        child: Text("employee"),
                        value: "employee",
                      ),
                      DropdownMenuItem(
                        child: Text("hr"),
                        value: "hr",
                      ),
                      DropdownMenuItem(
                        child: Text("techlead"),
                        value: "techlead",
                      )
                    ],
                    onChanged: (data) {
                      controller.role.text = data!.toString();
                    },
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  AppDropdownFormField(
                    hintText: 'Status',
                    label: "Status",
                    itemsValues: "true",
                    items: [
                      DropdownMenuItem(
                        child: Text("True"),
                        value: "true",
                      ),
                      DropdownMenuItem(
                        child: Text("False"),
                        value: "false",
                      ),
                    ],
                    onChanged: (data) {
                      controller.isActive.text = data!.toString();
                    },
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  AppDropdownFormField(
                    hintText: 'Department',
                    label: "Department",
                    itemsValues: (controller.departmentID.text == "") ? null : controller.departmentID.text,
                    items: List.generate(
                      Get.find<LookupTableService>().departmentsList.length,
                      (index) {
                        return DropdownMenuItem(
                          value: "${Get.find<LookupTableService>().departmentsList.elementAt(index)["id"]}",
                          child: Text("${Get.find<LookupTableService>().departmentsList.elementAt(index)["title"]}"),
                        );
                      },
                    ),
                    onChanged: (data) {
                      controller.departmentID.text = data!.toString();
                    },
                    validator: APPInputValidator.validateRequired,
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  AppDropdownFormField(
                      hintText: 'Job Title',
                      label: "Job Title",
                      itemsValues: (controller.jobTitlesID.text == "") ? null : controller.jobTitlesID.text,
                      validator: APPInputValidator.validateRequired,
                      onChanged: (data) {
                        controller.jobTitlesID.text = data!.toString();
                      },
                      items: List.generate(
                        Get.find<LookupTableService>().jobTitlesList.length,
                        (index) {
                          return DropdownMenuItem(
                            value: "${Get.find<LookupTableService>().jobTitlesList.elementAt(index)["id"]}",
                            child: Text("${Get.find<LookupTableService>().jobTitlesList.elementAt(index)["title"]}"),
                          );
                        },
                      )),
                  SizedBox(
                    height: 19,
                  ),
                  AppTextFormField(
                    controller: controller.vacationDays,
                    hintText: 'vacation_days',
                    label: "vacation_days",
                    inputFormatters: [AppInputConfig.digitsOnly],
                    onChanged: (date) {
                      controller.vacationDays.text = date.toString();
                    },
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  AppInputDatePickerFormField(
                    label: "Join Date",
                    hintText: "Join Date",
                    initialDate: DateTime.now(),
                    onChanged: (data) {
                      DateTime? date = DateTime.parse(data.toString());
                      if (date != null) {
                        // Format the date to Y-m-d format
                        String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                        // Set the formatted date to the controller
                        controller.role.text = formattedDate;
                      }
                    },
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  AppButton(
                    label: "Register",
                    onPressed: controller.onPressedRegisterButton,
                    stretch: true,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
