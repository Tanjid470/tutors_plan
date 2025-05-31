class CoursesResponseBody {
  bool? ok;
  int? status;
  String? message;
  Results? results;
  Meta? meta;

  CoursesResponseBody(
      {this.ok, this.status, this.message, this.results, this.meta});

  CoursesResponseBody.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    status = json['status'];
    message = json['message'];
    results =
    json['results'] != null ? new Results.fromJson(json['results']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = ok;
    data['status'] = status;
    data['message'] = message;
    if (results != null) {
      data['results'] = results!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Results {
  List<CourseModel>? data;
  int? total;

  Results({this.data, this.total});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CourseModel>[];
      json['data'].forEach((v) {
        data!.add(new CourseModel.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class CourseModel {
  String? id;
  String? name;
  String? shortDescription;
  int? discountedPrice;
  int? discountedPercentage;
  int? discountedAmount;
  bool? isFreeCourse;
  bool? isCourseApproved;
  String? thumbnailImage;

  CourseModel(
      {this.id,
        this.name,
        this.shortDescription,
        this.discountedPrice,
        this.discountedPercentage,
        this.discountedAmount,
        this.isFreeCourse,
        this.isCourseApproved,
        this.thumbnailImage});

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortDescription = json['short_description'];
    discountedPrice = json['discounted_price'];
    discountedPercentage = json['discounted_percentage'];
    discountedAmount = json['discounted_amount'];
    isFreeCourse = json['is_free_course'];
    isCourseApproved = json['is_course_approved'];
    thumbnailImage = json['thumbnail_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['short_description'] = shortDescription;
    data['discounted_price'] = discountedPrice;
    data['discounted_percentage'] = discountedPercentage;
    data['discounted_amount'] = discountedAmount;
    data['is_free_course'] = isFreeCourse;
    data['is_course_approved'] = isCourseApproved;
    data['thumbnail_image'] = thumbnailImage;
    return data;
  }
}

class Meta {
  String? timestamp;
  int? responseTime;

  Meta({this.timestamp, this.responseTime});

  Meta.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    responseTime = json['response_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['response_time'] = responseTime;
    return data;
  }
}
