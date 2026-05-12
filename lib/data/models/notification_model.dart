class NotificationModel {
  String? id;
  String? senderId;
  String? receiverId;
  String? entityId;
  String? createdAt;
  Sender? sender;
  Receiver? receiver;
  NotificationEvent? notificationEvent;

  NotificationModel(
      {this.id,
      this.senderId,
      this.receiverId,
      this.entityId,
      this.createdAt,
      this.sender,
      this.receiver,
      this.notificationEvent});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    entityId = json['entity_id'];
    createdAt = json['created_at'];
    sender =
        json['sender'] != null ? Sender.fromJson(json['sender']) : null;
    receiver = json['receiver'] != null
        ?  Receiver.fromJson(json['receiver'])
        : null;
    notificationEvent = json['notification_event'] != null
        ?  NotificationEvent.fromJson(json['notification_event'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['entity_id'] = entityId;
    data['created_at'] = createdAt;
    if (sender != null) {
      data['sender'] = sender!.toJson();
    }
    if (receiver != null) {
      data['receiver'] = receiver!.toJson();
    }
    if (notificationEvent != null) {
      data['notification_event'] = notificationEvent!.toJson();
    }
    return data;
  }
}

class Sender {
  String? id;
  String? name;
  String? email;
  String? avatar;

  Sender({this.id, this.name, this.email, this.avatar});

  Sender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    return data;
  }
}

class Receiver {
  String? id;
  String? name;
  String? email;
  String? avatar;

  Receiver({this.id, this.name, this.email, this.avatar});

  Receiver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    return data;
  }
}

class NotificationEvent {
  String? id;
  String? type;
  String? text;

  NotificationEvent({this.id, this.type, this.text});

  NotificationEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['type'] = type;
    data['text'] = text;
    return data;
  }
}
