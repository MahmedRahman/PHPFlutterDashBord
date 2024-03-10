import 'package:dashbord/common/service.lookup_data_service.dart';
import 'package:dashbord/generic/app_SnackBar.dart';
import 'package:dashbord/generic/app_dialog.dart';
import 'package:dashbord/web_serives/exception.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.dart';
import 'package:get/get.dart';

class UsersListController extends GetxController with StateMixin<List> {
  @override
  void onInit() {
    getUsers();
    Get.find<LookupTableService>().initLookupData();
    super.onInit();
  }

  void getUsers() async {
    try {
      ResponseModel responseModel = await WebServices().getUsers();
      change(responseModel.data["data"], status: RxStatus.success());
    } on EmptyDataException catch (_) {
      change(null, status: RxStatus.empty());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  void deleteUser(userId) async {
    APPDialog.showYesNoDialog(
      title: "Delete User",
      message: "Are you sure you want to delete this user? This action cannot be undone.",
      onYesPressed: () async {
        try {
          ResponseModel responseModel = await WebServices().deleteUser(userId);
          getUsers();
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
