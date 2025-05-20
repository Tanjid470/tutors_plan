class AppRolesGetBody {
  String? status;
  List<AppRoles>? data;
  String? message;
  int? pagination;

  AppRolesGetBody({this.status, this.data, this.message, this.pagination});

  AppRolesGetBody.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <AppRoles>[];
      json['data'].forEach((v) {
        data!.add(AppRoles.fromJson(v));
      });
    }
    message = json['message'];
    pagination = json['pagination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['pagination'] = pagination;
    return data;
  }
}

class AppRoles {
  int? id;
  String? name;
  String? description;

  AppRoles({this.id, this.name, this.description});

  AppRoles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
