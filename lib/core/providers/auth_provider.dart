import 'dart:async';

import 'package:flutter_sr/common/storage/shared_preferences.dart';
import 'package:flutter_sr/common/utils/global_variable.dart';
import 'package:flutter_sr/core/services/auth_service.dart';
import 'package:flutter_sr/core/services/mail_service.dart';
import 'package:flutter_sr/core/services/user_service.dart';
import '../../config/locator.dart';
import 'base_provider.dart';

class AuthProvider extends BaseProvider {
  SharedPref sharedPref = SharedPref();

  final AuthService _authService = locator<AuthService>();
  final UserService _userService = locator<UserService>();
  final MailService _mailService = locator<MailService>();

  Future<bool> verifyUsername(Object formData) async {
    setBusy(true);
    var isValidUsername = await _authService.verifyUsername(formData);
    setBusy(false);

    if (isValidUsername) {
      return true;
    }
    return false;
  }

  Future<bool> authentication(Object formData) async {
    setBusy(true);
    var token = await _authService.authentication(formData);
    setBusy(false);

    if (token != null) {
      final hasUser = await getProfile(token);

      if (hasUser) {
        return true;
      }
    }
    return false;
  }

  Future<bool> getProfile(String token) async {
    var user = await _userService.getProfile(token);

    if (user != null) {
      await sharedPref.save('token', token);
      GlobalVariable.accessToken = token;
      return true;
    }
    return false;
  }

  Future<dynamic> getOtp() async {
    setBusy(true);
    var otpCode = await _authService.getOtp();
    setBusy(false);

    if (otpCode != null) {
      return otpCode;
    }
    return false;
  }

  Future<bool> sendMail(Object objData) async {
    setBusy(true);
    var result = await _mailService.sendMail(objData);
    setBusy(false);

    if (result) {
      return true;
    }
    return false;
  }

  // Future<void> logout() async {
  //   _authService.logout();
  // }
}
