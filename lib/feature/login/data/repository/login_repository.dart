
import 'package:dio/dio.dart';
import 'package:tutors_plan/const/url_const.dart';
import 'package:tutors_plan/feature/login/data/login_response_body.dart';
import 'package:tutors_plan/feature/login/domain/login_body.dart';
import 'package:tutors_plan/utils/network/api_client.dart';
import 'package:tutors_plan/utils/network/api_result.dart';

class LoginRepository {
  Dio _dio = Dio();

  Future<ApiResult<LoginResponseBody>> fetchLoginResponse(LoginBody loginBody) async {
    try {
      _dio = await ApiClient.dioClient(false);
      Response response = await _dio.post(
        UrlConst.loginEndpoint,
        data: loginBody.toJson(),
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode == 200 && response.data != null && response.data is Map<String, dynamic>) {
        var loginResponse = LoginResponseBody.fromJson(response.data);
        var headers = response.headers.map.map((key, value) => MapEntry(key, value.join(',')));
        return ApiSuccess(loginResponse, headers: headers);
      } else {
        return ApiError(
          statusCode: response.statusCode,
          message: response.data.toString(),
        );
      }
    } catch (e) {
      return const ApiError(message: "Network or unexpected error");
    }
  }

}
