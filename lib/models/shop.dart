import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/models/item.dart';

class Shop extends ChangeNotifier {
  final List<Item> _product = [
    Item(
      imagePath: 'lib/images/banana.png',
      name: 'Banana',
      price: '4.23',
      color: Colors.yellow.shade100,
      btnColor: Colors.yellow.shade700,
    ),
    Item(
      imagePath: 'lib/images/avocado.png',
      name: 'Avocado',
      price: '7.30',
      color: Colors.green.shade200,
      btnColor: Colors.green.shade500,
    ),
    Item(
      imagePath: 'lib/images/chicken.png',
      name: 'Chicken',
      price: '14.23',
      color: Colors.redAccent.shade100,
      btnColor: Colors.redAccent.shade400,
    ),
    Item(
      imagePath: 'lib/images/water.png',
      name: 'Water Bottle',
      price: '1.23',
      color: Colors.blue.shade100,
      btnColor: Colors.blue.shade500,
    ),
  ];

  List<Item> _cart = [];

  List<Item> get product => _product;
  List<Item> get cart => _cart;

  void addToCart(Item item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Item item) {
    _cart.remove(item);
    notifyListeners();
  }

  String getCartValue() {
    double price = 0.0;
    for (var element in _cart) {
      double? amt = double.tryParse(element.price);
      price = price + amt!;
    }
    return "\$${price.toStringAsFixed(2)}";
  }
}
