import 'package:dashbord/common/service.lookup_data_service.dart';
import 'package:dashbord/components/components.Input_date_picker.dart';
import 'package:dashbord/components/components.Input_time_picker.dart';
import 'package:dashbord/components/components.button.dart';
import 'package:dashbord/components/components.drop_down_form_field.dart';
import 'package:dashbord/components/components.form_field.dart';
import 'package:dashbord/generic/app_input_validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/excuses_update_controller.dart';

class ExcusesUpdateView extends GetView<ExcusesUpdateController> {
  const ExcusesUpdateView({Key? key}) : super(key: key);
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
