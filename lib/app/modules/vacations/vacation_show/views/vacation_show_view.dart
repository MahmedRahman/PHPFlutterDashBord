import 'package:dashbord/components/components.label_form_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vacation_show_controller.dart';

class VacationShowView extends GetView<VacationShowController> {
  const VacationShowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx((snapshot) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppLabelFormField(
                label: "ID",
                hintText: snapshot["id"].toString(),
              ),
              AppLabelFormField(
                label: "user_name",
                hintText: snapshot["user_name"].toString(),
              ),
              SizedBox(
                height: 10,
              ),
              AppLabelFormField(
                label: "starting",
                hintText: snapshot["starting"].toString(),
              ),
              SizedBox(
                height: 10,
              ),
              AppLabelFormField(
                label: "ending",
                hintText: snapshot["ending"].toString(),
              ),
              SizedBox(
                height: 10,
              ),
              AppLabelFormField(
                label: "days",
                hintText: snapshot["days"].toString(),
              ),
              SizedBox(
                height: 10,
              ),
              AppLabelFormField(
                label: "type",
                hintText: snapshot["type"].toString(),
              ),
              SizedBox(
                height: 10,
              ),
              AppLabelFormField(
                label: "state",
                hintText: snapshot["state"].toString(),
              ),
              SizedBox(
                height: 10,
              ),
              AppLabelFormField(
                label: "comments",
                hintText: snapshot["comments"].toString(),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      }),
    );
  }
}
