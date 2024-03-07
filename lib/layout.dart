import 'package:dashbord/app/modules/departments/department/views/department_view.dart';
import 'package:dashbord/app/modules/departments/department_add/views/department_add_view.dart';
import 'package:dashbord/app/modules/excuses/excuse/views/excuse_view.dart';
import 'package:dashbord/app/modules/excuses/excuses_add/views/excuses_add_view.dart';
import 'package:dashbord/app/modules/home/views/home_view.dart';
import 'package:dashbord/app/modules/jobTitles/jobTitle/views/job_title_view.dart';
import 'package:dashbord/app/modules/jobTitles/jobTitle_add/views/job_title_add_view.dart';
import 'package:dashbord/app/modules/users/users/views/users_list_view.dart';
import 'package:dashbord/app/modules/users/users_add/views/users_add_view.dart';
import 'package:dashbord/app/modules/vacations/vacation/views/vacation_view.dart';
import 'package:dashbord/app/modules/vacations/vacation_add/views/vacation_add_view.dart';
import 'package:dashbord/app/routes/app_pages.dart';
import 'package:dashbord/common_ui/common_ui.color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LayoutTemplate extends GetView {
  LayoutTemplate({this.child});
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 250,
                    height: Get.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: Offset(0, 3), // Changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                          width: Get.width,
                          child: Container(
                            color: AppColor.greenColor,
                            width: Get.width,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                "assets/svg/logo.svg",
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.home),
                          selected: child is HomeView,
                          selectedColor: Colors.blue,
                          title: Text("Home"),
                          onTap: () {
                            Get.offAllNamed("/home");
                          },
                        ),
                        Divider(),
                        ListTile(
                          selected: child is UsersListView,
                          selectedColor: Colors.blue,
                          leading: Icon(Icons.list),
                          title: Text("users List"),
                          onTap: () {
                            Get.offAllNamed('/users');
                          },
                        ),
                        ListTile(
                          selected: child is UsersAddView,
                          selectedColor: Colors.blue,
                          leading: Icon(Icons.add),
                          title: Text("users Add"),
                          onTap: () {
                            Get.offAllNamed('/users/add');
                          },
                        ),
                        Divider(),
                        ListTile(
                          selected: child is DepartmentView,
                          selectedColor: Colors.blue,
                          leading: Icon(Icons.list),
                          title: Text("Department List"),
                          onTap: () {
                            Get.offAllNamed('/departments');
                          },
                        ),
                        ListTile(
                          selected: child is DepartmentAddView,
                          selectedColor: Colors.blue,
                          leading: Icon(Icons.add),
                          title: Text("Department Add"),
                          onTap: () {
                            Get.offAllNamed('/departments/add');
                          },
                        ),
                        Divider(),
                        ListTile(
                          selected: child is JobTitleView,
                          selectedColor: Colors.blue,
                          leading: Icon(Icons.list),
                          title: Text("Job Title List"),
                          onTap: () {
                            Get.offAllNamed('/jobTitles');
                          },
                        ),
                        ListTile(
                          selected: child is JobTitleAddView,
                          selectedColor: Colors.blue,
                          leading: Icon(Icons.add),
                          title: Text("Job Title Add"),
                          onTap: () {
                            Get.offAllNamed('/jobTitles/add');
                          },
                        ),
                        Divider(),
                        ListTile(
                          selected: child is VacationView,
                          selectedColor: Colors.blue,
                          leading: Icon(Icons.list),
                          title: Text("Vacation List"),
                          onTap: () {
                            Get.offAllNamed('/vacation');
                          },
                        ),
                        ListTile(
                          selected: child is VacationAddView,
                          selectedColor: Colors.blue,
                          leading: Icon(Icons.add),
                          title: Text("Vacation Add"),
                          onTap: () {
                            Get.offAllNamed('/vacation/add');
                          },
                        ),
                        Divider(),
                        ListTile(
                          selected: child is ExcuseView,
                          selectedColor: Colors.blue,
                          leading: Icon(Icons.list),
                          title: Text("Excuses List"),
                          onTap: () {
                            Get.offAllNamed('/excuses');
                          },
                        ),
                        ListTile(
                          selected: child is ExcusesAddView,
                          selectedColor: Colors.blue,
                          leading: Icon(Icons.add),
                          title: Text("Excuses Add"),
                          onTap: () {
                            Get.offAllNamed('/excuses/add');
                          },
                        ),
                        Spacer(),
                        ListTile(
                          selected: child is ExcusesAddView,
                          selectedColor: Colors.blue,
                          leading: Icon(Icons.logout),
                          title: Text("LogOut"),
                          onTap: () {
                            //Get.offAllNamed('/excuses/add');
                          },
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
                                spreadRadius: 5, // Spread radius
                                blurRadius: 7, // Blur radius
                                offset: Offset(0, 3), // Changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: Get.height - 60,
                          color: Colors.grey.shade300,
                          child: child,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
