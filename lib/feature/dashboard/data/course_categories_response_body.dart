class CourseCategoriesResponseBody {
  String? status;
  List<Data>? data;
  String? message;
  Pagination? pagination;

  CourseCategoriesResponseBody(
      {this.status, this.data, this.message, this.pagination});

  CourseCategoriesResponseBody.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? publicUrl;
  String? seoKeywords;
  String? icon;
  bool? publishedOnPublicSite;
  int? displaySequence;
  int? bootCampCourse;
  String? categoryManagerId;
  int? regularCourse;
  int? totalCourse;
  int? enrolledStudents;
  int? assignedTutors;
  String? image;
  String? managerEmployeeId;

  Data(
      {this.id,
        this.name,
        this.description,
        this.publicUrl,
        this.seoKeywords,
        this.icon,
        this.publishedOnPublicSite,
        this.displaySequence,
        this.bootCampCourse,
        this.categoryManagerId,
        this.regularCourse,
        this.totalCourse,
        this.enrolledStudents,
        this.assignedTutors,
        this.image,
        this.managerEmployeeId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    publicUrl = json['public_url'];
    seoKeywords = json['seo_keywords'];
    icon = json['icon'];
    publishedOnPublicSite = json['published_on_public_site'];
    displaySequence = json['display_sequence'];
    bootCampCourse = json['boot_camp_course'];
    categoryManagerId = json['category_manager_id'];
    regularCourse = json['regular_course'];
    totalCourse = json['total_course'];
    enrolledStudents = json['enrolled_students'];
    assignedTutors = json['assigned_tutors'];
    image = json['image'];
    managerEmployeeId = json['manager_employee_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['public_url'] = publicUrl;
    data['seo_keywords'] = seoKeywords;
    data['icon'] = icon;
    data['published_on_public_site'] = publishedOnPublicSite;
    data['display_sequence'] = displaySequence;
    data['boot_camp_course'] = bootCampCourse;
    data['category_manager_id'] = categoryManagerId;
    data['regular_course'] = regularCourse;
    data['total_course'] = totalCourse;
    data['enrolled_students'] = enrolledStudents;
    data['assigned_tutors'] = assignedTutors;
    data['image'] = image;
    data['manager_employee_id'] = managerEmployeeId;
    return data;
  }
}

class Pagination {
  int? total;
  int? limit;
  int? skip;

  Pagination({this.total, this.limit, this.skip});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    limit = json['limit'];
    skip = json['skip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = total;
    data['limit'] = limit;
    data['skip'] = skip;
    return data;
  }
}
