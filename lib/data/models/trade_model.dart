class TradeModel {
  final String? id;
  final String? name;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? userId;

  TradeModel({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  factory TradeModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return TradeModel(
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