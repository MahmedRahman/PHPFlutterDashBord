import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:dashbord/web_serives/web_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  var LoginData;
  bool _isLoggedUser = false;
  final _box = GetStorage();
  var _token;
  String get token {
    return _token;
  }

  String get role {
    return LoginData["role"] ?? "";
  }

  String get isActive {
    return LoginData["is_active"] ?? "";
  }

  bool get isLoggedIn => _isLoggedUser;

  AuthService() {
    _getLoggedData();
    checkToken();
  }

  void saveLoginData(token) {
    _box.write('token', '${token}');
  }

  void _getLoggedData() {
    if (_box.hasData('token')) {
      _token = _box.read('token');
      _isLoggedUser = true;
    }
  }

  void logOut() {
    final box = GetStorage();
    box.remove('token');

    _isLoggedUser = false;
    _token = "";
    LoginData = "";
  }

  void checkToken() async {
    try {
      ResponseModel responseModel = await WebServices().checkToken();
      LoginData = responseModel.data["data"];
      _isLoggedUser = true;
    } catch (e) {
      _isLoggedUser = false;
      _token = "";
      LoginData = "";
    }
  }
}


    //_token = data["access_token"].toString();
