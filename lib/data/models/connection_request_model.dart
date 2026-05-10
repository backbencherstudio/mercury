class ConnectionRequestModel {
  String? id;
  String? trade;
  String? location;
  String? status;
  String? timeAgo;
  bool? alreadyResponded;

  ConnectionRequestModel(
      {this.id,
      this.trade,
      this.location,
      this.status,
      this.timeAgo,
      this.alreadyResponded});

  ConnectionRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trade = json['trade'];
    location = json['location'];
    status = json['status'];
    timeAgo = json['time_ago'];
    alreadyResponded = json['already_responded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['trade'] = trade;
    data['location'] = location;
    data['status'] = status;
    data['time_ago'] = timeAgo;
    data['already_responded'] = alreadyResponded;
    return data;
  }
}
