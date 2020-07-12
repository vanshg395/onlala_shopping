import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:onlala_shopping/widgets/category_products.dart';
import 'package:onlala_shopping/widgets/search_widget.dart';
import 'package:http/http.dart' as http;
import '../widgets/common_field.dart';

class SubCatProdPaginatedScreen extends StatefulWidget {
  final String subCatName;
  final String id;
  SubCatProdPaginatedScreen(this.subCatName, this.id);
  @override
  _SubCatProdPaginatedScreenState createState() =>
      _SubCatProdPaginatedScreenState();
}

class _SubCatProdPaginatedScreenState extends State<SubCatProdPaginatedScreen> {
  List<dynamic> _data = [];

  bool _isLoading = false;
  bool _isEmpty = false;

  @override
  void initState() {
    super.initState();
    _products();
  }

  var baseUrl = "https://onlala-api.herokuapp.com/";

  // categories/show/categories/

  Future<void> _products() async {
    // https://onlala-api.herokuapp.com/product/search/?search=
    setState(() {
      _isLoading = true;
    });
    try {
      final url = baseUrl + 'product/showByPagination/subcategory/';
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            "sub_category_id": [widget.id]
          }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        _data = [];
        final resBody = json.decode(response.body);
        // print(resBody[0]);
        for (var i = 0; i < resBody.length; i++) {
          var image = '';
          for (var j = 0; j < resBody[i]["product"]["pictures"].length; j++) {
            if (resBody[i]["product"]["pictures"][j]["image_name"] ==
                "Primary Image") {
              image = resBody[i]["product"]["pictures"][j]["product_image"];
              break;
            }
          }
          print(image);
          var price = resBody[i]["sample_details"]["sample_cost"].toString();
          // sample_details
          _data.add({
            "image": image,
            "product_name": resBody[i]["product"]["product_name"].toString(),
            "product_des": resBody[i]["product"]["product_description"],
            "price": price.toString(),
            "id": resBody[i]["product"]["id"]
          });
        }
        // print(_data);
      } else if (response.statusCode == 406) {
        setState(() {
          _isEmpty = true;
        });
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subCatName),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    !_isEmpty
                        ? CategoryProducts(_data)
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              "No Products",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            )),
                          ),
                  ],
                ),
              ),
            ),
    );
  }
}
