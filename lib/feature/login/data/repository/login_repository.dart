
import 'package:dio/dio.dart';
import 'package:tutors_plan/const/url_const.dart';
import 'package:tutors_plan/feature/domain/login_body.dart';
import 'package:tutors_plan/utils/network/api_client.dart';

class LoginRepository {
  Dio _dio = Dio();
  //
  // Future<QuizSoloPlayStartSuccessBodyResponse?> fetchLoginResponse(LoginBody loginBody) async {
  //   try {
  //     _dio = await ApiClient.dioClient(false);
  //     var data = await _dio.post(UrlConst.login, data: loginBody.toJson());
  //     if (data.data != null) {
  //       return QuizSoloPlayStartSuccessBodyResponse.fromJson(data.data);
  //     } else {
  //       throw Exception(data.data);
  //     }
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

}
