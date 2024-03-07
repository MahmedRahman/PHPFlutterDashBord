import 'package:dashbord/app/modules/users/users_show/bindings/users_show_binding.dart';
import 'package:dashbord/app/modules/users/users_show/controllers/users_show_controller.dart';
import 'package:dashbord/app_empty.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/users_list_controller.dart';

class UsersListView extends GetView<UsersListController> {
  const UsersListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (snapshot) {
          return SingleChildScrollView(
            child: DataTable(
              columns: [
                DataColumn(
                  label: Text("ID"),
                ),
                DataColumn(
                  label: Text("Emp ID"),
                ),
                DataColumn(
                  label: Text("Name"),
                ),
                DataColumn(
                  label: Text("Email"),
                ),
                DataColumn(
                  label: Text("Type"),
                ),
                DataColumn(
                  label: Text("Days"),
                ),
                DataColumn(
                  label: Text("Action"),
                ),
              ],
              rows: List.generate(snapshot!.length, (index) {
                return DataRow(
                  color: snapshot[index]["is_active"] == 0
                      ? MaterialStateProperty.all(Colors.red)
                      : MaterialStateProperty.all(Colors.transparent),
                  cells: [
                    DataCell(
                      Text(snapshot[index]["id"].toString()),
                    ),
                    DataCell(
                      Text(snapshot[index]["emp_no"].toString()),
                    ),
                    DataCell(
                      Text(snapshot[index]["name"].toString()),
                    ),
                    DataCell(
                      Text(snapshot[index]["email"].toString()),
                    ),
                    DataCell(
                      Text(snapshot[index]["role"].toString()),
                    ),
                    DataCell(
                      Text(snapshot[index]["vacation_days"].toString()),
                    ),
                    DataCell(Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.deleteUser(snapshot[index]["id"].toString());
                          },
                          icon: Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(
                              '/users/update?id=${snapshot[index]["id"].toString()}',
                              arguments: snapshot[index],
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed(
                              '/users/show?id=${snapshot[index]["id"].toString()}',
                              arguments: snapshot[index],
                            );
                          },
                          icon: Icon(Icons.view_agenda),
                        ),
                      ],
                    )),
                  ],
                );
              }),
            ),
          );
        },
        onEmpty: APPEmptyPage(
          title: "No User Found",
        ),
      ),
    );
  }
}
