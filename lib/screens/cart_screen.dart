import 'package:flutter/material.dart';

import '../widgets/cart_card.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              //
              CartCard(),
              CartCard(),
              CartCard(),
              //
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
