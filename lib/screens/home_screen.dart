import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

import '../widgets/image_slider.dart';
import '../widgets/category_selector.dart';
import '../widgets/popular_products.dart';
import '../widgets/suggested_products.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Onlala'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Badge(
              animationType: BadgeAnimationType.scale,
              animationDuration: Duration(milliseconds: 200),
              child: Icon(Icons.shopping_cart),
              badgeContent: Text(
                '2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            onPressed: () {},
          ),
        ],
        // bottom: BottomAppBar(child: ,),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ImageSlider(),
                CategorySelector(),
                Container(
                  height: 10,
                  width: double.infinity,
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                ),
                PopularProducts(),
                Container(
                  height: 10,
                  width: double.infinity,
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                ),
                SuggestedProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
