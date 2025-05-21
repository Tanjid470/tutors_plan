class ProfileGetResponseBody {
  String? status;
  Data? data;
  String? message;
  int? pagination;

  ProfileGetResponseBody({this.status, this.data, this.message, this.pagination});

  ProfileGetResponseBody.fromJson(Map<String, dynamic> json) {
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
  int? id;
  bool? isSuperAdmin;
  String? username;
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
  bool? lockoutEnd;
  int? securityStamp;
  String? profilePicture;
  String? profilePictureUrl;
  int? profilePictureThumbnailUrl;
  bool? whatsappSubscribed;
  bool? emailSubscribed;
  bool? smsSubscribed;
  int? customerIdStripe;
  int? activeSubscriptionId;
  int? masterCountryId;
  int? zoneId;
  int? studentId;
  int? tutorId;
  int? instituteId;
  int? employeeId;
  int? primaryRoleId;

  Data(
      {this.id,
        this.isSuperAdmin,
        this.username,
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
        this.lockoutEnd,
        this.securityStamp,
        this.profilePicture,
        this.profilePictureUrl,
        this.profilePictureThumbnailUrl,
        this.whatsappSubscribed,
        this.emailSubscribed,
        this.smsSubscribed,
        this.customerIdStripe,
        this.activeSubscriptionId,
        this.masterCountryId,
        this.zoneId,
        this.studentId,
        this.tutorId,
        this.instituteId,
        this.employeeId,
        this.primaryRoleId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isSuperAdmin = json['is_super_admin'];
    username = json['username'];
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
    lockoutEnd = json['lockout_end'];
    securityStamp = json['security_stamp'];
    profilePicture = json['profile_picture'];
    profilePictureUrl = json['profile_picture_url'];
    profilePictureThumbnailUrl = json['profile_picture_thumbnail_url'];
    whatsappSubscribed = json['whatsapp_subscribed'];
    emailSubscribed = json['email_subscribed'];
    smsSubscribed = json['sms_subscribed'];
    customerIdStripe = json['customer_id_stripe'];
    activeSubscriptionId = json['active_subscription_id'];
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
    data['id'] = id;
    data['is_super_admin'] = isSuperAdmin;
    data['username'] = username;
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
    data['lockout_end'] = lockoutEnd;
    data['security_stamp'] = securityStamp;
    data['profile_picture'] = profilePicture;
    data['profile_picture_url'] = profilePictureUrl;
    data['profile_picture_thumbnail_url'] = profilePictureThumbnailUrl;
    data['whatsapp_subscribed'] = whatsappSubscribed;
    data['email_subscribed'] = emailSubscribed;
    data['sms_subscribed'] = smsSubscribed;
    data['customer_id_stripe'] = customerIdStripe;
    data['active_subscription_id'] = activeSubscriptionId;
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
