class UserModel {
  String? id;
  String? username;
  String? phoneNumber;
  String? email;
  String? password;
  String? workAtCompany;
  String? country;
  String? city;
  int? qualifiedLeadsFee;
  int? conversionFee;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? status;
  String? firstName;
  String? lastName;
  String? avatar;
  String? aboutMe;
  String? address;
  String? type;
  String? name;
  String? location;
  String? language;
  String? billingId;
  String? stripeConnectId;
  String? balance;
  String? emailVerifiedAt;
  String? bio;
  String? domain;
  String? state;
  String? zipCode;
  String? gender;
  String? dateOfBirth;
  String? approvedAt;
  String? availability;
  int? isTwoFactorEnabled;
  String? twoFactorSecret;
  int? points;
  String? deviceType;
  String? fcmToken;

  UserModel(
      {this.id,
      this.username,
      this.phoneNumber,
      this.email,
      this.password,
      this.workAtCompany,
      this.country,
      this.city,
      this.qualifiedLeadsFee,
      this.conversionFee,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.status,
      this.firstName,
      this.lastName,
      this.avatar,
      this.aboutMe,
      this.address,
      this.type,
      this.name,
      this.location,
      this.language,
      this.billingId,
      this.stripeConnectId,
      this.balance,
      this.emailVerifiedAt,
      this.bio,
      this.domain,
      this.state,
      this.zipCode,
      this.gender,
      this.dateOfBirth,
      this.approvedAt,
      this.availability,
      this.isTwoFactorEnabled,
      this.twoFactorSecret,
      this.points,
      this.deviceType,
      this.fcmToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    password = json['password'];
    workAtCompany = json['work_at_company'];
    country = json['country'];
    city = json['city'];
    qualifiedLeadsFee = json['qualified_leads_fee'];
    conversionFee = json['conversion_fee'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    status = json['status'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
    aboutMe = json['about_me'];
    address = json['address'];
    type = json['type'];
    name = json['name'];
    location = json['location'];
    language = json['language'];
    billingId = json['billing_id'];
    stripeConnectId = json['stripe_connect_id'];
    balance = json['balance'];
    emailVerifiedAt = json['email_verified_at'];
    bio = json['bio'];
    domain = json['domain'];
    state = json['state'];
    zipCode = json['zip_code'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    approvedAt = json['approved_at'];
    availability = json['availability'];
    isTwoFactorEnabled = json['is_two_factor_enabled'];
    twoFactorSecret = json['two_factor_secret'];
    points = json['points'];
    deviceType = json['device_type'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['username'] = username;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['password'] = password;
    data['work_at_company'] = workAtCompany;
    data['country'] = country;
    data['city'] = city;
    data['qualified_leads_fee'] = qualifiedLeadsFee;
    data['conversion_fee'] = conversionFee;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['status'] = status;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    data['about_me'] = aboutMe;
    data['address'] = address;
    data['type'] = type;
    data['name'] = name;
    data['location'] = location;
    data['language'] = language;
    data['billing_id'] = billingId;
    data['stripe_connect_id'] = stripeConnectId;
    data['balance'] = balance;
    data['email_verified_at'] = emailVerifiedAt;
    data['bio'] = bio;
    data['domain'] = domain;
    data['state'] = state;
    data['zip_code'] = zipCode;
    data['gender'] = gender;
    data['date_of_birth'] = dateOfBirth;
    data['approved_at'] = approvedAt;
    data['availability'] = availability;
    data['is_two_factor_enabled'] = isTwoFactorEnabled;
    data['two_factor_secret'] = twoFactorSecret;
    data['points'] = points;
    data['device_type'] = deviceType;
    data['fcm_token'] = fcmToken;
    return data;
  }
}
