class LoginResponseBody {
  String? status;
  Data? data;
  String? message;
  String? pagination;

  LoginResponseBody({this.status, this.data, this.message, this.pagination});

  LoginResponseBody.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    pagination = json['pagination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['pagination'] = pagination;
    return data;
  }
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  bool? isSuperAdmin;
  List<String>? roles;

  Data(
      {this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.isSuperAdmin,
        this.roles});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    isSuperAdmin = json['is_super_admin'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['is_super_admin'] = isSuperAdmin;
    data['roles'] = roles;
    return data;
  }
}
