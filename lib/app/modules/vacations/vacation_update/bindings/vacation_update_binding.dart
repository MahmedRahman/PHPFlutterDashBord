import 'package:get/get.dart';

import '../controllers/vacation_update_controller.dart';

class VacationUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VacationUpdateController>(
      () => VacationUpdateController(),
    );
  }
}
