class ConnectionRequestStatusModel {
  String? id;
  String? tradeId;
  String? location;
  String? city;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;

  ConnectionRequestStatusModel(
      {this.id,
      this.tradeId,
      this.location,
      this.city,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt});

  ConnectionRequestStatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tradeId = json['trade_id'];
    location = json['location'];
    city = json['city'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['trade_id'] = tradeId;
    data['location'] = location;
    data['city'] = city;
    data['description'] = description;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
