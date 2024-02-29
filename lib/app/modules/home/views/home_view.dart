import 'package:dashbord/app/modules/register/bindings/register_binding.dart';
import 'package:dashbord/app/modules/register/views/register_view.dart';
import 'package:dashbord/app/routes/app_pages.dart';
import 'package:dashbord/common/service.auth.dart';
import 'package:dashbord/components/components.button.dart';
import 'package:dashbord/components/components.form_field.dart';
import 'package:dashbord/generic/app_input_validator.dart';
import 'package:dashbord/layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ListTile(
          //   leading: Icon(Icons.abc),
          //   title: Text("users"),
          //   onTap: () {
          //     Get.toNamed(
          //       Routes.USERS_LIST,
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.abc),
          //   title: Text("Add"),
          //   onTap: () {
          //     Get.toNamed(Routes.USERS_ADD);
          //   },
          // ),
        ],
      ),
    );
  }
}
