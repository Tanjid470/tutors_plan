class CategoryResponse {
  bool? ok;
  int? status;
  String? message;
  List<Category>? categories;
  Meta? meta;

  CategoryResponse(
      {this.ok, this.status, this.message, this.categories, this.meta});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    status = json['status'];
    message = json['message'];
    if (json['results'] != null) {
      categories = <Category>[];
      json['results'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    data['status'] = status;
    data['message'] = message;
    if (categories != null) {
      data['results'] = categories!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Category {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  String? description;
  String? seoKeywords;
  String? icon;
  bool? publishedOnPublicSite;
  int? displaySequence;
  String? categoryManagerId;
  String? assignedTutor;
  String? managerEmployeeId;

  Category(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.name,
        this.description,
        this.seoKeywords,
        this.icon,
        this.publishedOnPublicSite,
        this.displaySequence,
        this.categoryManagerId,
        this.assignedTutor,
        this.managerEmployeeId});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    name = json['name'];
    description = json['description'];
    seoKeywords = json['seo_keywords'];
    icon = json['icon'];
    publishedOnPublicSite = json['published_on_public_site'];
    displaySequence = json['display_sequence'];
    categoryManagerId = json['category_manager_id'];
    assignedTutor = json['assigned_tutor'];
    managerEmployeeId = json['manager_employee_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['name'] = name;
    data['description'] = description;
    data['seo_keywords'] = seoKeywords;
    data['icon'] = icon;
    data['published_on_public_site'] = publishedOnPublicSite;
    data['display_sequence'] = displaySequence;
    data['category_manager_id'] = categoryManagerId;
    data['assigned_tutor'] = assignedTutor;
    data['manager_employee_id'] = managerEmployeeId;
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
