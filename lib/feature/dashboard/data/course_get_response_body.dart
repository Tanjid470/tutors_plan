class CoursesResponseBody {
  bool? ok;
  int? status;
  String? message;
  Results? results;
  Pagination? meta;

  CoursesResponseBody(
      {this.ok, this.status, this.message, this.results, this.meta});

  CoursesResponseBody.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    status = json['status'];
    message = json['message'];
    results =
    json['results'] != null ? new Results.fromJson(json['results']) : null;
    meta = json['meta'] != null ? new Pagination.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
  Pagination? meta;

  Results({this.data, this.meta});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CourseModel>[];
      json['data'].forEach((v) {
        data!.add(new CourseModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Pagination.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class CourseModel {
  String? id;
  String? createdAt;
  String? name;
  String? shortDescription;
  int? regularPrice;
  int? discountedPrice;
  int? discountedPercentage;
  int? discountedAmount;
  String? courseDuration;
  int? credits;
  bool? isFreeCourse;
  bool? isCourseApproved;
  String? thumbnailImage;
  CourseCategory? courseCategory;
  int? moduleCount;
  int? studentCount;

  CourseModel(
      {this.id,
        this.createdAt,
        this.name,
        this.shortDescription,
        this.regularPrice,
        this.discountedPrice,
        this.discountedPercentage,
        this.discountedAmount,
        this.courseDuration,
        this.credits,
        this.isFreeCourse,
        this.isCourseApproved,
        this.thumbnailImage,
        this.courseCategory,
        this.moduleCount,
        this.studentCount});

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    name = json['name'];
    shortDescription = json['short_description'];
    regularPrice = json['regular_price'];
    discountedPrice = json['discounted_price'];
    discountedPercentage = json['discounted_percentage'];
    discountedAmount = json['discounted_amount'];
    courseDuration = json['course_duration'];
    credits = json['credits'];
    isFreeCourse = json['is_free_course'];
    isCourseApproved = json['is_course_approved'];
    thumbnailImage = json['thumbnail_image'];
    courseCategory = json['course_category'] != null
        ? new CourseCategory.fromJson(json['course_category'])
        : null;
    moduleCount = json['moduleCount'];
    studentCount = json['studentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['name'] = name;
    data['short_description'] = shortDescription;
    data['regular_price'] = regularPrice;
    data['discounted_price'] = discountedPrice;
    data['discounted_percentage'] = discountedPercentage;
    data['discounted_amount'] = discountedAmount;
    data['course_duration'] = courseDuration;
    data['credits'] = credits;
    data['is_free_course'] = isFreeCourse;
    data['is_course_approved'] = isCourseApproved;
    data['thumbnail_image'] = thumbnailImage;
    if (courseCategory != null) {
      data['course_category'] = courseCategory!.toJson();
    }
    data['moduleCount'] = moduleCount;
    data['studentCount'] = studentCount;
    return data;
  }
}

class CourseCategory {
  String? name;

  CourseCategory({this.name});

  CourseCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Pagination {
  int? total;
  int? page;
  int? limit;
  int? totalPages;

  Pagination({this.total, this.page, this.limit, this.totalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['page'] = page;
    data['limit'] = limit;
    data['totalPages'] = totalPages;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = timestamp;
    data['response_time'] = responseTime;
    return data;
  }
}
