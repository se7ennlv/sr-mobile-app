import 'package:dio/dio.dart';
import 'package:flutter_sr/core/models/about_model.dart';
import 'package:flutter_sr/core/models/mybenefit/month_model.dart';
import 'package:flutter_sr/core/models/option_model.dart';
import 'package:flutter_sr/core/models/promotion_model.dart';
import 'package:flutter_sr/core/services/http_service.dart';

import 'api_url.dart';

class UtilsService {
  static Response response;
  static Dio dio = HttpService().dio;

  static Future<About> fetchAbout() async {
    try {
      const url = ApiUrl.GET_ABOUTSR;
      response = await dio.get(url);

      if (response.statusCode == 200) {
        AboutModel item = AboutModel.fromJson(response.data);
        return item.about;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<OptionItem> getOptions(String optName) async {
    try {
      final url = '${ApiUrl.GET_OPTIONS}/$optName';
      response = await dio.get(url);

      if (response.statusCode == 200) {
        OptionModel model = OptionModel.fromJson(response.data);
        return model.item;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<List<Month>> getAllMonths() async {
    try {
      const url = ApiUrl.GET_MONTHS;
      response = await dio.get(url);

      if (response.statusCode == 200) {
        MonthModel model = MonthModel.fromJson(response.data);
        return model.items;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  static Future getAllFiscalYears() async {
    try {
      const url = ApiUrl.GET_YEARS;
      response = await dio.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = response.data['data'];
        return jsonResponse;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<List<Promotion>> getAllPromotions() async {
    try {
      const url = ApiUrl.GET_PROMOTIONS;
      response = await dio.get(url);

      if (response.statusCode == 200) {
        PromotionModel items = PromotionModel.fromJson(response.data);

        return items.promotion;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<String> getDocPopup() async {
    try {
      const url = ApiUrl.GET_PROPOPUP;
      response = await dio.get(url);

      if (response.statusCode == 200) {
        final result = response.data['data'][0]['fileSrc'];
        return result;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  static Future getOptionSingleValue(String optName) async {
    try {
      final url = '${ApiUrl.GET_OPTIONS}/$optName';
      response = await dio.get(url);

      if (response.statusCode == 200) {
        final result = response.data['data']['optionValue'];
        return result;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
