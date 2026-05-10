class ConnectionRequestDetailModel {
  String? id;
  String? tradeId;
  String? location;
  String? city;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;
  Trade? trade;

  ConnectionRequestDetailModel({
    this.id,
    this.tradeId,
    this.location,
    this.city,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.trade,
  });

  ConnectionRequestDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tradeId = json['trade_id'];
    location = json['location'];
    city = json['city'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    trade = json['trade'] != null ? Trade.fromJson(json['trade']) : null;
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
    if (trade != null) {
      data['trade'] = trade!.toJson();
    }
    return data;
  }
}

class Trade {
  String? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? userId;

  Trade({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  Trade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['userId'] = userId;
    return data;
  }
}
