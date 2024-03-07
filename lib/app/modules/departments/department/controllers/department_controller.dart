import 'package:dashbord/common/service.lookup_data_service.dart';
import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/generic/app_dialog.dart';
import 'package:dashbord/web_serives/exception.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.api.dart';
import 'package:get/get.dart';

class DepartmentController extends GetxController with StateMixin<List> {
  final count = 0.obs;
  @override
  void onInit() async {
    getDepartments();
    super.onInit();
  }

  void getDepartments() async {
    try {
      ResponseModel responseModel = await WebServices().getDepartments();

      change(responseModel.data["data"], status: RxStatus.success());
    } on EmptyDataException catch (_) {
      change(null, status: RxStatus.empty());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  void deleteDepartments(departmentsId) async {
    APPDialog.showYesNoDialog(
      title: "Delete Department",
      message: "Are you sure you want to delete this Department? This action cannot be undone.",
      onYesPressed: () async {
        try {
          ResponseModel responseModel = await WebServices().deleteDepartments(departmentsId);
          getDepartments();
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
