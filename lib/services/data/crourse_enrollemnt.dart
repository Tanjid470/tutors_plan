import 'dart:convert';

class CourseSuccessRes {
    final String? status;
    final Data? data;
    final String? message;
    final dynamic pagination;

    CourseSuccessRes({
        this.status,
        this.data,
        this.message,
        this.pagination,
    });

    factory CourseSuccessRes.fromRawJson(String str) => CourseSuccessRes.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CourseSuccessRes.fromJson(Map<String, dynamic> json) => CourseSuccessRes(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        pagination: json["pagination"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
        "pagination": pagination,
    };
}

class Data {
    final String? message;

    Data({
        this.message,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
