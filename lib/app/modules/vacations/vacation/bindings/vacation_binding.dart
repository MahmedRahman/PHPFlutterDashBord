import 'package:get/get.dart';

import '../controllers/vacation_controller.dart';

class VacationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VacationController>(
      () => VacationController(),
    );
  }
}
