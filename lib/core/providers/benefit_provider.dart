import 'package:flutter_sr/config/locator.dart';
import 'package:flutter_sr/core/services/benefit_service.dart';
import 'dart:async';

import 'base_provider.dart';

class BenefitProvider extends BaseProvider {
  final BenefitService _benefitService = locator<BenefitService>();

  Future<bool> sendPayslipToEmail(Object objData) async {
    setBusy(true);

    var result = await _benefitService.sendPayslipToEmail(objData);

    setBusy(false);

    if (result) {
      return true;
    }

    return false;
  }

  Future<bool> submitMySurvey(Object objData) async {
    setBusy(true);

    var result = await _benefitService.submitMySurvey(objData);

    setBusy(false);

    if (result) {
      return true;
    }

    return false;
  }
}
