import 'package:dashbord/components/components.base_data_table.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/department_controller.dart';

class DepartmentView extends GetView<DepartmentController> {
  const DepartmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (snapshot) {
          return BaseDataTable(
            columnsName: ["id", "title", "Action"],
            rowsName: ["id", "title", ""],
            data: snapshot!,
            onDeletePressed: (selectItem) {
              controller.deleteDepartments(selectItem["id"]);
            },
          );
        },
      ),
    );
  }
}
