import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.api.dart';
import 'package:get/get.dart';

class UsersShowController extends GetxController with StateMixin {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getUser(Get.parameters["id"].toString());
  }

  void getUser(userID) async {
    try {
      ResponseModel responseModel = await WebServices().getUser(userID.toString());

      change(responseModel.data["data"], status: RxStatus.success());
    } catch (e) {
      APPSnackbar.showMessageFailure(message: e.toString());
    }
  }
}
