import 'package:dio/dio.dart';
import 'api_url.dart';
import 'http_service.dart';

class MailService {
  Response response;
  static Dio dio = HttpService().dio;

  Future<bool> sendMail(Object objData) async {
    const url = ApiUrl.OTP_MAIL;
    final response = await dio.post(url, data: objData);

    if (response.statusCode == 200) {
      final jsonResponse = response.data;

      if (jsonResponse['status'] == 'success') {
        return true;
      }
    }

    return false;
  }
}
