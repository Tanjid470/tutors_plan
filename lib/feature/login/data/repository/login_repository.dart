
import 'package:dio/dio.dart';
import 'package:tutors_plan/const/url_const.dart';
import 'package:tutors_plan/feature/login/data/login_response_body.dart';
import 'package:tutors_plan/feature/login/domain/login_body.dart';
import 'package:tutors_plan/utils/network/api_client.dart';

class LoginRepository {
  Dio _dio = Dio();

  Future<(LoginResponseBody?, Map<String, dynamic>?)> fetchLoginResponse(LoginBody loginBody) async {
    try {
      _dio = await ApiClient.dioClient(false);
      var response = await _dio.post(UrlConst.loginEndpoint, data: loginBody.toJson());

      if (response.data != null) {
        var loginResponse = LoginResponseBody.fromJson(response.data);
        var headers = response.headers.map.map((key, value) => MapEntry(key, value.join(',')));
        return (loginResponse, headers);
      } else {
        throw Exception(response.data);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
