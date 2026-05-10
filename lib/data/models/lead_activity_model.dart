class LeadActivityModel {
  Submitted? submitted;
  Submitted? qualified;
  Submitted? conversions;

  LeadActivityModel({this.submitted, this.qualified, this.conversions});

  LeadActivityModel.fromJson(Map<String, dynamic> json) {
    submitted = json['submitted'] != null
        ? Submitted.fromJson(json['submitted'])
        : null;
    qualified = json['qualified'] != null
        ? Submitted.fromJson(json['qualified'])
        : null;
    conversions = json['conversions'] != null
        ? Submitted.fromJson(json['conversions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    if (submitted != null) {
      data['submitted'] = submitted!.toJson();
    }
    if (qualified != null) {
      data['qualified'] = qualified!.toJson();
    }
    if (conversions != null) {
      data['conversions'] = conversions!.toJson();
    }
    return data;
  }
}

class Submitted {
  int? count;
  List<Items>? items;

  Submitted({this.count, this.items});

  Submitted.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['count'] = count;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? address;
  String? createdAt;

  Items({this.id, this.address, this.createdAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['address'] = address;
    data['created_at'] = createdAt;
    return data;
  }
}
