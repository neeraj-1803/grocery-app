import 'package:flutter/material.dart';

class Item {
  String imagePath;
  String name;
  String price;
  Color color;
  Color btnColor;

  Item({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.color,
    required this.btnColor,
  });

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  Color get _color => color;
  Color get _btnColor => btnColor;
}
