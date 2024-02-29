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
    required String name,
    required String email,
    required String password,
    required String role,
    required bool isActive,
    required int vacationDays,
    required String joinDate,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}user/add",
      HTTPRequestMethod: HTTPRequestEnum.POST,
      query: {
        "name": name,
        "email": email,
        "password": password,
        "role": role,
        "is_active": isActive,
        "vacation_days": vacationDays,
        "join_date": joinDate,
      },
    );
  }

  Future<ResponseModel> getUsers() async {
    return await ApiManger().execute(
      url: "${API.url}users",
      HTTPRequestMethod: HTTPRequestEnum.GET,
      isAuth: true,
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
    String? name,
    String? email,
    String? role,
    bool? isActive,
    int? vacationDays,
    String? joinDate,
  }) async {
    return await ApiManger().execute(
      url: "${API.url}user/$userId",
      HTTPRequestMethod: HTTPRequestEnum.PUT,
      isAuth: true,
      query: {
        "name": name,
        //"email": email,
        "is_active": isActive,
        "role": role,
        "vacation_days": vacationDays,
        "join_date": joinDate,
      },
    );
  }
}
