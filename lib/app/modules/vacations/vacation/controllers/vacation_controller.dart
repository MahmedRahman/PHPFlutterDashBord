import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/generic/app_dialog.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.api.dart';
import 'package:get/get.dart';

class VacationController extends GetxController with StateMixin {
  @override
  void onInit() {
    getVacation();
    super.onInit();
  }

  void getVacation() async {
    try {
      ResponseModel responseModel = await WebServices().getVacation();
      change(responseModel.data["data"], status: RxStatus.success());
    } catch (e) {
      //change(null, status: RxStatus.error());
    }
  }


   void deleteVacation(vacationId) async {
    APPDialog.showYesNoDialog(
      title: "Delete Department",
      message: "Are you sure you want to delete this Department? This action cannot be undone.",
      onYesPressed: () async {
        try {
          ResponseModel responseModel = await WebServices().deleteVacation(vacationId);
          getVacation();
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
