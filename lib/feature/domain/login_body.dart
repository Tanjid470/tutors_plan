import 'dart:convert';
String loginBodyToJson(LoginBody data) => json.encode(data.toJson());

class LoginBody {
  LoginBody({
    this.email,
    this.password,
  });
  String? email;
  String? password;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}