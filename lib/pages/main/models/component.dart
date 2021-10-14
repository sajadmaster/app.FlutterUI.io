import 'package:flutter/cupertino.dart';

class Component {
  String title;
  String type;
  List<Items> items;

  Component({required this.title, required this.type, required this.items});

  @override
  String toString() {
    return '$title';
  }
}

class Items {
  int? id;
  WidgetType? type;
  Items? child;
  String? title;
  String? icon;
  Widget? code;



  Items({
    this.id,
    this.type,
    this.child,
    this.title,
    this.icon,
    this.code,
  });

  @override
  String toString() {
    return "code : " + code.toString();
  }
}

enum WidgetType { single, multi, silver, none, main }
