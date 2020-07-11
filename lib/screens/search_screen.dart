import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Badge(
              child: Icon(Icons.shopping_cart),
              badgeContent: Text('2'),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
