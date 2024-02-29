import 'package:get/get.dart';

import '../controllers/users_show_controller.dart';

class UsersShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersShowController>(
      () => UsersShowController(),
    );
  }
}
