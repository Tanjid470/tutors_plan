
import 'dart:convert';
import 'dart:io';
String registrationDataBodyToJson(RegistrationPostModel data) => json.encode(data.toJson());

class RegistrationPostModel {
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? phone;
  File? profilePicture;
  List<String>? roles;

  RegistrationPostModel(
      {
        this.email,
        this.password,
        this.firstName,
        this.lastName,
        this.phone,
        this.profilePicture,
        this.roles
      });

  RegistrationPostModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    profilePicture = json['profilePicture'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['profilePicture'] = profilePicture;
    data['roles'] = roles;
    return data;
  }
}

