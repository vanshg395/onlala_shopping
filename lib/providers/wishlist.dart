import 'package:flutter/material.dart';

class Wishlist with ChangeNotifier {
  List<dynamic> _items;

  List<dynamic> get items {
    return _items;
  }

  int get numberOfCartItems {
    return items.length;
  }

  Future<void> addItem() async {}
  Future<void> removeItem() async {}
  Future<void> getItems() async {}
}
