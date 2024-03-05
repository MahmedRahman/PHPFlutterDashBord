import 'package:get/get.dart';

import '../controllers/excuses_show_controller.dart';

class ExcusesShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExcusesShowController>(
      () => ExcusesShowController(),
    );
  }
}
