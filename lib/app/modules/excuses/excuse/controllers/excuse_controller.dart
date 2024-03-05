import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/generic/app_dialog.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.api.dart';
import 'package:get/get.dart';

class ExcuseController extends GetxController with StateMixin {
  //TODO: Implement ExcuseController

  final count = 0.obs;
  @override
  void onInit() {
    getExcuses();
    super.onInit();
  }

  void getExcuses() async {
    try {
      ResponseModel responseModel = await WebServices().getExcuses();
      change(responseModel.data["data"], status: RxStatus.success());
    } catch (e) {
      //change(null, status: RxStatus.error());
    }
  }

  void deleteExcuses(excusesId) async {
    APPDialog.showYesNoDialog(
      title: "Delete Department",
      message: "Are you sure you want to delete this Department? This action cannot be undone.",
      onYesPressed: () async {
        try {
          ResponseModel responseModel = await WebServices().deleteExcuses(excusesId);
          getExcuses();
        } catch (e) {
          APPSnackbar.showMessageFailure(message: e.toString());
        }
      },
      onNoPressed: () {
        Get.back();
      },
    );
  }
}
