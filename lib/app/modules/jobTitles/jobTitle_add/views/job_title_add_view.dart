import 'package:dashbord/common/service.lookup_data_service.dart';
import 'package:dashbord/components/components.button.dart';
import 'package:dashbord/components/components.drop_down_form_field.dart';
import 'package:dashbord/components/components.form_field.dart';
import 'package:dashbord/generic/app_input_validator.dart';
import 'package:dashbord/main.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/job_title_add_controller.dart';

class JobTitleAddView extends GetView<JobTitleAddController> {
  const JobTitleAddView({Key? key}) : super(key: key);
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
                AppDropdownFormField(
                  hintText: 'Department',
                  label: "Department",
                  items: List.generate(
                  Get.find<LookupTableService>().departmentsList.length,
                    (index) {
                      return DropdownMenuItem(
                        value: "${  Get.find<LookupTableService>().departmentsList.elementAt(index)["id"]}",
                        child: Text("${  Get.find<LookupTableService>().departmentsList.elementAt(index)["title"]}"),
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
