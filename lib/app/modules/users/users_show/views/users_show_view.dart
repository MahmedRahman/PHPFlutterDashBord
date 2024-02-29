import 'package:dashbord/components/components.label_form_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/users_show_controller.dart';

class UsersShowView extends GetView<UsersShowController> {
  const UsersShowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx((snapshot) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppLabelFormField(
                label: "ID",
                hintText: snapshot["id"].toString(),
              ),
              SizedBox(
                height: 20,
              ),
              AppLabelFormField(
                label: "Name",
                hintText: snapshot["name"].toString(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(snapshot["email"].toString()),
              SizedBox(
                height: 20,
              ),
              Text(snapshot["is_active"].toString()),
              SizedBox(
                height: 20,
              ),
              Text(snapshot["vacation_days"].toString()),
              SizedBox(
                height: 20,
              ),
              Text(snapshot["join_date"].toString()),
            ],
          ),
        );
      }),
    );
  }
}
