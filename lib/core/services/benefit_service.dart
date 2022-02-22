import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_sr/core/models/mybenefit/clinic_model.dart';
import 'package:flutter_sr/core/models/mybenefit/leave_model.dart';
import 'package:flutter_sr/core/models/mybenefit/mymart_model.dart';
import 'package:flutter_sr/core/models/mybenefit/mysurvey_model.dart';
import 'package:flutter_sr/core/models/mybenefit/roster_model.dart';
import 'package:flutter_sr/core/models/mybenefit/srp_model.dart';
import 'package:flutter_sr/core/models/hrinfo/article_model.dart';
import 'package:flutter_sr/core/models/hrinfo/doc_main_model.dart';
import 'package:flutter_sr/core/models/hrinfo/doc_sub_model.dart';
import 'package:flutter_sr/core/services/http_service.dart';

import 'api_url.dart';

class BenefitService {
  static Response response;
  static Dio dio = HttpService().dio;
  static var headerAuth = HttpService().headerAuth;

  static Future<List<Article>> fetchArticles() async {
    const url = ApiUrl.GET_FEEDS;
    response = await HttpService().dio.get(url);

    if (response.statusCode == 200) {
      ArticleModel model = ArticleModel.fromJson(response.data);
      return model.items;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<MainDoc>> fetchAllMainDocs() async {
    try {
      const url = ApiUrl.GET_MAINDOCS;
      response = await dio.get(url, options: headerAuth);

      if (response.statusCode == 200) {
        MainDocModel model = MainDocModel.fromJson(response.data);
        return model.items;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<List<SubDoc>> fetchAllSubDocs(String groupId) async {
    try {
      final url = '${ApiUrl.GET_SUBDOCS}/$groupId';
      response = await dio.get(url, options: headerAuth);

      if (response.statusCode == 200) {
        SubDocModel model = SubDocModel.fromJson(response.data);

        return model.items;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<SrpModel> fetchAllSrp() async {
    try {
      const url = ApiUrl.GET_SRP;
      response = await dio.get(url, options: headerAuth);

      if (response.statusCode == 200) {
        SrpModel model = SrpModel.fromJson(response.data);
        return model;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<MyMartModel> fetchAllMyMart() async {
    try {
      const url = ApiUrl.GET_MYMART;
      response = await dio.get(url, options: headerAuth);

      if (response.statusCode == 200) {
        MyMartModel model = MyMartModel.fromJson(response.data);
        return model;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<List<Leave>> fetchAllLeave() async {
    try {
      const url = ApiUrl.GET_LEAVE;
      response = await dio.get(url, options: headerAuth);

      if (response.statusCode == 200) {
        LeaveModel model = LeaveModel.fromJson(response.data);
        return model.items;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<List<Roster>> fetchAllRoster() async {
    try {
      const url = ApiUrl.GET_ROSTER;
      response = await dio.get(url, options: headerAuth);

      if (response.statusCode == 200) {
        RosterModel model = RosterModel.fromJson(response.data);
        return model.items;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<List<Clinic>> getAllClinics(int year) async {
    try {
      final url = '${ApiUrl.GET_CLINIC}/$year';
      response = await dio.get(url, options: headerAuth);

      if (response.statusCode == 200) {
        ClinicModel model = ClinicModel.fromJson(response.data);
        return model.items;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  static Future getPayslip(Object objData) async {
    try {
      const url = ApiUrl.GET_PAYSLIP;
      response = await dio.post(url, data: objData, options: headerAuth);

      if (response.statusCode == 200) {
        final jsonResponse = response.data;

        if (jsonResponse['status'] == 'success') {
          final String payslipSrc = jsonResponse['data'];

          return payslipSrc;
        }
      } else {
        return false;
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<bool> sendPayslipToEmail(Object objData) async {
    try {
      const url = ApiUrl.SENDMAIL;
      final postData = jsonEncode(objData);
      response = await dio.post(url, data: postData, options: headerAuth);

      if (response.statusCode == 200) {
        final jsonResponse = response.data;

        if (jsonResponse['status'] == 'success') {
          return true;
        }
      }

      return false;
    } on DioError {
      return false;
    }
  }

  static Future<List<MySurvey>> fetchAllMySurvey(int year) async {
    try {
      final url = '${ApiUrl.GET_MYSURVEY}/$year';
      response = await dio.get(url, options: headerAuth);

      if (response.statusCode == 200) {
        MySurveyModel model = MySurveyModel.fromJson(response.data);
        return model.items;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<bool> submitMySurvey(Object objData) async {
    try {
      const url = ApiUrl.PUT_SURVEY;
      response = await dio.put(url, data: objData, options: headerAuth);

      if (response.statusCode == 200) {
        final jsonResponse = response.data;

        if (jsonResponse['status'] == 'success') {
          return true;
        }
      }

      return false;
    } on DioError catch (e) {
      return false;
    }
  }
}
