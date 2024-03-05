import 'package:dashbord/app/modules/departments/department/views/department_view.dart';
import 'package:dashbord/app/modules/departments/department_add/views/department_add_view.dart';
import 'package:dashbord/app/modules/login/views/login_view.dart';
import 'package:dashbord/app/modules/register/views/register_view.dart';
import 'package:dashbord/app/modules/users/users_add/views/users_add_view.dart';
import 'package:dashbord/app/modules/users/users/views/users_list_view.dart';
import 'package:dashbord/app/modules/users/users_show/views/users_show_view.dart';
import 'package:dashbord/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

int currentIndex = 0;

class GlobalMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  Widget onPageBuilt(Widget page) {
    return LayoutTemplate(
      child: page,
    );
  }
}

/*
page is UsersAddView ||
page is UsersShowView ||
page is DepartmentAddView ||
page is DepartmentView
*/