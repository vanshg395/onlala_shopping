import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items {
    return _items;
  }

  int get numberOfCartItems {
    return items.length;
  }

  Future<void> addItem() async {}
  Future<void> removeItem() async {}
  Future<void> getItems() async {}
}

class CartItem {
  final String name;
  CartItem({this.name});

  // ADD MORE ATTRIBUTES AS PER CARTITEM DETAILS, COZ IDK.
}
