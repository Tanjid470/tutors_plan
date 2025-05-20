class CourseDetailResponseBody {
  String? status;
  CourseDetails? data;
  String? message;

  CourseDetailResponseBody({this.status, this.data, this.message});

  CourseDetailResponseBody.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new CourseDetails.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class CourseDetails {
  int? id;
  String? name;
  String? shortDescription;
  String? description;
  List<CourseFaq>? courseFaq;
  String? coursePreRequisition;
  String? courseOutcome;
  String? seoTitle;
  String? seoKeywords;
  int? regularPrice;
  int? discountedPrice;
  int? discountedPercentage;
  int? discountedAmount;
  bool? hasScholarship;
  bool? isTrendingCourse;
  String? courseDuration;
  int? numberOfModules;
  int? numberOfBookLessons;
  int? numberOfVideoLessons;
  int? numberOfLiveTutorsLessons;
  int? numberOfLabs;
  int? numberOfQuizzes;
  int? credits;
  bool? regularCourseOrBootcampCourse;
  bool? singleOrBundleCourse;
  bool? freeOrPaidCourse;
  bool? publishedOnPublicSite;
  bool? privateOrPublicCourse;
  bool? dripContentBasedCourse;
  bool? courseApproved;
  String? guidelineForInstructor;
  String? image;
  int? masterK12Grade;
  CourseCategory? courseCategory;
  ManagerEmployee? managerEmployee;
  Institute? institute;
  List<CourseMultipleTutors>? courseMultipleTutors;
  List<CourseModules>? courseModules;
  List<CourseLessons>? courseLessons;
  List<CourseAssignments>? courseAssignments;
  int? courseCategoryId;
  int? managerEmployeeId;
  int? instituteId;
  int? masterCourseStatusId;
  int? masterCourseLevelId;
  int? masterCourseTypeId;
  int? primaryTutorId;
  int? masterPhotoLibraryId;
  int? masterVideoLibraryId;

  CourseDetails(
      {this.id,
        this.name,
        this.shortDescription,
        this.description,
        this.courseFaq,
        this.coursePreRequisition,
        this.courseOutcome,
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
        this.courseApproved,
        this.guidelineForInstructor,
        this.image,
        this.masterK12Grade,
        this.courseCategory,
        this.managerEmployee,
        this.institute,
        this.courseMultipleTutors,
        this.courseModules,
        this.courseLessons,
        this.courseAssignments,
        this.courseCategoryId,
        this.managerEmployeeId,
        this.instituteId,
        this.masterCourseStatusId,
        this.masterCourseLevelId,
        this.masterCourseTypeId,
        this.primaryTutorId,
        this.masterPhotoLibraryId,
        this.masterVideoLibraryId});

  CourseDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortDescription = json['short_description'];
    description = json['description'];
    if (json['course_faq'] != null) {
      courseFaq = <CourseFaq>[];
      json['course_faq'].forEach((v) {
        courseFaq!.add(new CourseFaq.fromJson(v));
      });
    }
    coursePreRequisition = json['course_pre_requisition'];
    courseOutcome = json['course_outcome'];
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
    courseApproved = json['course_approved'];
    guidelineForInstructor = json['guideline_for_instructor'];
    image = json['image'];
    masterK12Grade = json['master_k12_grade'];
    courseCategory = json['course_category'] != null
        ? new CourseCategory.fromJson(json['course_category'])
        : null;
    managerEmployee = json['manager_employee'] != null
        ? new ManagerEmployee.fromJson(json['manager_employee'])
        : null;
    institute = json['institute'] != null
        ? new Institute.fromJson(json['institute'])
        : null;
    if (json['course_multiple_tutors'] != null) {
      courseMultipleTutors = <CourseMultipleTutors>[];
      json['course_multiple_tutors'].forEach((v) {
        courseMultipleTutors!.add(new CourseMultipleTutors.fromJson(v));
      });
    }
    if (json['course_modules'] != null) {
      courseModules = <CourseModules>[];
      json['course_modules'].forEach((v) {
        courseModules!.add(new CourseModules.fromJson(v));
      });
    }
    if (json['course_lessons'] != null) {
      courseLessons = <CourseLessons>[];
      json['course_lessons'].forEach((v) {
        courseLessons!.add(new CourseLessons.fromJson(v));
      });
    }
    if (json['course_assignments'] != null) {
      courseAssignments = <CourseAssignments>[];
      json['course_assignments'].forEach((v) {
        courseAssignments!.add(new CourseAssignments.fromJson(v));
      });
    }
    courseCategoryId = json['course_category_id'];
    managerEmployeeId = json['manager_employee_id'];
    instituteId = json['institute_id'];
    masterCourseStatusId = json['master_course_status_id'];
    masterCourseLevelId = json['master_course_level_id'];
    masterCourseTypeId = json['master_course_type_id'];
    primaryTutorId = json['primary_tutor_id'];
    masterPhotoLibraryId = json['master_photo_library_id'];
    masterVideoLibraryId = json['master_video_library_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    if (this.courseFaq != null) {
      data['course_faq'] = this.courseFaq!.map((v) => v.toJson()).toList();
    }
    data['course_pre_requisition'] = this.coursePreRequisition;
    data['course_outcome'] = this.courseOutcome;
    data['seo_title'] = this.seoTitle;
    data['seo_keywords'] = this.seoKeywords;
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
    data['credits'] = this.credits;
    data['regular_course_or_bootcamp_course'] =
        this.regularCourseOrBootcampCourse;
    data['single_or_bundle_course'] = this.singleOrBundleCourse;
    data['free_or_paid_course'] = this.freeOrPaidCourse;
    data['published_on_public_site'] = this.publishedOnPublicSite;
    data['private_or_public_course'] = this.privateOrPublicCourse;
    data['drip_content_based_course'] = this.dripContentBasedCourse;
    data['course_approved'] = this.courseApproved;
    data['guideline_for_instructor'] = this.guidelineForInstructor;
    data['image'] = this.image;
    data['master_k12_grade'] = this.masterK12Grade;
    if (this.courseCategory != null) {
      data['course_category'] = this.courseCategory!.toJson();
    }
    if (this.managerEmployee != null) {
      data['manager_employee'] = this.managerEmployee!.toJson();
    }
    if (this.institute != null) {
      data['institute'] = this.institute!.toJson();
    }
    if (this.courseMultipleTutors != null) {
      data['course_multiple_tutors'] =
          this.courseMultipleTutors!.map((v) => v.toJson()).toList();
    }
    if (this.courseModules != null) {
      data['course_modules'] =
          this.courseModules!.map((v) => v.toJson()).toList();
    }
    if (this.courseLessons != null) {
      data['course_lessons'] =
          this.courseLessons!.map((v) => v.toJson()).toList();
    }
    if (this.courseAssignments != null) {
      data['course_assignments'] =
          this.courseAssignments!.map((v) => v.toJson()).toList();
    }
    data['course_category_id'] = this.courseCategoryId;
    data['manager_employee_id'] = this.managerEmployeeId;
    data['institute_id'] = this.instituteId;
    data['master_course_status_id'] = this.masterCourseStatusId;
    data['master_course_level_id'] = this.masterCourseLevelId;
    data['master_course_type_id'] = this.masterCourseTypeId;
    data['primary_tutor_id'] = this.primaryTutorId;
    data['master_photo_library_id'] = this.masterPhotoLibraryId;
    data['master_video_library_id'] = this.masterVideoLibraryId;
    return data;
  }
}

class CourseFaq {
  String? answer;
  String? question;

  CourseFaq({this.answer, this.question});

  CourseFaq.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['question'] = this.question;
    return data;
  }
}

class CourseCategory {
  int? id;
  String? name;
  String? description;
  bool? publishedOnPublicSite;

  CourseCategory(
      {this.id, this.name, this.description, this.publishedOnPublicSite});

  CourseCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    publishedOnPublicSite = json['published_on_public_site'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['published_on_public_site'] = this.publishedOnPublicSite;
    return data;
  }
}

class ManagerEmployee {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? fullAddress;
  String? address;
  String? zipCode;
  String? city;
  String? dateOfBirth;
  String? mobile;
  String? officePhone;
  String? personalEmail;
  String? businessEmail;
  String? employeeProfile;
  String? ssnOrTaxNumber;
  String? employeeCustomizedJobProfile;
  String? hireDate;
  String? facebook;
  String? linkedIn;
  String? countryCode;
  bool? remoteEmployee;
  bool? currentOrFormerEmployee;
  String? profilePictureId;
  int? countryId;
  int? stateId;
  int? userId;
  int? employeeMasterDepartmentId;
  int? employeeMasterJobTitleId;
  int? tutorId;

  ManagerEmployee(
      {this.id,
        this.name,
        this.firstName,
        this.lastName,
        this.fullAddress,
        this.address,
        this.zipCode,
        this.city,
        this.dateOfBirth,
        this.mobile,
        this.officePhone,
        this.personalEmail,
        this.businessEmail,
        this.employeeProfile,
        this.ssnOrTaxNumber,
        this.employeeCustomizedJobProfile,
        this.hireDate,
        this.facebook,
        this.linkedIn,
        this.countryCode,
        this.remoteEmployee,
        this.currentOrFormerEmployee,
        this.profilePictureId,
        this.countryId,
        this.stateId,
        this.userId,
        this.employeeMasterDepartmentId,
        this.employeeMasterJobTitleId,
        this.tutorId});

  ManagerEmployee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullAddress = json['full_address'];
    address = json['address'];
    zipCode = json['zip_code'];
    city = json['city'];
    dateOfBirth = json['date_of_birth'];
    mobile = json['mobile'];
    officePhone = json['office_phone'];
    personalEmail = json['personal_email'];
    businessEmail = json['business_email'];
    employeeProfile = json['employee_profile'];
    ssnOrTaxNumber = json['ssn_or_tax_number'];
    employeeCustomizedJobProfile = json['employee_customized_job_profile'];
    hireDate = json['hire_date'];
    facebook = json['facebook'];
    linkedIn = json['linked_in'];
    countryCode = json['country_code'];
    remoteEmployee = json['remote_employee'];
    currentOrFormerEmployee = json['current_or_former_employee'];
    profilePictureId = json['profile_picture_id'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    userId = json['user_id'];
    employeeMasterDepartmentId = json['employee_master_department_id'];
    employeeMasterJobTitleId = json['employee_master_job_title_id'];
    tutorId = json['tutor_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['full_address'] = this.fullAddress;
    data['address'] = this.address;
    data['zip_code'] = this.zipCode;
    data['city'] = this.city;
    data['date_of_birth'] = this.dateOfBirth;
    data['mobile'] = this.mobile;
    data['office_phone'] = this.officePhone;
    data['personal_email'] = this.personalEmail;
    data['business_email'] = this.businessEmail;
    data['employee_profile'] = this.employeeProfile;
    data['ssn_or_tax_number'] = this.ssnOrTaxNumber;
    data['employee_customized_job_profile'] = this.employeeCustomizedJobProfile;
    data['hire_date'] = this.hireDate;
    data['facebook'] = this.facebook;
    data['linked_in'] = this.linkedIn;
    data['country_code'] = this.countryCode;
    data['remote_employee'] = this.remoteEmployee;
    data['current_or_former_employee'] = this.currentOrFormerEmployee;
    data['profile_picture_id'] = this.profilePictureId;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['user_id'] = this.userId;
    data['employee_master_department_id'] = this.employeeMasterDepartmentId;
    data['employee_master_job_title_id'] = this.employeeMasterJobTitleId;
    data['tutor_id'] = this.tutorId;
    return data;
  }
}

class Institute {
  int? id;
  String? name;
  String? tradeName;
  String? yearOfEstablishment;
  String? city;
  String? zipCode;
  String? latitude;
  String? longitude;
  String? phone;
  String? email;
  String? logo;
  String? industry;
  bool? verified;
  int? ratingScore;
  bool? archive;
  bool? marketplaceSeller;
  bool? referred;
  int? coursesOffering;
  int? studentEnrolled;
  int? instituteTutors;
  String? onboardedSinceDate;
  int? countryId;
  int? stateId;
  int? verifiedByUserId;
  Null? zoneId;
  int? masterInstituteId;
  int? masterMembershipTypeId;
  int? assignedByEmployeeId;

  Institute(
      {this.id,
        this.name,
        this.tradeName,
        this.yearOfEstablishment,
        this.city,
        this.zipCode,
        this.latitude,
        this.longitude,
        this.phone,
        this.email,
        this.logo,
        this.industry,
        this.verified,
        this.ratingScore,
        this.archive,
        this.marketplaceSeller,
        this.referred,
        this.coursesOffering,
        this.studentEnrolled,
        this.instituteTutors,
        this.onboardedSinceDate,
        this.countryId,
        this.stateId,
        this.verifiedByUserId,
        this.zoneId,
        this.masterInstituteId,
        this.masterMembershipTypeId,
        this.assignedByEmployeeId});

  Institute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tradeName = json['trade_name'];
    yearOfEstablishment = json['year_of_establishment'];
    city = json['city'];
    zipCode = json['zip_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phone = json['phone'];
    email = json['email'];
    logo = json['logo'];
    industry = json['industry'];
    verified = json['verified'];
    ratingScore = json['rating_score'];
    archive = json['archive'];
    marketplaceSeller = json['marketplace_seller'];
    referred = json['referred'];
    coursesOffering = json['courses_offering'];
    studentEnrolled = json['student_enrolled'];
    instituteTutors = json['institute_tutors'];
    onboardedSinceDate = json['onboarded_since_date'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    verifiedByUserId = json['verified_by_user_id'];
    zoneId = json['zone_id'];
    masterInstituteId = json['master_institute_id'];
    masterMembershipTypeId = json['master_membership_type_id'];
    assignedByEmployeeId = json['assigned_by_employee_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['trade_name'] = this.tradeName;
    data['year_of_establishment'] = this.yearOfEstablishment;
    data['city'] = this.city;
    data['zip_code'] = this.zipCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['logo'] = this.logo;
    data['industry'] = this.industry;
    data['verified'] = this.verified;
    data['rating_score'] = this.ratingScore;
    data['archive'] = this.archive;
    data['marketplace_seller'] = this.marketplaceSeller;
    data['referred'] = this.referred;
    data['courses_offering'] = this.coursesOffering;
    data['student_enrolled'] = this.studentEnrolled;
    data['institute_tutors'] = this.instituteTutors;
    data['onboarded_since_date'] = this.onboardedSinceDate;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['verified_by_user_id'] = this.verifiedByUserId;
    data['zone_id'] = this.zoneId;
    data['master_institute_id'] = this.masterInstituteId;
    data['master_membership_type_id'] = this.masterMembershipTypeId;
    data['assigned_by_employee_id'] = this.assignedByEmployeeId;
    return data;
  }
}

class CourseMultipleTutors {
  int? id;
  bool? primaryTutor;
  int? displaySequence;
  int? numberOfHours;
  String? notes;
  int? courseId;
  int? tutorId;

  CourseMultipleTutors(
      {this.id,
        this.primaryTutor,
        this.displaySequence,
        this.numberOfHours,
        this.notes,
        this.courseId,
        this.tutorId});

  CourseMultipleTutors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    primaryTutor = json['primary_tutor'];
    displaySequence = json['display_sequence'];
    numberOfHours = json['number_of_hours'];
    notes = json['notes'];
    courseId = json['course_id'];
    tutorId = json['tutor_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['primary_tutor'] = this.primaryTutor;
    data['display_sequence'] = this.displaySequence;
    data['number_of_hours'] = this.numberOfHours;
    data['notes'] = this.notes;
    data['course_id'] = this.courseId;
    data['tutor_id'] = this.tutorId;
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
    numberOfLessons = json['number_of_lessons'];
    saveAsTemplate = json['save_as_template'];
    courseId = json['course_id'];
    tutorId = json['tutor_id'];
    instituteId = json['institute_id'];
    approvedByEmployeeId = json['approved_by_employee_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['module_content_approved'] = this.moduleContentApproved;
    data['number_of_lessons'] = this.numberOfLessons;
    data['save_as_template'] = this.saveAsTemplate;
    data['course_id'] = this.courseId;
    data['tutor_id'] = this.tutorId;
    data['institute_id'] = this.instituteId;
    data['approved_by_employee_id'] = this.approvedByEmployeeId;
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
  String? guidelineForInstructor;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['is_active'] = this.isActive;
    data['guideline_for_instructor'] = this.guidelineForInstructor;
    data['lesson_content_approved'] = this.lessonContentApproved;
    data['course_lesson_type_id'] = this.courseLessonTypeId;
    data['primary_tutor_id'] = this.primaryTutorId;
    data['course_id'] = this.courseId;
    data['course_module_id'] = this.courseModuleId;
    data['master_photo_library_id'] = this.masterPhotoLibraryId;
    data['master_video_library_id'] = this.masterVideoLibraryId;
    data['master_audio_library_id'] = this.masterAudioLibraryId;
    data['master_digital_library_id'] = this.masterDigitalLibraryId;
    data['master_book_library_id'] = this.masterBookLibraryId;
    data['approved_by_employee_id'] = this.approvedByEmployeeId;
    return data;
  }
}

class CourseAssignments {
  int? id;
  String? title;
  String? description;
  int? coursePoints;
  String? guidelineForInstructor;
  bool? assignmentContentApproved;
  bool? saveAsTemplate;
  int? courseId;
  int? courseModuleId;
  int? courseLessonId;
  int? approvedByEmployeeId;

  CourseAssignments(
      {this.id,
        this.title,
        this.description,
        this.coursePoints,
        this.guidelineForInstructor,
        this.assignmentContentApproved,
        this.saveAsTemplate,
        this.courseId,
        this.courseModuleId,
        this.courseLessonId,
        this.approvedByEmployeeId});

  CourseAssignments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    coursePoints = json['course_points'];
    guidelineForInstructor = json['guideline_for_instructor'];
    assignmentContentApproved = json['assignment_content_approved'];
    saveAsTemplate = json['save_as_template'];
    courseId = json['course_id'];
    courseModuleId = json['course_module_id'];
    courseLessonId = json['course_lesson_id'];
    approvedByEmployeeId = json['approved_by_employee_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['course_points'] = this.coursePoints;
    data['guideline_for_instructor'] = this.guidelineForInstructor;
    data['assignment_content_approved'] = this.assignmentContentApproved;
    data['save_as_template'] = this.saveAsTemplate;
    data['course_id'] = this.courseId;
    data['course_module_id'] = this.courseModuleId;
    data['course_lesson_id'] = this.courseLessonId;
    data['approved_by_employee_id'] = this.approvedByEmployeeId;
    return data;
  }
}
