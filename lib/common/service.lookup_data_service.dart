import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.api.dart';
import 'package:get/get.dart';

class LookupTableService extends GetxService {
  List<dynamic> departmentsList = [];
  List<dynamic> jobTitlesList = [];

  WebServices webServices = WebServices(); // Assuming WebServices is already defined.

  LookupTableService() {
    _initLookupData();
  }

  Future<void> _initLookupData() async {
    await getDepartments();
    await getJobTitles();
  }

  Future<void> getDepartments() async {
    try {
      ResponseModel responseModel = await webServices.getDepartments();
      departmentsList = responseModel.data["data"];
    } catch (e) {
      // Handle error
      print("Error fetching departments: $e");
    }
  }

  Future<void> getJobTitles() async {
    try {
      ResponseModel responseModel = await webServices.getJobTitles();
      jobTitlesList = responseModel.data["data"];
    } catch (e) {
      // Handle error
      print("Error fetching job titles: $e");
    }
  }
}