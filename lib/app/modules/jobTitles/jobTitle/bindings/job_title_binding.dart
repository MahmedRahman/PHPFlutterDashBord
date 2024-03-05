import 'package:get/get.dart';

import '../controllers/job_title_controller.dart';

class JobTitleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobTitleController>(
      () => JobTitleController(),
    );
  }
}
