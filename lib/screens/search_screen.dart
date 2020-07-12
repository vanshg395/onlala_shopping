import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

import '../widgets/common_field.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController(text: '');

  Future<void> _search(String searchKey) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: CommonField(
                      controller: _searchController,
                      bgColor: Colors.white,
                      borderColor: Colors.grey,
                      borderRadius: 10,
                      placeholder: 'Enter Keywords',
                      keyboardType: TextInputType.numberWithOptions(
                        signed: false,
                        decimal: true,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _search(_searchController.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
