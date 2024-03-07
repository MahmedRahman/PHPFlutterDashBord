import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:get/get.dart';

class VacationShowController extends GetxController with StateMixin {
  //TODO: Implement VacationShowController

  @override
  void onInit() {
    getVacation(Get.arguments);
    super.onInit();
  }

  void getVacation(vacation) async {
    try {
      change(vacation, status: RxStatus.success());
    } catch (e) {
      APPSnackbar.showMessageFailure(message: e.toString());
    }
  }
}
