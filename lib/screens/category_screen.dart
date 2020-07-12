import 'dart:convert';

import 'package:flutter/material.dart';

import '../widgets/subcat_widget.dart';
import 'package:http/http.dart' as http;

class SubCategorySelectScreen extends StatefulWidget {
  @override
  _SubCategorySelectScreenState createState() =>
      _SubCategorySelectScreenState();

  final String cat_id;
  final String catName;

  SubCategorySelectScreen(this.cat_id, this.catName);
}

class _SubCategorySelectScreenState extends State<SubCategorySelectScreen> {
  List<dynamic> subCats = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  var baseUrl = "https://onlala-api.herokuapp.com/";

  Future<void> getData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final url = baseUrl + 'subcategories/fromCategory/';
      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            'category_ids': [widget.cat_id]
          }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        final resBody = json.decode(response.body);
        setState(() {
          subCats = resBody['payload'];
        });
        print(subCats);
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
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        title: Text(
          'Select Sub-Category',
          // style: Theme.of(context).primaryTextTheme.subtitle.copyWith(
          //       color: Colors.white,
          //       letterSpacing: 2,
          //       fontWeight: FontWeight.w500,
          //     ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Theme.of(context).primaryColor,
                ),
              ),
            )
          : Container(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 4 / 5,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                padding: EdgeInsets.all(15),
                children: subCats
                    .map(
                      (subcat) => SubcategoryDetailCard(
                          name: subcat['sub_category_file'][0]["sub_category"]
                              ["sub_categories"],
                          image: subcat['sub_category_file'][0]["image"],
                          onTap: () {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                            // int count = 0;
                            // Navigator.popUntil(context, (route) {
                            //   return count++ == 2;
                            // });
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     // builder: (ctx) => ProductUploadScreen(
                            //     //   deptName,
                            //     //   catName,
                            //     //   subcat['sub_category']['sub_categories'],
                            //     //   subcat['sub_category']['id'],
                            //     // ),
                            //   ),
                            // );
                          }),
                    )
                    .toList(),
              ),
            ),
    );
  }
}
