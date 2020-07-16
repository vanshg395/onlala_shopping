import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String id;

  OrderDetailsScreen(this.id);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  List<dynamic> _orderData = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final url =
        'https://onlala-api.herokuapp.com/order/items/?order_id=${widget.id}';
    final response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader:
            Provider.of<Auth>(context, listen: false).token,
      },
    );
    if (response.statusCode == 200) {
      final resBody = json.decode(response.body);
      setState(() {
        _orderData = resBody['payload'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Items'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              if (_orderData.length > 0)
                ..._orderData[0]['order_items']
                    .map(
                      (item) => Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              spreadRadius: 2,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 30),
                          title: Text(item['item_name']['product_name']),
                          trailing: Text('x${item['quantity']}'),
                        ),
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
    );
  }
}
