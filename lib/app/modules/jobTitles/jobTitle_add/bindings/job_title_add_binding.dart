import 'package:get/get.dart';

import '../controllers/job_title_add_controller.dart';

class JobTitleAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobTitleAddController>(
      () => JobTitleAddController(),
    );
  }
}
