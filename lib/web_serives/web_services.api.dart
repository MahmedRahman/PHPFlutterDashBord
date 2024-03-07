import 'package:dashbord/web_serives/api_manger.dart';
import 'package:dashbord/web_serives/web_services.dart';

import 'model/api_response_model.dart';

class WebServices {
  WebServices();

  // #=========================================================
  //Auth
  // #=========================================================
  Future<ResponseModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}login",
      HTTPRequestMethod: HTTPRequestEnum.POST,
      query: {
        "email": "$email",
        "password": "$password",
      },
    );
  }

  Future<ResponseModel> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}register",
      HTTPRequestMethod: HTTPRequestEnum.POST,
      query: {
        "name": "$name",
        "email": "$email",
        "password": "$password",
      },
    );
  }

  Future<ResponseModel> addUser({
    required String employee_no,
    required String name,
    required String email,
    required String password,
    required String role,
    required bool isActive,
    required int vacationDays,
    required String joinDate,
    required String department_id,
    required String job_titles_id,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}user/add",
      HTTPRequestMethod: HTTPRequestEnum.POST,
      query: {
        "employee_no": employee_no,
        "name": name,
        "email": email,
        "password": password,
        "role": role,
        "is_active": isActive,
        "vacation_days": vacationDays,
        "join_date": joinDate,
        "department_id": department_id,
        "job_titles_id": job_titles_id,
      },
    );
  }

  Future<ResponseModel> getUsers() async {
    return await ApiManger().execute(
      url: "${API.url}users",
      HTTPRequestMethod: HTTPRequestEnum.GET,
      // isAuth: true,
    );
  }

  Future<ResponseModel> deleteUser(userId) async {
    return await ApiManger().execute(
      url: "${API.url}user/$userId",
      HTTPRequestMethod: HTTPRequestEnum.Delete,
      isAuth: true,
    );
  }

  Future<ResponseModel> getUser(String userId) async {
    return await ApiManger().execute(
      url: "${API.url}user/$userId",
      HTTPRequestMethod: HTTPRequestEnum.GET,
      isAuth: true,
    );
  }

  Future<ResponseModel> updateUser({
    required String userId,
    required String employee_no,
    String? name,
    String? email,
    String? role,
    bool? isActive,
    int? vacationDays,
    String? joinDate,
    required String department_id,
    required String job_titles_id,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}user/$userId",
      HTTPRequestMethod: HTTPRequestEnum.PUT,
      isAuth: true,
      query: {
        "employee_no": employee_no,
        "name": name,
        "is_active": isActive,
        "role": role,
        "vacation_days": vacationDays,
        "join_date": joinDate,
        "department_id": department_id,
        "job_titles_id": job_titles_id,
      },
    );
  }

  Future<ResponseModel> getDepartments() async {
    return await ApiManger().execute(
      url: "${API.url}departments",
      HTTPRequestMethod: HTTPRequestEnum.GET,
    );
  }

  Future<ResponseModel> getJobTitles() async {
    return await ApiManger().execute(
      url: "${API.url}job_titles",
      HTTPRequestMethod: HTTPRequestEnum.GET,
    );
  }

  Future<ResponseModel> deleteJobTitles(JobTitlesId) async {
    return await ApiManger().execute(
      url: "${API.url}job_titles/$JobTitlesId",
      HTTPRequestMethod: HTTPRequestEnum.Delete,
      isAuth: true,
    );
  }

  Future<ResponseModel> deleteDepartments(departmentsId) async {
    return await ApiManger().execute(
      url: "${API.url}departments/$departmentsId",
      HTTPRequestMethod: HTTPRequestEnum.Delete,
      isAuth: true,
    );
  }

  Future<ResponseModel> addDepartments({
    required String title,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}departments/add",
      HTTPRequestMethod: HTTPRequestEnum.POST,
      query: {
        "title": title,
      },
    );
  }

  Future<ResponseModel> addJobTitle({
    required String title,
    required String departments_id,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}job_titles/add",
      HTTPRequestMethod: HTTPRequestEnum.POST,
      query: {
        "departments_id": "${departments_id}",
        "title": title,
      },
    );
  }

  Future<ResponseModel> getVacation() async {
    return await ApiManger().execute(
      url: "${API.url}vacation",
      HTTPRequestMethod: HTTPRequestEnum.GET,
    );
  }

  Future<ResponseModel> deleteVacation(vacationId) async {
    return await ApiManger().execute(
      url: "${API.url}vacation/$vacationId",
      HTTPRequestMethod: HTTPRequestEnum.Delete,
      isAuth: true,
    );
  }

  Future<ResponseModel> addVacation({
    required String user_id,
    required String stating,
    required String ending,
    required String days,
    required String type,
    required String comments,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}vacation/add",
      HTTPRequestMethod: HTTPRequestEnum.POST,
      query: {
        //"create_date": "2024-03-03",
        "stating": "${stating}",
        "ending": "${ending}",
        "days": days,
        "user_id": user_id,
        "type": "${type}", //'annual', 'emergency', 'sick', 'without_pay'
        "comments": "${comments}"
      },
    );
  }

  Future<ResponseModel> updateVacation({
    required String vacationId,
    required String user_id,
    required String stating,
    required String ending,
    required String days,
    required String type,
    required String state,
    required String comments,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}vacation/${vacationId}",
      HTTPRequestMethod: HTTPRequestEnum.PUT,
      query: {
        // "stating": "${stating}",
        // "ending": "${ending}",
        //"days": days,
        "type": "${type}", //'annual', 'emergency', 'sick', 'without_pay'
        "state": "${state}", // 'approval', 'rejection','wait_for_reply'
        "comments": "${comments}"
      },
    );
  }

  Future<ResponseModel> getExcuses() async {
    return await ApiManger().execute(
      url: "${API.url}excuses",
      HTTPRequestMethod: HTTPRequestEnum.GET,
    );
  }

  Future<ResponseModel> deleteExcuses(excusesId) async {
    return await ApiManger().execute(
      url: "${API.url}excuses/$excusesId",
      HTTPRequestMethod: HTTPRequestEnum.Delete,
      isAuth: true,
    );
  }

  Future<ResponseModel> addExcuses({
    required String createDate,
    required String stating,
    required String ending,
    required String user_id,
    required String state,
    required String comments,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}excuses/add",
      HTTPRequestMethod: HTTPRequestEnum.POST,
      query: {
        "create_date": "${createDate}",
        "stating": "${stating}",
        "ending": "${ending}",
        "state": "${state}",
        "user_id": "${user_id}", // This is optional since your method defaults to the authenticated user's ID
        "comments": "${comments}",
      },
    );
  }

  Future<ResponseModel> updateExcuses({
    required String id,
    required String state,
    required String comments,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}excuses/${id}",
      HTTPRequestMethod: HTTPRequestEnum.PUT,
      query: {
        "state": "${state}",
        "comments": "${comments}",
      },
    );
  }
}
