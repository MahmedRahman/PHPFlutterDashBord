import 'package:dashbord/components/components.button.dart';
import 'package:dashbord/components/components.form_field.dart';
import 'package:dashbord/generic/app_input_validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/department_add_controller.dart';

class DepartmentAddView extends GetView<DepartmentAddController> {
  const DepartmentAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx((snapshot) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formkey,
            child: Column(
              children: [
                AppTextFormField(
                  controller: controller.title,
                  hintText: 'Department Title',
                  label: "Department Title",
                  validator: APPInputValidator.validateFirstName,
                  onChanged: (data) {
                    controller.title.text = data.toString();
                  },
                ),
                SizedBox(
                  height: 19,
                ),
                AppButton(
                  label: "save",
                  onPressed: controller.onPressedSaveButton,
                  stretch: true,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
