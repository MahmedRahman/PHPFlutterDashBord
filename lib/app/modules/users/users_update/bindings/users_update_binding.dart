import 'package:get/get.dart';

import '../controllers/users_update_controller.dart';

class UsersUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersUpdateController>(
      () => UsersUpdateController(),
    );
  }
}
