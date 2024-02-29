import 'package:dashbord/app/modules/home/views/home_view.dart';
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
    if (page is HomeView || page is UsersListView || page is UsersAddView || page is UsersShowView) {
      return LayoutTemplate(
        child: page,
      );
    }

    return page;
  }
}
