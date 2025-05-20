class CourseGetResponseBody {
  String? status;
  List<CourseModel>? data;
  String? message;
  bool? pagination;

  CourseGetResponseBody(
      {this.status, this.data, this.message, this.pagination});

  CourseGetResponseBody.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CourseModel>[];
      json['data'].forEach((v) {
        data!.add(new CourseModel.fromJson(v));
      });
    }
    message = json['message'];
    pagination = json['pagination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['pagination'] = this.pagination;
    return data;
  }
}

class CourseModel {
  int? id;
  String? name;
  String? shortDescription;
  String? description;
  String? publicUrl;
  int? regularPrice;
  int? discountedPrice;
  int? discountedPercentage;
  int? discountedAmount;
  bool? hasScholarship;
  bool? isTrendingCourse;
  dynamic courseDuration;
  int? numberOfModules;
  int? numberOfBookLessons;
  int? numberOfVideoLessons;
  int? numberOfLiveTutorsLessons;
  int? numberOfLabs;
  int? numberOfQuizzes;

  CourseModel(
      {this.id,
        this.name,
        this.shortDescription,
        this.description,
        this.publicUrl,
        this.regularPrice,
        this.discountedPrice,
        this.discountedPercentage,
        this.discountedAmount,
        this.hasScholarship,
        this.isTrendingCourse,
        this.courseDuration,
        this.numberOfModules,
        this.numberOfBookLessons,
        this.numberOfVideoLessons,
        this.numberOfLiveTutorsLessons,
        this.numberOfLabs,
        this.numberOfQuizzes});

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortDescription = json['short_description'];
    description = json['description'];
    publicUrl = json['public_url'];
    regularPrice = json['regular_price'];
    discountedPrice = json['discounted_price'];
    discountedPercentage = json['discounted_percentage'];
    discountedAmount = json['discounted_amount'];
    hasScholarship = json['has_scholarship'];
    isTrendingCourse = json['is_trending_course'];
    courseDuration = json['course_duration'];
    numberOfModules = json['number_of_modules'];
    numberOfBookLessons = json['number_of_book_lessons'];
    numberOfVideoLessons = json['number_of_video_lessons'];
    numberOfLiveTutorsLessons = json['number_of_live_tutors_lessons'];
    numberOfLabs = json['number_of_labs'];
    numberOfQuizzes = json['number_of_quizzes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['public_url'] = this.publicUrl;
    data['regular_price'] = this.regularPrice;
    data['discounted_price'] = this.discountedPrice;
    data['discounted_percentage'] = this.discountedPercentage;
    data['discounted_amount'] = this.discountedAmount;
    data['has_scholarship'] = this.hasScholarship;
    data['is_trending_course'] = this.isTrendingCourse;
    data['course_duration'] = this.courseDuration;
    data['number_of_modules'] = this.numberOfModules;
    data['number_of_book_lessons'] = this.numberOfBookLessons;
    data['number_of_video_lessons'] = this.numberOfVideoLessons;
    data['number_of_live_tutors_lessons'] = this.numberOfLiveTutorsLessons;
    data['number_of_labs'] = this.numberOfLabs;
    data['number_of_quizzes'] = this.numberOfQuizzes;
    return data;
  }
}
