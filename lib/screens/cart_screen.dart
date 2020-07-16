import 'package:flutter/material.dart';
import 'package:onlala_shopping/screens/place_order_screen.dart';
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
              ...Provider.of<Cart>(context, listen: false)
                  .items
                  .map(
                    (e) => CartCard(
                      e.name,
                      e.description,
                      e.price,
                      e.quantity.toString(),
                      e.productId,
                      refresh,
                      e.image,
                    ),
                  )
                  .toList(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          Provider.of<Cart>(context, listen: false).numberOfCartItems > 0
              ? GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 70,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Place Sample Order',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => PlaceOrderScreen(
                            Provider.of<Cart>(context, listen: false)
                                .items[0]
                                .cartId),
                      ),
                    );
                  },
                )
              : null,
    );
  }
}
