import 'package:dashbord/components/components.base_data_table.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/excuse_controller.dart';

class ExcuseView extends GetView<ExcuseController> {
  const ExcuseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (snapshot) {
          return BaseDataTable(
            columnsName: [
              "id",
              "user_name",
              "create_date",
              "starting",
              "ending",
              "days",
              "type",
              "state",
              "Action",
            ],
            rowsName: [
              "id",
              "user_name",
              "create_date",
              "starting",
              "ending",
              "days",
              "type",
              "state",
              "",
            ],
            data: snapshot!,
            onDeletePressed: (selectItem) {
              controller.deleteExcuses(selectItem["id"]);
            },
          );
        },
      ),
    );
  }
}
