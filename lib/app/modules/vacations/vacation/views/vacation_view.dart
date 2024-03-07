import 'package:dashbord/app_empty.dart';
import 'package:dashbord/components/components.base_data_table.dart';
import '../controllers/vacation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VacationView extends GetView<VacationController> {
  const VacationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (snapshot) {
          return BaseDataTable(
            columnsName: [
              "ID",
              "Create Date",
              "Name",
              "Start",
              "End",
              "Days",
              "Type",
              "state",
              "Action",
            ],
            rowsName: [
              "id",
              "create_date",
              "user_name",
              "starting",
              "ending",
              "days",
              "type",
              "state",
              "",
            ],
            data: snapshot!,
            onDeletePressed: (selectItem) {
              controller.deleteVacation(selectItem["id"]);
            },
            onUpdatePressed: (selectItem) {
              Get.toNamed(
                '/vacation/update?id=${selectItem["id"].toString()}',
                arguments: selectItem,
              );
            },
            onShowPressed: (selectItem) {
              Get.toNamed(
                '/vacation/show?id=${selectItem["id"].toString()}',
                arguments: selectItem,
              );
            },
          );
        },
        onEmpty: APPEmptyPage(
          title: "No Data Found.",
        ),
      ),
    );
  }
}
