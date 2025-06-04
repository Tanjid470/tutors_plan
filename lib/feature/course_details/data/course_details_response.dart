class CourseDetailResponseBody {
  bool? ok;
  int? status;
  String? message;
  CourseDetails? results;
  Meta? meta;

  CourseDetailResponseBody(
      {this.ok, this.status, this.message, this.results, this.meta});

  CourseDetailResponseBody.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    status = json['status'];
    message = json['message'];
    results =
    json['results'] != null ? new CourseDetails.fromJson(json['results']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
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

class CourseDetails {
  String? id;
  String? name;
  String? shortDescription;
  String? description;
  String? coursePreRequisition;
  String? courseOutcome;
  String? publicUrl;
  String? seoTitle;
  List<String>? seoKeywords;
  String? organizationName;
  int? regularPrice;
  int? discountedPrice;
  int? discountedPercentage;
  int? discountedAmount;
  int? scholarshipApplicablePerson;
  bool? hasScholarship;
  bool? isTrendingCourse;
  String? courseDuration;
  int? credits;
  bool? isBootcampCourse;
  bool? isBundleCourse;
  bool? isFreeCourse;
  bool? dripContentBasedCourse;
  String? internalNotes;
  String? guidelineForInstructor;
  String? thumbnailImage;
  String? trailerVideo;
  String? masterK12Grade;
  CourseCategory? courseCategory;
  String? managerEmployeeId;
  String? instituteId;
  String? masterCourseStatusId;
  String? masterCourseLevelId;
  String? masterCourseTypeId;
  String? primaryTutorId;

  CourseDetails(
      {this.id,
        this.name,
        this.shortDescription,
        this.description,
        this.coursePreRequisition,
        this.courseOutcome,
        this.publicUrl,
        this.seoTitle,
        this.seoKeywords,
        this.organizationName,
        this.regularPrice,
        this.discountedPrice,
        this.discountedPercentage,
        this.discountedAmount,
        this.scholarshipApplicablePerson,
        this.hasScholarship,
        this.isTrendingCourse,
        this.courseDuration,
        this.credits,
        this.isBootcampCourse,
        this.isBundleCourse,
        this.isFreeCourse,
        this.dripContentBasedCourse,
        this.internalNotes,
        this.guidelineForInstructor,
        this.thumbnailImage,
        this.trailerVideo,
        this.masterK12Grade,
        this.courseCategory,
        this.managerEmployeeId,
        this.instituteId,
        this.masterCourseStatusId,
        this.masterCourseLevelId,
        this.masterCourseTypeId,
        this.primaryTutorId});

  CourseDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortDescription = json['short_description'];
    description = json['description'];
    coursePreRequisition = json['course_pre_requisition'];
    courseOutcome = json['course_outcome'];
    publicUrl = json['public_url'];
    seoTitle = json['seo_title'];
    seoKeywords = json['seo_keywords'].cast<String>();
    organizationName = json['organization_name'];
    regularPrice = json['regular_price'];
    discountedPrice = json['discounted_price'];
    discountedPercentage = json['discounted_percentage'];
    discountedAmount = json['discounted_amount'];
    scholarshipApplicablePerson = json['scholarship_applicable_person'];
    hasScholarship = json['has_scholarship'];
    isTrendingCourse = json['is_trending_course'];
    courseDuration = json['course_duration'];
    credits = json['credits'];
    isBootcampCourse = json['is_bootcamp_course'];
    isBundleCourse = json['is_bundle_course'];
    isFreeCourse = json['is_free_course'];
    dripContentBasedCourse = json['drip_content_based_course'];
    internalNotes = json['internal_notes'];
    guidelineForInstructor = json['guideline_for_instructor'];
    thumbnailImage = json['thumbnail_image'];
    trailerVideo = json['trailer_video'];
    masterK12Grade = json['master_k12_grade'];
    courseCategory = json['course_category'] != null
        ? new CourseCategory.fromJson(json['course_category'])
        : null;
    managerEmployeeId = json['manager_employee_id'];
    instituteId = json['institute_id'];
    masterCourseStatusId = json['master_course_status_id'];
    masterCourseLevelId = json['master_course_level_id'];
    masterCourseTypeId = json['master_course_type_id'];
    primaryTutorId = json['primary_tutor_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['course_pre_requisition'] = coursePreRequisition;
    data['course_outcome'] = courseOutcome;
    data['public_url'] = publicUrl;
    data['seo_title'] = seoTitle;
    data['seo_keywords'] = seoKeywords;
    data['organization_name'] = organizationName;
    data['regular_price'] = regularPrice;
    data['discounted_price'] = discountedPrice;
    data['discounted_percentage'] = discountedPercentage;
    data['discounted_amount'] = discountedAmount;
    data['scholarship_applicable_person'] = scholarshipApplicablePerson;
    data['has_scholarship'] = hasScholarship;
    data['is_trending_course'] = isTrendingCourse;
    data['course_duration'] = courseDuration;
    data['credits'] = credits;
    data['is_bootcamp_course'] = isBootcampCourse;
    data['is_bundle_course'] = isBundleCourse;
    data['is_free_course'] = isFreeCourse;
    data['drip_content_based_course'] = dripContentBasedCourse;
    data['internal_notes'] = internalNotes;
    data['guideline_for_instructor'] = guidelineForInstructor;
    data['thumbnail_image'] = thumbnailImage;
    data['trailer_video'] = trailerVideo;
    data['master_k12_grade'] = masterK12Grade;
    if (courseCategory != null) {
      data['course_category'] = courseCategory!.toJson();
    }
    data['manager_employee_id'] = managerEmployeeId;
    data['institute_id'] = instituteId;
    data['master_course_status_id'] = masterCourseStatusId;
    data['master_course_level_id'] = masterCourseLevelId;
    data['master_course_type_id'] = masterCourseTypeId;
    data['primary_tutor_id'] = primaryTutorId;
    return data;
  }
}

class CourseCategory {
  String? id;
  String? name;
  String? description;

  CourseCategory({this.id, this.name, this.description});

  CourseCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
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
