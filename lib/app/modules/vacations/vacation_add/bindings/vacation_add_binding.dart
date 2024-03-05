import 'package:get/get.dart';

import '../controllers/vacation_add_controller.dart';

class VacationAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VacationAddController>(
      () => VacationAddController(),
    );
  }
}
