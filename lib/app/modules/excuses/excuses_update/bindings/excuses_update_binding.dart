import 'package:get/get.dart';

import '../controllers/excuses_update_controller.dart';

class ExcusesUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExcusesUpdateController>(
      () => ExcusesUpdateController(),
    );
  }
}
