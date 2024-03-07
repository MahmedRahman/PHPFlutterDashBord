import 'package:dashbord/app_empty.dart';
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
              "Date",
              "Name",
              "Start",
              "End",
              "state",
              "Action",
            ],
            rowsName: [
              "id",
              "create_date",
              "user_name",
              "stating",
              "ending",
              "state",
              "",
            ],
            data: snapshot!,
            onDeletePressed: (selectItem) {
              controller.deleteExcuses(selectItem["id"]);
            },
            onUpdatePressed: (selectItem) {
              Get.toNamed(
                '/excuses/update?id=${selectItem["id"].toString()}',
                arguments: selectItem,
              );
            },
          );
        },
        onEmpty: APPEmptyPage(
          title: "No Data Found",
        ),
      ),
    );
  }
}
