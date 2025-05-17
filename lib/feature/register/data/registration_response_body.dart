class RegistrationResponseBody {
  String? status;
  Data? data;
  String? message;
  int? pagination;

  RegistrationResponseBody(
      {this.status, this.data, this.message, this.pagination});

  RegistrationResponseBody.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    pagination = json['pagination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['pagination'] = pagination;
    return data;
  }
}

class Data {
  String? username;
  String? accessLevel;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  bool? activeOrArchive;
  bool? emailConfirmed;
  bool? accountLock;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  bool? lockoutEnabled;
  int? accessFailedCount;
  String? securityStamp;
  String? profilePicture;
  String? profilePictureUrl;
  String? profilePictureThumbnailUrl;
  bool? whatsappSubscribed;
  bool? emailSubscribed;
  bool? smsSubscribed;
  MasterCountry? masterCountry;
  MasterCountry? primaryRole;
  MasterCountry? zone;
  MasterCountry? student;
  MasterCountry? tutor;
  MasterCountry? institute;
  MasterCountry? employee;
  bool? lockoutEnd;
  int? customerIdStripe;
  int? activeSubscriptionId;
  int? id;
  bool? isSuperAdmin;
  int? masterCountryId;
  int? zoneId;
  int? studentId;
  int? tutorId;
  int? instituteId;
  int? employeeId;
  int? primaryRoleId;

  Data(
      {this.username,
        this.accessLevel,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.activeOrArchive,
        this.emailConfirmed,
        this.accountLock,
        this.phoneNumberConfirmed,
        this.twoFactorEnabled,
        this.lockoutEnabled,
        this.accessFailedCount,
        this.securityStamp,
        this.profilePicture,
        this.profilePictureUrl,
        this.profilePictureThumbnailUrl,
        this.whatsappSubscribed,
        this.emailSubscribed,
        this.smsSubscribed,
        this.masterCountry,
        this.primaryRole,
        this.zone,
        this.student,
        this.tutor,
        this.institute,
        this.employee,
        this.lockoutEnd,
        this.customerIdStripe,
        this.activeSubscriptionId,
        this.id,
        this.isSuperAdmin,
        this.masterCountryId,
        this.zoneId,
        this.studentId,
        this.tutorId,
        this.instituteId,
        this.employeeId,
        this.primaryRoleId});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    accessLevel = json['access_level'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    activeOrArchive = json['active_or_archive'];
    emailConfirmed = json['email_confirmed'];
    accountLock = json['account_lock'];
    phoneNumberConfirmed = json['phone_number_confirmed'];
    twoFactorEnabled = json['two_factor_enabled'];
    lockoutEnabled = json['lockout_enabled'];
    accessFailedCount = json['access_failed_count'];
    securityStamp = json['security_stamp'];
    profilePicture = json['profile_picture'];
    profilePictureUrl = json['profile_picture_url'];
    profilePictureThumbnailUrl = json['profile_picture_thumbnail_url'];
    whatsappSubscribed = json['whatsapp_subscribed'];
    emailSubscribed = json['email_subscribed'];
    smsSubscribed = json['sms_subscribed'];
    masterCountry = json['master_country'] != null
        ? MasterCountry.fromJson(json['master_country'])
        : null;
    primaryRole = json['primary_role'] != null
        ? MasterCountry.fromJson(json['primary_role'])
        : null;
    zone =
    json['zone'] != null ? MasterCountry.fromJson(json['zone']) : null;
    student = json['student'] != null
        ? MasterCountry.fromJson(json['student'])
        : null;
    tutor = json['tutor'] != null
        ? MasterCountry.fromJson(json['tutor'])
        : null;
    institute = json['institute'] != null
        ? MasterCountry.fromJson(json['institute'])
        : null;
    employee = json['employee'] != null
        ? MasterCountry.fromJson(json['employee'])
        : null;
    lockoutEnd = json['lockout_end'];
    customerIdStripe = json['customer_id_stripe'];
    activeSubscriptionId = json['active_subscription_id'];
    id = json['id'];
    isSuperAdmin = json['is_super_admin'];
    masterCountryId = json['master_country_id'];
    zoneId = json['zone_id'];
    studentId = json['student_id'];
    tutorId = json['tutor_id'];
    instituteId = json['institute_id'];
    employeeId = json['employee_id'];
    primaryRoleId = json['primary_role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['username'] = username;
    data['access_level'] = accessLevel;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['active_or_archive'] = activeOrArchive;
    data['email_confirmed'] = emailConfirmed;
    data['account_lock'] = accountLock;
    data['phone_number_confirmed'] = phoneNumberConfirmed;
    data['two_factor_enabled'] = twoFactorEnabled;
    data['lockout_enabled'] = lockoutEnabled;
    data['access_failed_count'] = accessFailedCount;
    data['security_stamp'] = securityStamp;
    data['profile_picture'] = profilePicture;
    data['profile_picture_url'] = profilePictureUrl;
    data['profile_picture_thumbnail_url'] = profilePictureThumbnailUrl;
    data['whatsapp_subscribed'] = whatsappSubscribed;
    data['email_subscribed'] = emailSubscribed;
    data['sms_subscribed'] = smsSubscribed;
    if (masterCountry != null) {
      data['master_country'] = masterCountry!.toJson();
    }
    if (primaryRole != null) {
      data['primary_role'] = primaryRole!.toJson();
    }
    if (zone != null) {
      data['zone'] = zone!.toJson();
    }
    if (student != null) {
      data['student'] = student!.toJson();
    }
    if (tutor != null) {
      data['tutor'] = tutor!.toJson();
    }
    if (institute != null) {
      data['institute'] = institute!.toJson();
    }
    if (employee != null) {
      data['employee'] = employee!.toJson();
    }
    data['lockout_end'] = lockoutEnd;
    data['customer_id_stripe'] = customerIdStripe;
    data['active_subscription_id'] = activeSubscriptionId;
    data['id'] = id;
    data['is_super_admin'] = isSuperAdmin;
    data['master_country_id'] = masterCountryId;
    data['zone_id'] = zoneId;
    data['student_id'] = studentId;
    data['tutor_id'] = tutorId;
    data['institute_id'] = instituteId;
    data['employee_id'] = employeeId;
    data['primary_role_id'] = primaryRoleId;
    return data;
  }
}

class MasterCountry {
  int? id;

  MasterCountry({this.id});

  MasterCountry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    return data;
  }
}
