import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.api.dart';
import 'package:get/get.dart';

class LookupTableService extends GetxService {
  List<dynamic> departmentsList = [];
  List<dynamic> jobTitlesList = [];
  List<dynamic> userList = [];
  WebServices webServices = WebServices(); // Assuming WebServices is already defined.

  LookupTableService() {
    initLookupData();
  }

  Future<void> initLookupData() async {
    await getDepartments();
    await getJobTitles();
    await getUsers();
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

  Future<void> getUsers() async {
    try {
      ResponseModel responseModel = await webServices.getUsers();
      userList = responseModel.data["data"];
    } catch (e) {
      // Handle error
      print("Error fetching job titles: $e");
    }
  }
}
