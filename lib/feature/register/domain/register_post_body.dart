
import 'dart:convert';
String registrationDataBodyToJson(RegistrationPostBody data) => json.encode(data.toJson());

class RegistrationPostBody {
  String? username;
  String? passwordHash;
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
  bool? lockoutEnd;
  String? securityStamp;
  String? profilePicture;
  String? profilePictureUrl;
  String? profilePictureThumbnailUrl;
  bool? whatsappSubscribed;
  bool? emailSubscribed;
  bool? smsSubscribed;
  int? masterCountry;
  int? zone;
  int? tutor;
  int? institute;
  int? employee;
  List<int>? roles;
  int? primaryRole;

  RegistrationPostBody(
      {this.username,
        this.passwordHash,
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
        this.lockoutEnd,
        this.securityStamp,
        this.profilePicture,
        this.profilePictureUrl,
        this.profilePictureThumbnailUrl,
        this.whatsappSubscribed,
        this.emailSubscribed,
        this.smsSubscribed,
        this.masterCountry,
        this.zone,
        this.tutor,
        this.institute,
        this.employee,
        this.roles,
        this.primaryRole});

  RegistrationPostBody.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    passwordHash = json['password_hash'];
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
    lockoutEnd = json['lockout_end'];
    securityStamp = json['security_stamp'];
    profilePicture = json['profile_picture'];
    profilePictureUrl = json['profile_picture_url'];
    profilePictureThumbnailUrl = json['profile_picture_thumbnail_url'];
    whatsappSubscribed = json['whatsapp_subscribed'];
    emailSubscribed = json['email_subscribed'];
    smsSubscribed = json['sms_subscribed'];
    masterCountry = json['master_country'];
    zone = json['zone'];
    tutor = json['tutor'];
    institute = json['institute'];
    employee = json['employee'];
    roles = json['roles'].cast<int>();
    primaryRole = json['primary_role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password_hash'] = passwordHash;
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
    data['lockout_end'] = lockoutEnd;
    data['security_stamp'] = securityStamp;
    data['profile_picture'] = profilePicture;
    data['profile_picture_url'] = profilePictureUrl;
    data['profile_picture_thumbnail_url'] = profilePictureThumbnailUrl;
    data['whatsapp_subscribed'] = whatsappSubscribed;
    data['email_subscribed'] = emailSubscribed;
    data['sms_subscribed'] = smsSubscribed;
    data['master_country'] = masterCountry;
    data['zone'] = zone;
    data['tutor'] = tutor;
    data['institute'] = institute;
    data['employee'] = employee;
    data['roles'] = roles;
    data['primary_role'] = primaryRole;
    return data;
  }
}

