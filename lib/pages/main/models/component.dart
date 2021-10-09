class Component {
  Component({
      this.title, 
      this.type, 
      this.items,});

  Component.fromJson(dynamic json) {
    title = json['title'];
    type = json['type'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }
  String? title;
  String? type;
  List<Items>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['type'] = type;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Items {
  Items({
      this.id, 
      this.title, 
      this.icon, 
      this.code,});

  Items.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
    code = json['code'];
  }
  int? id;
  String? title;
  String? icon;
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['icon'] = icon;
    map['code'] = code;
    return map;
  }

}