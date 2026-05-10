import 'trade_model.dart';

class UserModel {
  final String? id;
  final String? username;
  final String? phoneNumber;
  final String? email;
  final String? password;
  final String? workAtCompany;
  final String? country;
  final String? city;
  final int? qualifiedLeadsFee;
  final int? conversionFee;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int? status;
  final String? firstName;
  final String? lastName;
  final String? avatar;
  final String? aboutMe;
  final String? address;
  final String? type;
  final String? name;
  final String? location;
  final String? language;
  final String? billingId;
  final String? stripeConnectId;
  final String? balance;
  final String? emailVerifiedAt;
  final String? bio;
  final String? domain;
  final String? state;
  final String? zipCode;
  final String? gender;
  final String? dateOfBirth;
  final String? approvedAt;
  final String? availability;
  final int? isTwoFactorEnabled;
  final String? twoFactorSecret;
  final int? points;
  final String? deviceType;
  final String? fcmToken;

  final List<TradeModel>? trades;

  final int? totalLeadsSent;
  final int? totalGiftsReceived;
  final int? totalConnectionFulfilled;

  UserModel({
    this.id,
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
    this.fcmToken,
    this.trades,
    this.totalLeadsSent,
    this.totalGiftsReceived,
    this.totalConnectionFulfilled,
  });

  factory UserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      password: json['password'],
      workAtCompany: json['work_at_company'],
      country: json['country'],
      city: json['city'],
      qualifiedLeadsFee: json['qualified_leads_fee'],
      conversionFee: json['conversion_fee'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      status: json['status'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
      aboutMe: json['about_me'],
      address: json['address'],
      type: json['type'],
      name: json['name'],
      location: json['location'],
      language: json['language'],
      billingId: json['billing_id'],
      stripeConnectId: json['stripe_connect_id'],
      balance: json['balance'],
      emailVerifiedAt: json['email_verified_at'],
      bio: json['bio'],
      domain: json['domain'],
      state: json['state'],
      zipCode: json['zip_code'],
      gender: json['gender'],
      dateOfBirth: json['date_of_birth'],
      approvedAt: json['approved_at'],
      availability: json['availability'],
      isTwoFactorEnabled:
          json['is_two_factor_enabled'],
      twoFactorSecret: json['two_factor_secret'],
      points: json['points'],
      deviceType: json['device_type'],
      fcmToken: json['fcm_token'],

      trades: json['trades'] != null
          ? List<TradeModel>.from(
              json['trades'].map(
                (x) => TradeModel.fromJson(x),
              ),
            )
          : [],

      totalLeadsSent: json['total_leads_sent'],
      totalGiftsReceived:
          json['total_gifts_received'],
      totalConnectionFulfilled:
          json['total_connection_fulfilled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'phone_number': phoneNumber,
      'email': email,
      'password': password,
      'work_at_company': workAtCompany,
      'country': country,
      'city': city,
      'qualified_leads_fee': qualifiedLeadsFee,
      'conversion_fee': conversionFee,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'status': status,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
      'about_me': aboutMe,
      'address': address,
      'type': type,
      'name': name,
      'location': location,
      'language': language,
      'billing_id': billingId,
      'stripe_connect_id': stripeConnectId,
      'balance': balance,
      'email_verified_at': emailVerifiedAt,
      'bio': bio,
      'domain': domain,
      'state': state,
      'zip_code': zipCode,
      'gender': gender,
      'date_of_birth': dateOfBirth,
      'approved_at': approvedAt,
      'availability': availability,
      'is_two_factor_enabled':
          isTwoFactorEnabled,
      'two_factor_secret': twoFactorSecret,
      'points': points,
      'device_type': deviceType,
      'fcm_token': fcmToken,

      'trades':
          trades?.map((e) => e.toJson()).toList(),

      'total_leads_sent': totalLeadsSent,
      'total_gifts_received':
          totalGiftsReceived,
      'total_connection_fulfilled':
          totalConnectionFulfilled,
    };
  }
}