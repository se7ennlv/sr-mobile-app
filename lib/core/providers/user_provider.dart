import 'dart:async';
import 'package:flutter_sr/common/utils/global_variable.dart';
import 'package:flutter_sr/config/locator.dart';
import 'package:flutter_sr/core/services/user_service.dart';
import 'base_provider.dart';

class UserProvider extends BaseProvider {
  final UserService _userService = locator<UserService>();

  Future<bool> updateContact(Object objData) async {
    setBusy(true);
    final result = await _userService.updateContact(objData);
    setBusy(false);

    if (result) {
      final token = GlobalVariable.accessToken;
      await _userService.getProfile(token);

      return true;
    }
    return false;
  }

  Future<bool> checkpoint(Object objData) async {
    setBusy(true);
    final result = await _userService.checkpoint(objData);
    setBusy(false);

    if (result) {
      return true;
    }

    return false;
  }

  Future<bool> updatePassword(Object objData) async {
    setBusy(true);
    final result = await _userService.updatePassword(objData);
    setBusy(false);

    if (result) {
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    print('logout provider');
    await _userService.logout();
  }
}
