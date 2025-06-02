class MyCourseResponse {
  bool? ok;
  int? status;
  String? message;
  Results? results;
  Pagination? meta;

  MyCourseResponse(
      {this.ok, this.status, this.message, this.results, this.meta});

  MyCourseResponse.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    status = json['status'];
    message = json['message'];
    results =
    json['results'] != null ? Results.fromJson(json['results']) : null;
    meta = json['meta'] != null ? Pagination.fromJson(json['meta']) : null;
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
  List<MyCourse>? myCourses;
  Pagination? pagination;

  Results({this.myCourses, this.pagination});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      myCourses = <MyCourse>[];
      json['items'].forEach((v) {
        myCourses!.add(MyCourse.fromJson(v));
      });
    }
    pagination = json['meta'] != null ? Pagination.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (myCourses != null) {
      data['items'] = myCourses!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['meta'] = pagination!.toJson();
    }
    return data;
  }
}

class MyCourse {
  String? id;
  String? name;
  String? shortDescription;
  String? thumbnailImage;
  int? discountedPrice;
  int? discountedPercentage;
  int? discountedAmount;
  bool? isFreeCourse;
  bool? isCourseApproved;
  String? createdAt;
  String? categoryName;
  int? credits;
  String? courseDuration;
  int? regularPrice;
  bool? hasScholarship;

  MyCourse(
      {this.id,
        this.name,
        this.shortDescription,
        this.thumbnailImage,
        this.discountedPrice,
        this.discountedPercentage,
        this.discountedAmount,
        this.isFreeCourse,
        this.isCourseApproved,
        this.createdAt,
        this.categoryName,
        this.credits,
        this.courseDuration,
        this.regularPrice,
        this.hasScholarship});

  MyCourse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortDescription = json['short_description'];
    thumbnailImage = json['thumbnail_image'];
    discountedPrice = json['discounted_price'];
    discountedPercentage = json['discounted_percentage'];
    discountedAmount = json['discounted_amount'];
    isFreeCourse = json['is_free_course'];
    isCourseApproved = json['is_course_approved'];
    createdAt = json['created_at'];
    categoryName = json['category_name'];
    credits = json['credits'];
    courseDuration = json['course_duration'];
    regularPrice = json['regular_price'];
    hasScholarship = json['has_scholarship'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['short_description'] = shortDescription;
    data['thumbnail_image'] = thumbnailImage;
    data['discounted_price'] = discountedPrice;
    data['discounted_percentage'] = discountedPercentage;
    data['discounted_amount'] = discountedAmount;
    data['is_free_course'] = isFreeCourse;
    data['is_course_approved'] = isCourseApproved;
    data['created_at'] = createdAt;
    data['category_name'] = categoryName;
    data['credits'] = credits;
    data['course_duration'] = courseDuration;
    data['regular_price'] = regularPrice;
    data['has_scholarship'] = hasScholarship;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['response_time'] = responseTime;
    return data;
  }
}
