class CourseModulesResponse {
  bool? ok;
  int? status;
  String? message;
  Modules? results;
  Meta? meta;

  CourseModulesResponse(
      {this.ok, this.status, this.message, this.results, this.meta});

  CourseModulesResponse.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    status = json['status'];
    message = json['message'];
    results =
    json['results'] != null ? Modules.fromJson(json['results']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
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

class Modules {
  List<Module>? module;
  int? total;

  Modules({this.module, this.total});

  Modules.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      module = <Module>[];
      json['data'].forEach((v) {
        module!.add(Module.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.module != null) {
      data['data'] = this.module!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class Module {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  String? description;
  String? duration;
  bool? moduleContentApproved;
  String? guidelineForInstructor;
  bool? saveAsTemplate;
  String? courseId;
  String? tutorId;
  String? approvedByEmployeeId;
  List<CourseLessons>? courseLessons;

  Module(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.name,
        this.description,
        this.duration,
        this.moduleContentApproved,
        this.guidelineForInstructor,
        this.saveAsTemplate,
        this.courseId,
        this.tutorId,
        this.approvedByEmployeeId,
        this.courseLessons});

  Module.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    name = json['name'];
    description = json['description'];
    duration = json['duration'];
    moduleContentApproved = json['module_content_approved'];
    guidelineForInstructor = json['guideline_for_instructor'];
    saveAsTemplate = json['save_as_template'];
    courseId = json['course_id'];
    tutorId = json['tutor_id'];
    approvedByEmployeeId = json['approved_by_employee_id'];
    if (json['course_lessons'] != null) {
      courseLessons = <CourseLessons>[];
      json['course_lessons'].forEach((v) {
        courseLessons!.add(CourseLessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['name'] = name;
    data['description'] = description;
    data['duration'] = duration;
    data['module_content_approved'] = moduleContentApproved;
    data['guideline_for_instructor'] = guidelineForInstructor;
    data['save_as_template'] = saveAsTemplate;
    data['course_id'] = courseId;
    data['tutor_id'] = tutorId;
    data['approved_by_employee_id'] = approvedByEmployeeId;
    if (courseLessons != null) {
      data['course_lessons'] =
          courseLessons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseLessons {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  String? summary;
  String? description;
  String? duration;
  bool? isActive;
  String? lessonImage;
  String? lessonVideo;
  String? guidelineForInstructor;
  bool? lessonContentApproved;
  bool? isTemplate;
  String? primaryTutorId;
  String? courseModuleId;
  String? courseLessonTypeId;

  CourseLessons(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.name,
        this.summary,
        this.description,
        this.duration,
        this.isActive,
        this.lessonImage,
        this.lessonVideo,
        this.guidelineForInstructor,
        this.lessonContentApproved,
        this.isTemplate,
        this.primaryTutorId,
        this.courseModuleId,
        this.courseLessonTypeId});

  CourseLessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    name = json['name'];
    summary = json['summary'];
    description = json['description'];
    duration = json['duration'];
    isActive = json['is_active'];
    lessonImage = json['lesson_image'];
    lessonVideo = json['lesson_video'];
    guidelineForInstructor = json['guideline_for_instructor'];
    lessonContentApproved = json['lesson_content_approved'];
    isTemplate = json['is_template'];
    primaryTutorId = json['primary_tutor_id'];
    courseModuleId = json['course_module_id'];
    courseLessonTypeId = json['course_lesson_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['name'] = name;
    data['summary'] = summary;
    data['description'] = description;
    data['duration'] = duration;
    data['is_active'] = isActive;
    data['lesson_image'] = lessonImage;
    data['lesson_video'] = lessonVideo;
    data['guideline_for_instructor'] = guidelineForInstructor;
    data['lesson_content_approved'] = lessonContentApproved;
    data['is_template'] = isTemplate;
    data['primary_tutor_id'] = primaryTutorId;
    data['course_module_id'] = courseModuleId;
    data['course_lesson_type_id'] = courseLessonTypeId;
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
