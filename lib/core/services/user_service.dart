import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_sr/common/storage/shared_preferences.dart';
import 'package:flutter_sr/core/models/user_model.dart';
import 'api_url.dart';
import 'http_service.dart';

class UserService {
  static SharedPref sharedPref = SharedPref();

  Response response;
  static Dio dio = HttpService().dio;
  static var headerAuth = HttpService().headerAuth;

  final _userController = StreamController<UserModel>();
  Stream<UserModel> get userStream => _userController.stream;

  Future<UserModel> getProfile(String token) async {
    var options = Options(headers: {"Authorization": "Bearer $token"});

    try {
      const url = ApiUrl.GET_PROFILE;
      response = await dio.get(url, options: options);

      if (response.statusCode == 200) {
        final UserModel user = UserModel.fromJson(response.data);

        _userController.add(user);

        return user;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<bool> updateContact(Object objData) async {
    try {
      const url = ApiUrl.PUT_CONTACT;
      response = await dio.put(url, data: objData, options: headerAuth);

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

  Future<bool> updatePassword(Object objData) async {
    try {
      const url = ApiUrl.PUT_PASSWORD;
      response = await dio.put(url, data: objData, options: headerAuth);

      if (response.statusCode == 200) {
        final result = response.data;
        if (result['status'] == 'success') {
          return true;
        }
      }
      return false;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<bool> checkpoint(Object objData) async {
    try {
      const url = ApiUrl.CHECKPOINT;
      response = await dio.post(url, data: objData, options: headerAuth);

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioError {
      return false;
    }
  }

  Future<void> logout() async {
    print('logout service');

    sharedPref.remove('user');
    sharedPref.remove('token');
    sharedPref.clear();

    _userController.add(null);

    return Future.delayed(Duration.zero);
  }
}
