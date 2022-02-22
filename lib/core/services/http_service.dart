import 'package:dio/dio.dart';
import 'package:flutter_sr/common/utils/global_variable.dart';
import 'package:flutter_sr/config/app_http.dart';

class HttpService {
  var dio = Dio();

  HttpService() {
    dio.options.baseUrl = AppHttp.apiUrl;
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
    dio.options.responseType = ResponseType.json;
    dio.options.contentType = Headers.jsonContentType;
  }

  Options get headerAuth {
    var token = GlobalVariable.accessToken;

    return Options(
      headers: {"Authorization": "Bearer $token"},
    );
  }
}
