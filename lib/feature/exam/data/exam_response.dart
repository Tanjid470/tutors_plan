class ExamResponse {
  bool? ok;
  int? status;
  String? message;
  ExamData? examData;
  Pagination? pagination;

  ExamResponse({this.ok, this.status, this.message, this.examData, this.pagination});

  ExamResponse.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    status = json['status'];
    message = json['message'];
    examData =
    json['results'] != null ? ExamData.fromJson(json['results']) : null;
    pagination = json['meta'] != null ? Pagination.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    data['status'] = status;
    data['message'] = message;
    if (examData != null) {
      data['results'] = examData!.toJson();
    }
    if (pagination != null) {
      data['meta'] = pagination!.toJson();
    }
    return data;
  }
}

class ExamData {
  List<Exams>? exams;
  Pagination? meta;

  ExamData({this.exams, this.meta});

  ExamData.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      exams = <Exams>[];
      json['items'].forEach((v) {
        exams!.add(new Exams.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Pagination.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (exams != null) {
      data['items'] = exams!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Exams {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? title;
  String? description;
  int? coursePoints;
  String? guidelineForInstructor;
  String? courseId;
  String? examId;

  Exams(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.title,
        this.description,
        this.coursePoints,
        this.guidelineForInstructor,
        this.courseId,
        this.examId});

  Exams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    title = json['title'];
    description = json['description'];
    coursePoints = json['course_points'];
    guidelineForInstructor = json['guideline_for_instructor'];
    courseId = json['course_id'];
    examId = json['exam_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['title'] = title;
    data['description'] = description;
    data['course_points'] = coursePoints;
    data['guideline_for_instructor'] = guidelineForInstructor;
    data['course_id'] = courseId;
    data['exam_id'] = examId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['timestamp'] = this.timestamp;
    data['response_time'] = this.responseTime;
    return data;
  }
}
