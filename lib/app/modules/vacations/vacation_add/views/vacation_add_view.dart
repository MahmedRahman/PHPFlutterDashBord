import 'package:dashbord/common/service.lookup_data_service.dart';
import 'package:dashbord/components/components.Input_date_picker.dart';
import 'package:dashbord/components/components.button.dart';
import 'package:dashbord/components/components.drop_down_form_field.dart';
import 'package:dashbord/components/components.form_field.dart';
import 'package:dashbord/generic/app_input_config.dart';
import 'package:dashbord/generic/app_input_validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/vacation_add_controller.dart';

class VacationAddView extends GetView<VacationAddController> {
  const VacationAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (snapshot) {
          return Form(
            key: controller.formkey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  AppDropdownFormField(
                    hintText: 'Employee',
                    label: "Select Employee",
                    items: List.generate(
                      Get.find<LookupTableService>().userList.length,
                      (index) {
                        return DropdownMenuItem(
                          value: "${Get.find<LookupTableService>().userList.elementAt(index)["id"]}",
                          child: Text(
                              "${Get.find<LookupTableService>().userList.elementAt(index)["emp_no"]} _ ${Get.find<LookupTableService>().userList.elementAt(index)["name"]} "),
                        );
                      },
                    ),
                    onChanged: (data) {
                      controller.userId.text = data!.toString();
                    },
                    validator: APPInputValidator.validateRequired,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppInputDatePickerFormField(
                    label: "Vacation Starting Date",
                    hintText: "Vacation Starting Date",
                    initialDate: DateTime.now(),
                    validator: APPInputValidator.validateRequired,
                    onChanged: (data) {
                      DateTime? date = DateTime.parse(data.toString());
                      if (date != null) {
                        // Format the date to Y-m-d format
                        String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                        // Set the formatted date to the controller
                        controller.stating.text = formattedDate;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppInputDatePickerFormField(
                    label: "Vacation Ending Date",
                    hintText: "Vacation Ending Date",
                    validator: APPInputValidator.validateRequired,
                    initialDate: DateTime.now(),
                    onChanged: (data) {
                      DateTime? date = DateTime.parse(data.toString());
                      if (date != null) {
                        // Format the date to Y-m-d format
                        String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                        // Set the formatted date to the controller
                        controller.ending.text = formattedDate;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppTextFormField(
                    controller: controller.days,
                    hintText: 'Days',
                    label: "Days",
                    validator: APPInputValidator.validateRequired,
                    inputFormatters: [AppInputConfig.digitsOnly],
                    onChanged: (date) {
                      controller.days.text = date.toString();
                    },
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  AppDropdownFormField(
                    hintText: 'type',
                    label: "type",
                    itemsValues: "annual",
                    items: [
                      DropdownMenuItem(
                        child: Text("Annual"),
                        value: "annual",
                      ),
                      DropdownMenuItem(
                        child: Text("Emergency"),
                        value: "emergency",
                      ),
                      DropdownMenuItem(
                        child: Text("Sick"),
                        value: "sick",
                      ),
                      DropdownMenuItem(
                        child: Text("With out Pay"),
                        value: "without_pay",
                      ),
                    ],
                    onChanged: (data) {
                      controller.type.text = data!.toString();
                    },
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  AppTextFormField(
                    controller: controller.comments,
                    hintText: 'comments',
                    label: "comments",
                    onChanged: (data) {
                      controller.comments.text = data.toString();
                    },
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  AppButton(
                    label: "Save",
                    onPressed: controller.onPressedSaveButton,
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
