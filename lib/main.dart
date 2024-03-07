import 'package:dashbord/common/service.auth.dart';
import 'package:dashbord/common/service.lookup_data_service.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'web_serives/web_services.dart';

void main() async {
  await GetStorage.init();
  Get.put(AuthService());
  Get.put(LookupTableService());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      transitionDuration: Duration(),
    ),
  );
}



//   await getDepartments();
//   await getJobTitles();
// List departmentsList = [];
// List jobTitlesList = [];
// Future getDepartments() async {
//   try {
//     ResponseModel responseModel = await WebServices().getDepartments();
//     departmentsList = responseModel.data["data"];
//     print(departmentsList);
//   } catch (e) {
//     //change(null, status: RxStatus.error());
//   }
// }

// Future getJobTitles() async {
//   try {
//     ResponseModel responseModel = await WebServices().getJobTitles();
//     jobTitlesList = responseModel.data["data"];
//   } catch (e) {
//     // change(null, status: RxStatus.error());
//   }
// }
