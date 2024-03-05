import 'package:dashbord/components/components.app_label.dart';
import 'package:dashbord/components/components.base_data_table.dart';
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
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLabelFormField(
                  label: "ID",
                  hintText: snapshot["id"].toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                AppLabelFormField(
                  label: "Name",
                  hintText: snapshot["name"].toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                AppLabelFormField(
                  label: "Department",
                  hintText: snapshot["department_value"].toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                AppLabelFormField(
                  label: "job Title",
                  hintText: snapshot["job_titles_value"].toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                AppLabelFormField(
                  label: "is_active",
                  hintText: snapshot["is_active"].toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                AppLabelFormField(
                  label: "vacation_days",
                  hintText: snapshot["vacation_days"].toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                AppLabelFormField(
                  label: "join_date",
                  hintText: snapshot["join_date"].toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                APPLabel(
                  title: "Vacation",
                  subTitle: (snapshot["vacation"].length == 0) ? "" : snapshot["vacation"].length.toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                (snapshot["vacation"].length == 0)
                    ? Text('No vacation Days')
                    : BaseDataTable(
                        columnsName: ["id", "create_date", "type", "state"],
                        rowsName: ["id", "create_date", "type", "state"],
                        data: snapshot["vacation"],
                      ),
                SizedBox(
                  height: 10,
                ),
                APPLabel(
                  title: "Excuse",
                  subTitle: (snapshot["Excuse"].length == 0) ? "" : snapshot["Excuse"].length.toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                (snapshot["Excuse"].length == 0)
                    ? Text('No Excuse Days')
                    : BaseDataTable(
                        columnsName: ["id", "create_date", "state", "stating", "ending"],
                        rowsName: ["id", "create_date", "state", "stating", "ending"],
                        data: snapshot["Excuse"],
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
