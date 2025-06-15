class ExamResponse {
  bool? ok;
  int? status;
  String? message;
  ExamData? examData;
  Meta? meta;

  ExamResponse({this.ok, this.status, this.message, this.examData, this.meta});

  ExamResponse.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    status = json['status'];
    message = json['message'];
    examData = json['results'] != null ? ExamData.fromJson(json['results']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    data['status'] = status;
    data['message'] = message;
    if (examData != null) {
      data['results'] = examData!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class ExamData {
  List<Exams>? exams;
  Pagination? pagination;

  ExamData({this.exams, this.pagination});

  ExamData.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      exams = <Exams>[];
      json['items'].forEach((v) {
        exams!.add(Exams.fromJson(v));
      });
    }
    pagination = json['meta'] != null ? Pagination.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (exams != null) {
      data['items'] = exams!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['meta'] = pagination!.toJson();
    }
    return data;
  }
}

class Exams {
  String? id;
  String? title;
  String? description;
  String? examAudiences;
  String? examCode;
  String? preRequisites;
  int? totalQuestionsToAppear;
  int? totalScore;
  int? passingScore;
  String? gradingPolicy;
  int? scoreForEachQuestion;
  int? examDurationMinutes;
  String? examTags;
  String? startDateTime;
  String? endDateTime;
  bool? isPracticeExam;
  String? courseId;
  String? masterExamDifficultyLevelTypeId;
  MasterExamDifficultyLevelType? masterExamDifficultyLevelType;
  MasterExamDifficultyLevelType? course;

  Exams(
      {this.id,
        this.title,
        this.description,
        this.examAudiences,
        this.examCode,
        this.preRequisites,
        this.totalQuestionsToAppear,
        this.totalScore,
        this.passingScore,
        this.gradingPolicy,
        this.scoreForEachQuestion,
        this.examDurationMinutes,
        this.examTags,
        this.startDateTime,
        this.endDateTime,
        this.isPracticeExam,
        this.courseId,
        this.masterExamDifficultyLevelTypeId,
        this.masterExamDifficultyLevelType,
        this.course});

  Exams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    examAudiences = json['exam_audiences'];
    examCode = json['exam_code'];
    preRequisites = json['pre_requisites'];
    totalQuestionsToAppear = json['total_questions_to_appear'];
    totalScore = json['total_score'];
    passingScore = json['passing_score'];
    gradingPolicy = json['grading_policy'];
    scoreForEachQuestion = json['score_for_each_question'];
    examDurationMinutes = json['exam_duration_minutes'];
    examTags = json['exam_tags'];
    startDateTime = json['start_date_time'];
    endDateTime = json['end_date_time'];
    isPracticeExam = json['is_Practice_Exam'];
    courseId = json['course_id'];
    masterExamDifficultyLevelTypeId =
    json['master_exam_difficulty_level_type_id'];
    masterExamDifficultyLevelType =
    json['master_exam_difficulty_level_type'] != null
        ? MasterExamDifficultyLevelType.fromJson(
        json['master_exam_difficulty_level_type'])
        : null;
    course = json['course'] != null
        ? MasterExamDifficultyLevelType.fromJson(json['course'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['exam_audiences'] = examAudiences;
    data['exam_code'] = examCode;
    data['pre_requisites'] = preRequisites;
    data['total_questions_to_appear'] = totalQuestionsToAppear;
    data['total_score'] = totalScore;
    data['passing_score'] = passingScore;
    data['grading_policy'] = gradingPolicy;
    data['score_for_each_question'] = scoreForEachQuestion;
    data['exam_duration_minutes'] = examDurationMinutes;
    data['exam_tags'] = examTags;
    data['start_date_time'] = startDateTime;
    data['end_date_time'] = endDateTime;
    data['is_Practice_Exam'] = isPracticeExam;
    data['course_id'] = courseId;
    data['master_exam_difficulty_level_type_id'] =
        masterExamDifficultyLevelTypeId;
    if (masterExamDifficultyLevelType != null) {
      data['master_exam_difficulty_level_type'] =
          masterExamDifficultyLevelType!.toJson();
    }
    if (course != null) {
      data['course'] = course!.toJson();
    }
    return data;
  }
}

class MasterExamDifficultyLevelType {
  String? id;
  String? name;

  MasterExamDifficultyLevelType({this.id, this.name});

  MasterExamDifficultyLevelType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Pagination {
  int? total;
  int? page;
  int? limit;

  Pagination({this.total, this.page, this.limit});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = total;
    data['page'] = page;
    data['limit'] = limit;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['response_time'] = this.responseTime;
    return data;
  }
}
