import 'dart:developer';
import 'package:dashbord/common/service.auth.dart';
import 'package:dashbord/web_serives/exception.dart';
import 'package:dashbord/web_serives/model/api_response_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class ApiManger extends GetConnect {
  ApiManger() {
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = Duration(seconds: 50);

    httpClient.addRequestModifier((Request request) {
      request.headers.addAll({
        'Accept': 'application/json',
      });
      return request;
    });
  }

  Future<ResponseModel> execute({
    required String url,
    required HTTPRequestEnum HTTPRequestMethod,
    dynamic query,
    bool isAuth = false,
  }) async {
    log("[${HTTPRequestMethod.name}]  ${url}", name: "http-request");

    Response? response;
    try {
      if (HTTPRequestMethod == HTTPRequestEnum.GET) {
        response = await get(
          url,
          headers: {
            'Authorization': "Bearer ${Get.find<AuthService>().token}",
            //'Authorization': "Bearer 22|HB9PiYZipW9orD4AtyqHe2v7bTq44OISsvsdzJEsaa65751d",
          },
        );
      }

      if (HTTPRequestMethod == HTTPRequestEnum.POST) {
        response = await post(
          url,
          query,
          headers: {
            'Authorization': "Bearer ${Get.find<AuthService>().token}",
            //'Authorization': "Bearer 22|HB9PiYZipW9orD4AtyqHe2v7bTq44OISsvsdzJEsaa65751d",
          },
        );
      }

      if (HTTPRequestMethod == HTTPRequestEnum.Delete) {
        response = await delete(
          url,
          headers: {
            'Authorization': "Bearer ${Get.find<AuthService>().token}",
            //'Authorization': "Bearer 22|HB9PiYZipW9orD4AtyqHe2v7bTq44OISsvsdzJEsaa65751d",
          },
        );
      }

      if (HTTPRequestMethod == HTTPRequestEnum.PUT) {
        response = await put(
          url,
          query,
          headers: {
            'Authorization': "Bearer ${Get.find<AuthService>().token}",
            //'Authorization': "Bearer 22|HB9PiYZipW9orD4AtyqHe2v7bTq44OISsvsdzJEsaa65751d",
          },
        );
      }

      if (response!.hasError) {
        log(
          "\x1B[31m [${HTTPRequestMethod.name}] [${response.statusCode.toString()}] ${url}\x1B[31m",
          name: "http-error",
        );
        if (response.statusCode == 400 ||
            response.statusCode == 422 ||
            response.statusCode == 406 ||
            response.statusCode == 500) {
          throw BadRequestException(response.body["message"]);
        }

        throw NetworkError(
          response.statusCode.toString() + response.bodyString.toString(),
        );
      }
    } catch (e) {
      log(
        "\x1B[31m [${HTTPRequestMethod.name}] [${response!.statusCode.toString()}] ${url}\x1B[31m",
        name: "http-error",
      );
      //printError(response!.body.toString());
      log(
        "\x1B[31m ${response.body.toString()}\x1B[31m",
        name: "http-error",
      );
      rethrow;
    }

    if (HTTPRequestMethod == HTTPRequestEnum.GET) {
      if (response.body["data"] != null) {
        if (response.body["data"] is List) {
          if (response.body["data"].length == 0) {
            throw EmptyDataException("The response data is empty.");
          }
        }
      }
    }

    ResponseModel responseModel = ResponseModel(
      url: response.request!.url.toString(),
      status: true,
      statusCode: 200,
      message: "Success",
      data: response.body,
      query: query.toString(),
      httpRequest: HTTPRequestMethod,
    );

    log("\x1B[32m [${HTTPRequestMethod.name}] [${responseModel.statusCode}] ${url}\x1B[0m", name: "http-response");

    return responseModel;
  }
}
