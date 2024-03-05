import 'package:get/get.dart';

import '../controllers/vacation_show_controller.dart';

class VacationShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VacationShowController>(
      () => VacationShowController(),
    );
  }
}
