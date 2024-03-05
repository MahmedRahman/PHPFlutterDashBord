import 'package:get/get.dart';

import '../controllers/excuses_add_controller.dart';

class ExcusesAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExcusesAddController>(
      () => ExcusesAddController(),
    );
  }
}
