import 'package:get/get.dart';

import '../controllers/department_add_controller.dart';

class DepartmentAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DepartmentAddController>(
      () => DepartmentAddController(),
    );
  }
}
