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
                    color: Colors.white,
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
                          title: Text("Home"),
                          onTap: () {
                            Get.offAllNamed("/home");
                          },
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.list),
                          title: Text("users List"),
                          onTap: () {
                            Get.offAllNamed('/users');
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.add),
                          title: Text("users Add"),
                          onTap: () {
                            Get.offAllNamed('/users/add');
                          },
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.list),
                          title: Text("Department List"),
                          onTap: () {
                            Get.offAllNamed('/departments');
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.add),
                          title: Text("Department Add"),
                          onTap: () {
                            Get.offAllNamed('/departments/add');
                          },
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.list),
                          title: Text("Job Title List"),
                          onTap: () {
                            Get.offAllNamed('/jobTitles');
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.add),
                          title: Text("Job Title Add"),
                          onTap: () {
                            Get.offAllNamed('/jobTitles/add');
                          },
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.list),
                          title: Text("Vacation List"),
                          onTap: () {
                            Get.offAllNamed('/vacation');
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.add),
                          title: Text("Vacation Add"),
                          onTap: () {
                            Get.offAllNamed('/vacation/add');
                          },
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.list),
                          title: Text("Excuses List"),
                          onTap: () {
                            Get.offAllNamed('/excuses');
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.add),
                          title: Text("Excuses Add"),
                          onTap: () {
                            Get.offAllNamed('/excuses/add');
                          },
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: Get.width,
                          color: Colors.blue,
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
                          color: Colors.orange,
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
