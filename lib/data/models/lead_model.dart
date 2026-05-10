class LeadModel {
  final String? id;
  final String? leadNo;
  final String? address;
  final String? name;
  final String? phone;
  final String? notes;
  final String? status;
  final String? scheduledTime;
  final bool? collected;
  final String? createdAt;
  final String? updatedAt;
  final String? tradeId;
  final String? userId;

  final Trade? trade;
  final List<LeadFile>? files;
  final LeadUser? user;

  LeadModel({
    this.id,
    this.leadNo,
    this.address,
    this.name,
    this.phone,
    this.notes,
    this.status,
    this.scheduledTime,
    this.collected,
    this.createdAt,
    this.updatedAt,
    this.tradeId,
    this.userId,
    this.trade,
    this.files,
    this.user,
  });

  factory LeadModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return LeadModel(
      id: json['id'],
      leadNo: json['lead_no'],
      address: json['address'],
      name: json['name'],
      phone: json['phone'],
      notes: json['notes'],
      status: json['status'],
      scheduledTime: json['scheduled_time'],
      collected: json['collected'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      tradeId: json['trade_id'],
      userId: json['user_id'],

      trade: json['trade'] != null
          ? Trade.fromJson(json['trade'])
          : null,

      files: json['files'] != null
          ? List<LeadFile>.from(
              json['files'].map(
                (x) => LeadFile.fromJson(x),
              ),
            )
          : [],

      user: json['user'] != null
          ? LeadUser.fromJson(json['user'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lead_no': leadNo,
      'address': address,
      'name': name,
      'phone': phone,
      'notes': notes,
      'status': status,
      'scheduled_time': scheduledTime,
      'collected': collected,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'trade_id': tradeId,
      'user_id': userId,
      'trade': trade?.toJson(),
      'files': files?.map((e) => e.toJson()).toList(),
      'user': user?.toJson(),
    };
  }
}

/// 🔥 TRADE
class Trade {
  final String? id;
  final String? name;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? userId;

  Trade({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  factory Trade.fromJson(Map<String, dynamic> json) {
    return Trade(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'userId': userId,
    };
  }
}

/// 🔥 FILE MODEL
class LeadFile {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? name;
  final String? type;
  final String? path;
  final String? leadId;
  final String? connectionRequestId;

  LeadFile({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
    this.type,
    this.path,
    this.leadId,
    this.connectionRequestId,
  });

  factory LeadFile.fromJson(
    Map<String, dynamic> json,
  ) {
    return LeadFile(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      name: json['name'],
      type: json['type'],
      path: json['path'],
      leadId: json['lead_id'],
      connectionRequestId:
          json['connectionRequestId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'name': name,
      'type': type,
      'path': path,
      'lead_id': leadId,
      'connectionRequestId':
          connectionRequestId,
    };
  }
}

/// 🔥 USER MODEL
class LeadUser {
  final String? name;
  final String? email;

  LeadUser({
    this.name,
    this.email,
  });

  factory LeadUser.fromJson(
    Map<String, dynamic> json,
  ) {
    return LeadUser(
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}