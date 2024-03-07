import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/generic/app_dialog.dart';
import 'package:dashbord/web_serives/exception.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.api.dart';
import 'package:get/get.dart';

class JobTitleController extends GetxController with StateMixin {
  //TODO: Implement JobTitleController

  @override
  void onInit() {
    getJobTitles();
    super.onInit();
  }

  void getJobTitles() async {
    try {
      ResponseModel responseModel = await WebServices().getJobTitles();
      change(responseModel.data["data"], status: RxStatus.success());
    } on EmptyDataException catch (_) {
      change(null, status: RxStatus.empty());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  void deleteJobTitles(jobTitlesId) async {
    APPDialog.showYesNoDialog(
      title: "Delete Department",
      message: "Are you sure you want to delete this Department? This action cannot be undone.",
      onYesPressed: () async {
        try {
          ResponseModel responseModel = await WebServices().deleteJobTitles(jobTitlesId);
          getJobTitles();
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
