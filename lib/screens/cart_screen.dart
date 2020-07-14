import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_card.dart';
import '../providers/cart.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void refresh() {
    setState(() {});
  }

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
              ...Provider.of<Cart>(context, listen: false)
                  .items
                  .map(
                    (e) => CartCard(e.name, e.description, e.price,
                        e.quantity.toString(), e.productId, refresh),
                  )
                  .toList(),
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
