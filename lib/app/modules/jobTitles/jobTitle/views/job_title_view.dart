import 'package:dashbord/app_empty.dart';
import 'package:dashbord/components/components.base_data_table.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/job_title_controller.dart';

class JobTitleView extends GetView<JobTitleController> {
  const JobTitleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (snapshot) {
          return BaseDataTable(
            columnsName: ["id", "department", "title", "Action"],
            rowsName: ["id", "department", "title", ""],
            data: snapshot!,
            onDeletePressed: (selectItem) {
              controller.deleteJobTitles(selectItem["id"]);
            },
          );
        },
        onEmpty: APPEmptyPage(
          title: "No Job Titles Found!",
        ),
      ),
    );
  }
}
