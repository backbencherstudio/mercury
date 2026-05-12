class GiftCardModel {
  String? id;
  String? userId;
  String? giftCardId;
  String? sentAt;
  User? user;
  GiftCard? giftCard;

  GiftCardModel(
      {this.id,
      this.userId,
      this.giftCardId,
      this.sentAt,
      this.user,
      this.giftCard});

  GiftCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    giftCardId = json['gift_card_id'];
    sentAt = json['sent_at'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    giftCard = json['giftCard'] != null
        ?  GiftCard.fromJson(json['giftCard'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['user_id'] = userId;
    data['gift_card_id'] = giftCardId;
    data['sent_at'] = sentAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (giftCard != null) {
      data['giftCard'] = giftCard!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? email;

  User({this.id, this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

class GiftCard {
  String? id;
  String? name;
  String? createdAt;

  GiftCard({this.id, this.name, this.createdAt});

  GiftCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    return data;
  }
}
