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

import '../controllers/vacation_update_controller.dart';

class VacationUpdateView extends GetView<VacationUpdateController> {
  const VacationUpdateView({Key? key}) : super(key: key);
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
                  // AppDropdownFormField(
                  //   hintText: 'Employee',
                  //   label: "Select Employee",
                  //   itemsValues: controller.userId.text,
                  //   items: List.generate(
                  //     Get.find<LookupTableService>().userList.length,
                  //     (index) {
                  //       return DropdownMenuItem(
                  //         value: "${Get.find<LookupTableService>().userList.elementAt(index)["id"]}",
                  //         child: Text("${Get.find<LookupTableService>().userList.elementAt(index)["emp_no"]}"
                  //             "${Get.find<LookupTableService>().userList.elementAt(index)["name"]}"),
                  //       );
                  //     },
                  //   ),
                  //   onChanged: (data) {
                  //     controller.userId.text = data!.toString();
                  //   },
                  //   validator: APPInputValidator.validateRequired,
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // AppInputDatePickerFormField(
                  //   label: "Vacation Starting ",
                  //   hintText: "Vacation Starting ",
                  //   initialDate: DateTime.parse(controller.stating.text),
                  //   validator: APPInputValidator.validateRequired,
                  //   onChanged: (data) {
                  //     DateTime? date = DateTime.parse(data.toString());
                  //     if (date != null) {
                  //       // Format the date to Y-m-d format
                  //       String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                  //       // Set the formatted date to the controller
                  //       controller.stating.text = formattedDate;
                  //     }
                  //   },
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),

                  // AppInputDatePickerFormField(
                  //   label: "Vacation Ending Date",
                  //   hintText: "Vacation Ending Date",
                  //   validator: APPInputValidator.validateRequired,
                  //   initialDate: DateTime.parse(controller.ending.text),
                  //   onChanged: (data) {
                  //     DateTime? date = DateTime.parse(data.toString());
                  //     if (date != null) {
                  //       // Format the date to Y-m-d format
                  //       String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                  //       // Set the formatted date to the controller
                  //       controller.ending.text = formattedDate;
                  //     }
                  //   },
                  // ),

                  // SizedBox(
                  //   height: 10,
                  // ),
                  // AppTextFormField(
                  //   controller: controller.days,
                  //   hintText: 'Days',
                  //   label: "Days",
                  //   validator: APPInputValidator.validateRequired,
                  //   inputFormatters: [AppInputConfig.digitsOnly],
                  //   onChanged: (date) {
                  //     controller.days.text = date.toString();
                  //   },
                  // ),
                  SizedBox(
                    height: 19,
                  ),
                  AppDropdownFormField(
                    hintText: 'type',
                    label: "type",
                    itemsValues: controller.type.text,
                    items: [
                      DropdownMenuItem(
                        child: Text("annual"),
                        value: "annual",
                      ),
                      DropdownMenuItem(
                        child: Text("emergency"),
                        value: "emergency",
                      ),
                      DropdownMenuItem(
                        child: Text("sick"),
                        value: "sick",
                      ),
                      DropdownMenuItem(
                        child: Text("without_pay"),
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
                  AppDropdownFormField(
                    hintText: 'Status',
                    label: "Status",
                    itemsValues: controller.state.text,
                    items: [
                      DropdownMenuItem(
                        child: Text("Approval"),
                        value: "approval",
                      ),
                      DropdownMenuItem(
                        child: Text("Rejection"),
                        value: "rejection",
                      ),
                      DropdownMenuItem(
                        child: Text("Wait For Reply"),
                        value: "wait_for_reply",
                      ),
                    ],
                    onChanged: (data) {
                      controller.state.text = data!.toString();
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
                    label: "Update",
                    onPressed: controller.onPressedUpdateButton,
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
