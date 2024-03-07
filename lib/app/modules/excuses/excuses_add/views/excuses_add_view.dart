import 'package:dashbord/common/service.lookup_data_service.dart';
import 'package:dashbord/components/components.Input_date_picker.dart';
import 'package:dashbord/components/components.Input_time_picker.dart';
import 'package:dashbord/components/components.button.dart';
import 'package:dashbord/components/components.drop_down_form_field.dart';
import 'package:dashbord/components/components.form_field.dart';
import 'package:dashbord/generic/app_input_config.dart';
import 'package:dashbord/generic/app_input_validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/excuses_add_controller.dart';

class ExcusesAddView extends GetView<ExcusesAddController> {
  const ExcusesAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (snapshot) {
          return Form(
            key: controller.formkey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
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
                    label: "Create Date ",
                    hintText: "Create Date ",
                    initialDate: DateTime.now(),
                    validator: APPInputValidator.validateRequired,
                    onChanged: (data) {
                      DateTime? date = DateTime.parse(data.toString());
                      if (date != null) {
                        // Format the date to Y-m-d format
                        String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                        // Set the formatted date to the controller
                        controller.createDate.text = formattedDate;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppInputTimePickerFormField(
                    label: "Excuses Starting ",
                    hintText: "Excuses Starting ",
                    initialTime: TimeOfDay.fromDateTime(DateTime.parse(controller.stating.text)),
                    validator: APPInputValidator.validateRequired,
                    onChanged: (TimeOfDay selectedTime) {
                      final now = DateTime.now();
                      final selectedDateTime =
                          DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
                      String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime);
                      controller.stating.text = formattedDateTime;
                      print(controller.stating.text);
                      controller.update();
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppInputTimePickerFormField(
                    label: "Excuses Ending Date ",
                    hintText: "Excuses Ending Date ",
                    initialTime: TimeOfDay.fromDateTime(DateTime.parse(controller.ending.text)),
                    validator: APPInputValidator.validateRequired,
                    onChanged: (TimeOfDay selectedTime) {
                      final now = DateTime.now();
                      final selectedDateTime =
                          DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
                      String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime);
                      controller.ending.text = formattedDateTime;
                      print(controller.ending.text);
                      controller.update();
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
