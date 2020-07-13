import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;

class AllProductsScreen extends StatefulWidget {
  @override
  _AllProductsScreenState createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  List<dynamic> _displayedItems = [];
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  int offset = 0;
  int limit = 9;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    // setState(() {
    //   _isLoading = true;
    // });
    final url = 'https://onlala-api.herokuapp.com/product/showByPagination/';
    print('$offset     $limit');
    try {
      final response = await http.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode(
          {
            'offset': offset,
            'limit': limit,
          },
        ),
      );
      print(response.statusCode);
      List<dynamic> _newItems = [];
      if (response.statusCode == 200) {
        final resBody = json.decode(response.body)['payload']['data'];
        print(resBody);
        _newItems = resBody;
        if (_newItems.length > 0) {
          limit += 10;
          offset += 10;
          setState(() {
            _displayedItems = _newItems;
          });
        }
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
        title: Text('All Products'),
        centerTitle: true,
      ),
      body: Container(
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            // if (!_isLoading &&
            //     scrollInfo.metrics.pixels ==
            //         scrollInfo.metrics.maxScrollExtent) {
            //   _getMoreData();
            //   setState(() {
            //     _isLoading = true;
            //   });
            // }
            if (!_isLoading &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              print('hey');
              getData();
              setState(() {
                _isLoading = true;
              });
            }
          },
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  controller: _scrollController,
                  children: _displayedItems
                      .map(
                        (e) => ProductCard(
                          e['product_name'],
                          e['product_description'],
                          e['product_image'][0]['product_image'],
                          '??',
                          e['id'],
                        ),
                      )
                      .toList(),
                ),
              ),
              if (_isLoading)
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String description;
  final String url;
  final String price;
  final String id;

  ProductCard(
      this.productName, this.description, this.url, this.price, this.id);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: 300,
        height: 100,
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
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(url),
                  fit: BoxFit.cover,
                ), // ENTER IMAGE LINK FOR CATEGORY
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(),
                    ),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(),
                    ),
                    Text(
                      '€ $price',
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (ctx) => ProductDetailsScreen(id, productName, url),
        //   ),
        // );
      },
    );
  }
}
