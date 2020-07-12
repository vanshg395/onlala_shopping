import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        centerTitle: true,
        actions: <Widget>[
          if (Provider.of<Auth>(context).isAuth)
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
      ),
      body: Container(),
    );
  }
}
