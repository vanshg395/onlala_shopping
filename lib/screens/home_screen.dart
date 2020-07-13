import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:onlala_shopping/providers/wishlist.dart';
import 'package:onlala_shopping/screens/wishlist_screen.dart';
import 'package:onlala_shopping/widgets/banner.dart';
import 'package:provider/provider.dart';

import './cart_screen.dart';
import '../providers/auth.dart';
import '../providers/cart.dart';
import '../widgets/category_selector.dart';
import '../widgets/popular_products.dart';
import '../widgets/suggested_products.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _requestCount = 0;
  List<dynamic> _data = [];
  List<dynamic> _data1 = [];
  List<dynamic> _data2 = [];

  var baseUrl = "https://onlala-api.herokuapp.com/";

  // categories/show/categories/

  @override
  void initState() {
    super.initState();
    getData();
    getDataforCategories();
    getDataforPP();
  }

  Future<void> getData() async {
    setState(() {
      _requestCount++;
    });
    try {
      final url = baseUrl + 'banner/create/';
      final response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final resBody = json.decode(response.body);
        setState(() {
          _data = resBody['payload'];
        });
        // print(_data);
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      _requestCount--;
    });
  }

  Future<void> getDataforCategories() async {
    setState(() {
      _requestCount++;
    });
    try {
      final url = baseUrl + 'categories/show/categories/';
      final response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final resBody = json.decode(response.body);
        setState(() {
          _data1 = resBody["categories"];
        });
        // print(_data1);
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      _requestCount--;
    });
  }

  Future<void> getDataforPP() async {
    setState(() {
      _requestCount++;
    });
    try {
      final url = baseUrl + 'product/popular/buyer/';
      final response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final resBody = json.decode(response.body);
        for (var i = 0; i < resBody.length; i++) {
          var image = '';
          for (var j = 0; j < resBody[i]["pictures"].length; j++) {
            if (resBody[i]["pictures"][j]["image_name"] == "Primary Image") {
              image = resBody[i]["pictures"][j]["product_image"];
              break;
            }
          }
          var price = resBody[i]["sample_details"]["sample_cost"].toString();
          // sample_details
          _data2.add({
            "image": image,
            "product_name": resBody[i]["product"]["product_name"].toString(),
            "product_des": resBody[i]["product"]["product_description"],
            "price": price.toString(),
            "id": resBody[i]["product"]["id"]
          });
        }
        setState(() {
          _data2 = _data2;
        });
        // print(_data2);
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      _requestCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Onlala'),
        centerTitle: true,
        actions: <Widget>[
          if (Provider.of<Auth>(context).isAuth)
            IconButton(
              icon: Badge(
                showBadge: Provider.of<Wishlist>(context, listen: false)
                            .numberOfwishItems ==
                        0
                    ? false
                    : true,
                animationType: BadgeAnimationType.scale,
                animationDuration: Duration(milliseconds: 200),
                child: Icon(Icons.favorite),
                badgeContent: Text(
                  Provider.of<Wishlist>(context, listen: false)
                      .numberOfwishItems
                      .toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => WishlistScreen(),
                  ),
                );
              },
            ),
          if (Provider.of<Auth>(context).isAuth)
            IconButton(
              icon: Badge(
                showBadge: Provider.of<Cart>(context, listen: false)
                            .numberOfCartItems ==
                        0
                    ? false
                    : true,
                animationType: BadgeAnimationType.scale,
                animationDuration: Duration(milliseconds: 200),
                child: Icon(Icons.shopping_cart),
                badgeContent: Text(
                  Provider.of<Cart>(context, listen: false)
                      .numberOfCartItems
                      .toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => CartScreen(),
                  ),
                );
              },
            ),
        ],
        // bottom: BottomAppBar(child: ,),
      ),
      body: _requestCount != 0
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Theme.of(context).primaryColor,
                ),
              ),
            )
          : SafeArea(
              bottom: false,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      BannerWidget(_data),
                      CategorySelector(_data1),
                      Container(
                        height: 10,
                        width: double.infinity,
                        color: Theme.of(context).primaryColor.withOpacity(0.2),
                      ),
                      PopularProducts(_data2),
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
