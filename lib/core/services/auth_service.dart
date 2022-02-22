import 'dart:async';
import 'package:flutter_sr/common/storage/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'api_url.dart';
import 'http_service.dart';

class AuthService {
  //SharedPref sharedPref = SharedPref();

  Response response;
  static Dio dio = HttpService().dio;

  Future<bool> verifyUsername(Object ojbData) async {
    try {
      const url = ApiUrl.VERIFY_USERNAME;
      response = await dio.post(url, data: ojbData);

      if (response.statusCode == 200) {
        final result = response.data;

        if (result['status'] == 'success') {
          return true;
        }
      }

      return false;
    } on DioError {
      return false;
    }
  }

  Future<String> authentication(Object postData) async {
    try {
      const url = ApiUrl.LOGIN;
      response = await dio.post(url, data: postData);

      if (response.statusCode == 200) {
        final result = response.data;

        Map<String, dynamic> data = result;

        final token = data["access_token"];
        return token;
      } else {
        return null;
      }
    } on DioError {
      return null;
    }
  }

  Future<dynamic> getOtp() async {
    try {
      const url = ApiUrl.OTP_GEN;
      response = await HttpService().dio.get(url);

      if (response.statusCode == 200) {
        final result = response.data;

        if (result['status'] == 'success') {
          final otpCode = result['data'];
          return otpCode;
        }
      }
      return false;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  // Future<void> logout() async {
  //   sharedPref.remove('user');
  //   sharedPref.remove('token');
  //   sharedPref.clear();
  //
  //   return Future.delayed(Duration.zero);
  // }
}
