class CourseGetResponseBody {
  String? status;
  List<Data>? data;
  String? message;
  int? pagination;

  CourseGetResponseBody(
      {this.status, this.data, this.message, this.pagination});

  CourseGetResponseBody.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  int? id;
  String? name;
  String? shortDescription;
  String? description;
  List<String>? courseFaq;
  int? coursePreRequisition;
  int? courseOutcome;
  int? publicUrl;
  int? seoTitle;
  int? seoKeywords;
  int? regularPrice;
  int? discountedPrice;
  int? discountedPercentage;
  int? discountedAmount;
  bool? hasScholarship;
  bool? isTrendingCourse;
  int? courseDuration;
  int? numberOfModules;
  int? numberOfBookLessons;
  int? numberOfVideoLessons;
  int? numberOfLiveTutorsLessons;
  int? numberOfLabs;
  int? numberOfQuizzes;
  String? credits;
  bool? regularCourseOrBootcampCourse;
  bool? singleOrBundleCourse;
  bool? freeOrPaidCourse;
  bool? publishedOnPublicSite;
  bool? privateOrPublicCourse;
  bool? dripContentBasedCourse;
  int? internalNotes;
  int? iconMediaLibraryId;
  bool? courseApproved;
  bool? isTemplate;
  bool? guidelineForInstructor;
  int? displaySequence;
  int? courseSalesRevenue;
  int? enrolledStudents;
  String? tutoringSession;
  String? image;
  int? ratingScore;
  String? masterK12Grade;
  String? courseTrailer;
  String? deletedAt;
  CourseCategory? courseCategory;
  int? managerEmployee;
  Null? institute;
  List<String>? courseTags;
  List<String>? courseMultipleTutors;
  List<String>? courseMedias;
  List<CourseModules>? courseModules;
  List<String>? courseTutoringSessionCounts;
  List<CourseLessons>? courseLessons;
  List<String>? courseLessonQuizs;
  List<String>? courseAssignments;
  List<String>? courseExams;
  List<String>? courseSchedules;
  int? courseCategoryId;
  int? managerEmployeeId;
  int? instituteId;
  int? masterCourseStatusId;
  int? masterCourseLevelId;
  int? masterCourseTypeId;
  int? primaryTutorId;
  int? masterVideoLibraryId;

  Data(
      {this.id,
        this.name,
        this.shortDescription,
        this.description,
        this.courseFaq,
        this.coursePreRequisition,
        this.courseOutcome,
        this.publicUrl,
        this.seoTitle,
        this.seoKeywords,
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
        this.numberOfQuizzes,
        this.credits,
        this.regularCourseOrBootcampCourse,
        this.singleOrBundleCourse,
        this.freeOrPaidCourse,
        this.publishedOnPublicSite,
        this.privateOrPublicCourse,
        this.dripContentBasedCourse,
        this.internalNotes,
        this.iconMediaLibraryId,
        this.courseApproved,
        this.isTemplate,
        this.guidelineForInstructor,
        this.displaySequence,
        this.courseSalesRevenue,
        this.enrolledStudents,
        this.tutoringSession,
        this.image,
        this.ratingScore,
        this.masterK12Grade,
        this.courseTrailer,
        this.deletedAt,
        this.courseCategory,
        this.managerEmployee,
        this.institute,
        this.courseTags,
        this.courseMultipleTutors,
        this.courseMedias,
        this.courseModules,
        this.courseTutoringSessionCounts,
        this.courseLessons,
        this.courseLessonQuizs,
        this.courseAssignments,
        this.courseExams,
        this.courseSchedules,
        this.courseCategoryId,
        this.managerEmployeeId,
        this.instituteId,
        this.masterCourseStatusId,
        this.masterCourseLevelId,
        this.masterCourseTypeId,
        this.primaryTutorId,
        this.masterVideoLibraryId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortDescription = json['short_description'];
    description = json['description'];
    courseFaq = json['course_faq'].cast<String>();
    coursePreRequisition = json['course_pre_requisition'];
    courseOutcome = json['course_outcome'];
    publicUrl = json['public_url'];
    seoTitle = json['seo_title'];
    seoKeywords = json['seo_keywords'];
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
    credits = json['credits'];
    regularCourseOrBootcampCourse = json['regular_course_or_bootcamp_course'];
    singleOrBundleCourse = json['single_or_bundle_course'];
    freeOrPaidCourse = json['free_or_paid_course'];
    publishedOnPublicSite = json['published_on_public_site'];
    privateOrPublicCourse = json['private_or_public_course'];
    dripContentBasedCourse = json['drip_content_based_course'];
    internalNotes = json['internal_notes'];
    iconMediaLibraryId = json['icon_media_library_id'];
    courseApproved = json['course_approved'];
    isTemplate = json['is_template'];
    guidelineForInstructor = json['guideline_for_instructor'];
    displaySequence = json['display_sequence'];
    courseSalesRevenue = json['course_sales_revenue'];
    enrolledStudents = json['enrolled_students'];
    tutoringSession = json['tutoring_session'];
    image = json['image'];
    ratingScore = json['rating_score'];
    masterK12Grade = json['master_k12_grade'];
    courseTrailer = json['course_trailer'];
    deletedAt = json['deletedAt'];
    courseCategory = json['course_category'] != null
        ? CourseCategory.fromJson(json['course_category'])
        : null;
    managerEmployee = json['manager_employee'];
    institute = json['institute'];
    courseTags = json['course_tags'].cast<String>();
    courseMultipleTutors = json['course_multiple_tutors'].cast<String>();
    courseMedias = json['course_medias'].cast<String>();
    if (json['course_modules'] != null) {
      courseModules = <CourseModules>[];
      json['course_modules'].forEach((v) {
        courseModules!.add(CourseModules.fromJson(v));
      });
    }
    courseTutoringSessionCounts =
        json['course_tutoring_session_counts'].cast<String>();
    if (json['course_lessons'] != null) {
      courseLessons = <CourseLessons>[];
      json['course_lessons'].forEach((v) {
        courseLessons!.add(CourseLessons.fromJson(v));
      });
    }
    courseLessonQuizs = json['course_lesson_quizs'].cast<String>();
    courseAssignments = json['course_assignments'].cast<String>();
    courseExams = json['course_exams'].cast<String>();
    courseSchedules = json['course_schedules'].cast<String>();
    courseCategoryId = json['course_category_id'];
    managerEmployeeId = json['manager_employee_id'];
    instituteId = json['institute_id'];
    masterCourseStatusId = json['master_course_status_id'];
    masterCourseLevelId = json['master_course_level_id'];
    masterCourseTypeId = json['master_course_type_id'];
    primaryTutorId = json['primary_tutor_id'];
    masterVideoLibraryId = json['master_video_library_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['course_faq'] = courseFaq;
    data['course_pre_requisition'] = coursePreRequisition;
    data['course_outcome'] = courseOutcome;
    data['public_url'] = publicUrl;
    data['seo_title'] = seoTitle;
    data['seo_keywords'] = seoKeywords;
    data['regular_price'] = regularPrice;
    data['discounted_price'] = discountedPrice;
    data['discounted_percentage'] = discountedPercentage;
    data['discounted_amount'] = discountedAmount;
    data['has_scholarship'] = hasScholarship;
    data['is_trending_course'] = isTrendingCourse;
    data['course_duration'] = courseDuration;
    data['number_of_modules'] = numberOfModules;
    data['number_of_book_lessons'] = numberOfBookLessons;
    data['number_of_video_lessons'] = numberOfVideoLessons;
    data['number_of_live_tutors_lessons'] = numberOfLiveTutorsLessons;
    data['number_of_labs'] = numberOfLabs;
    data['number_of_quizzes'] = numberOfQuizzes;
    data['credits'] = credits;
    data['regular_course_or_bootcamp_course'] =
        regularCourseOrBootcampCourse;
    data['single_or_bundle_course'] = singleOrBundleCourse;
    data['free_or_paid_course'] = freeOrPaidCourse;
    data['published_on_public_site'] = publishedOnPublicSite;
    data['private_or_public_course'] = privateOrPublicCourse;
    data['drip_content_based_course'] = dripContentBasedCourse;
    data['internal_notes'] = internalNotes;
    data['icon_media_library_id'] = iconMediaLibraryId;
    data['course_approved'] = courseApproved;
    data['is_template'] = isTemplate;
    data['guideline_for_instructor'] = guidelineForInstructor;
    data['display_sequence'] = displaySequence;
    data['course_sales_revenue'] = courseSalesRevenue;
    data['enrolled_students'] = enrolledStudents;
    data['tutoring_session'] = tutoringSession;
    data['image'] = image;
    data['rating_score'] = ratingScore;
    data['master_k12_grade'] = masterK12Grade;
    data['course_trailer'] = courseTrailer;
    data['deletedAt'] = deletedAt;
    if (courseCategory != null) {
      data['course_category'] = courseCategory!.toJson();
    }
    data['manager_employee'] = managerEmployee;
    data['institute'] = institute;
    data['course_tags'] = courseTags;
    data['course_multiple_tutors'] = courseMultipleTutors;
    data['course_medias'] = courseMedias;
    if (courseModules != null) {
      data['course_modules'] =
          courseModules!.map((v) => v.toJson()).toList();
    }
    data['course_tutoring_session_counts'] = courseTutoringSessionCounts;
    if (courseLessons != null) {
      data['course_lessons'] =
          courseLessons!.map((v) => v.toJson()).toList();
    }
    data['course_lesson_quizs'] = courseLessonQuizs;
    data['course_assignments'] = courseAssignments;
    data['course_exams'] = courseExams;
    data['course_schedules'] = courseSchedules;
    data['course_category_id'] = courseCategoryId;
    data['manager_employee_id'] = managerEmployeeId;
    data['institute_id'] = instituteId;
    data['master_course_status_id'] = masterCourseStatusId;
    data['master_course_level_id'] = masterCourseLevelId;
    data['master_course_type_id'] = masterCourseTypeId;
    data['primary_tutor_id'] = primaryTutorId;
    data['master_video_library_id'] = masterVideoLibraryId;
    return data;
  }
}

class CourseCategory {
  int? id;
  String? name;
  String? description;
  String? publicUrl;
  String? seoKeywords;
  String? icon;
  bool? publishedOnPublicSite;
  int? displaySequence;
  int? bootCampCourse;
  int? categoryManagerId;
  int? regularCourse;
  int? totalCourse;
  int? enrolledStudents;
  bool? assignedTutors;
  String? image;
  int? managerEmployeeId;

  CourseCategory(
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

  CourseCategory.fromJson(Map<String, dynamic> json) {
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

class CourseModules {
  int? id;
  String? title;
  String? shortDescription;
  String? description;
  String? duration;
  bool? moduleContentApproved;
  int? guidelineforInstructor;
  int? numberOfLessons;
  bool? saveAsTemplate;
  int? courseId;
  int? tutorId;
  int? instituteId;
  int? approvedByEmployeeId;

  CourseModules(
      {this.id,
        this.title,
        this.shortDescription,
        this.description,
        this.duration,
        this.moduleContentApproved,
        this.guidelineforInstructor,
        this.numberOfLessons,
        this.saveAsTemplate,
        this.courseId,
        this.tutorId,
        this.instituteId,
        this.approvedByEmployeeId});

  CourseModules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDescription = json['short_description'];
    description = json['description'];
    duration = json['duration'];
    moduleContentApproved = json['module_content_approved'];
    guidelineforInstructor = json['guidelinefor_instructor'];
    numberOfLessons = json['number_of_lessons'];
    saveAsTemplate = json['save_as_template'];
    courseId = json['course_id'];
    tutorId = json['tutor_id'];
    instituteId = json['institute_id'];
    approvedByEmployeeId = json['approved_by_employee_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['duration'] = duration;
    data['module_content_approved'] = moduleContentApproved;
    data['guidelinefor_instructor'] = guidelineforInstructor;
    data['number_of_lessons'] = numberOfLessons;
    data['save_as_template'] = saveAsTemplate;
    data['course_id'] = courseId;
    data['tutor_id'] = tutorId;
    data['institute_id'] = instituteId;
    data['approved_by_employee_id'] = approvedByEmployeeId;
    return data;
  }
}

class CourseLessons {
  int? id;
  String? title;
  String? summary;
  String? description;
  String? duration;
  bool? isActive;
  int? guidelineForInstructor;
  bool? lessonContentApproved;
  int? courseLessonTypeId;
  int? primaryTutorId;
  int? courseId;
  int? courseModuleId;
  int? masterPhotoLibraryId;
  int? masterVideoLibraryId;
  int? masterAudioLibraryId;
  int? masterDigitalLibraryId;
  int? masterBookLibraryId;
  int? approvedByEmployeeId;

  CourseLessons(
      {this.id,
        this.title,
        this.summary,
        this.description,
        this.duration,
        this.isActive,
        this.guidelineForInstructor,
        this.lessonContentApproved,
        this.courseLessonTypeId,
        this.primaryTutorId,
        this.courseId,
        this.courseModuleId,
        this.masterPhotoLibraryId,
        this.masterVideoLibraryId,
        this.masterAudioLibraryId,
        this.masterDigitalLibraryId,
        this.masterBookLibraryId,
        this.approvedByEmployeeId});

  CourseLessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    summary = json['summary'];
    description = json['description'];
    duration = json['duration'];
    isActive = json['is_active'];
    guidelineForInstructor = json['guideline_for_instructor'];
    lessonContentApproved = json['lesson_content_approved'];
    courseLessonTypeId = json['course_lesson_type_id'];
    primaryTutorId = json['primary_tutor_id'];
    courseId = json['course_id'];
    courseModuleId = json['course_module_id'];
    masterPhotoLibraryId = json['master_photo_library_id'];
    masterVideoLibraryId = json['master_video_library_id'];
    masterAudioLibraryId = json['master_audio_library_id'];
    masterDigitalLibraryId = json['master_digital_library_id'];
    masterBookLibraryId = json['master_book_library_id'];
    approvedByEmployeeId = json['approved_by_employee_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['summary'] = summary;
    data['description'] = description;
    data['duration'] = duration;
    data['is_active'] = isActive;
    data['guideline_for_instructor'] = guidelineForInstructor;
    data['lesson_content_approved'] = lessonContentApproved;
    data['course_lesson_type_id'] = courseLessonTypeId;
    data['primary_tutor_id'] = primaryTutorId;
    data['course_id'] = courseId;
    data['course_module_id'] = courseModuleId;
    data['master_photo_library_id'] = masterPhotoLibraryId;
    data['master_video_library_id'] = masterVideoLibraryId;
    data['master_audio_library_id'] = masterAudioLibraryId;
    data['master_digital_library_id'] = masterDigitalLibraryId;
    data['master_book_library_id'] = masterBookLibraryId;
    data['approved_by_employee_id'] = approvedByEmployeeId;
    return data;
  }
}
