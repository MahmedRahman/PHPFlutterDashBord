import 'package:get/get.dart';

import '../controllers/excuse_controller.dart';

class ExcuseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExcuseController>(
      () => ExcuseController(),
    );
  }
}
