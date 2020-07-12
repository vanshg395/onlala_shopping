import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/image_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  
  
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();


  final String id;
  final String name;

  ProductDetailsScreen(@required this.id, @required this.name);
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool _isLoading = false;
  List<dynamic> _data = [];
  List<dynamic> _data1 = [];


  @override
  void initState() {
    super.initState();
    getData();
    getRelatedproducts();
  }

  var baseUrl = "https://onlala-api.herokuapp.com/";


  Future<void> getData() async {
      setState(() {
        _isLoading = true;
      });
      try {
        final url = baseUrl + 'product/productDetail/?product_id=${widget.id}';
        final response = await http.get(url);
        print(response.statusCode);
        if (response.statusCode == 200) {
          final resBody = json.decode(response.body);
          setState(() {
            _data = resBody['payload'];
          });
        }
      } catch (e) {
        print(e);
      }
    }

    Future<void> getRelatedproducts() async{
      try {
        final url = baseUrl + 'product/related/show/';
        final response = await http.post(url,
        headers: {
          'Content-Type':'application/json'
        },
        body: json.encode({
          "product_id" : widget.id
        }));
        print(response.statusCode);
        if (response.statusCode == 200) {
          final resBody = json.decode(response.body);
          setState(() {
            _data1 = resBody['payload'];
          });
        }
        print(_data1);


      } catch (e) {
        print(e);
      }
      setState(() {
        _isLoading = false;
      });
    }


  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body:_isLoading ?
      Center(
        child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Theme.of(context).primaryColor,
                ),
              ),
            ):  SafeArea(
        bottom: false,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ImageSlider(_data[0]["product"]["pictures"],_data[0]["product"]["videos"]),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  padding: EdgeInsets.all(20),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _data[0]["product"]["product_name"],
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '\€ ${_data[0]["bulkorder_details"]["bulk_order_price"]} ${_data[0]["bulkorder_details"]["bulk_order_price_type"]}',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          style:
                              Theme.of(context).textTheme.subtitle1.copyWith(),
                          children: [
                            TextSpan(
                              text: 'Minimum Order: ',
                            ),
                            TextSpan(
                              text: '${_data[0]["product"]["minimum_order_quantity"].toString()} ${_data[0]["bulkorder_details"]["bulk_order_price_unit"]}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  padding: EdgeInsets.all(20),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Sample Details',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Sample Price',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '€ ${_data[0]["sample_details"]["sample_cost"].toString()} ',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Order Lead Time',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '${_data[0]["sample_details"]["sample_from_time_range"]} - ${_data[0]["sample_details"]["sample_to_time_range"]} Days',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'HS Code',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '${_data[0]["sample_details"]["hs_code"]}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sample Dimension (Courier)',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '${_data[0]["sample_details"]["sample_dimension_length"]} X ${_data[0]["sample_details"]["sample_dimension_breadth"]} X ${_data[0]["sample_details"]["sample_dimension_height"]} ${_data[0]["sample_details"]["sample_dimension_unit"]}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sample Weight (Courier)',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '${_data[0]["sample_details"]["sample_weight"]} ${_data[0]["sample_details"]["sample_weight_unit"]}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sample Policy',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '${_data[0]["sample_details"]["sample_policy"]}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  padding: EdgeInsets.all(20),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Quick Details',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          style:
                              Theme.of(context).textTheme.bodyText1.copyWith(),
                          children: [
                            TextSpan(
                              text: 'Model Number: ',
                            ),
                            TextSpan(
                              text: '${_data[0]["product"]["model_no"]}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${_data[0]["product"]["product_description"]}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  padding: EdgeInsets.all(20),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Bulk Details',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Price in \€ (Negotiable)',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '${_data[0]["bulkorder_details"]["bulk_order_price"]}/${_data[0]["bulkorder_details"]["bulk_order_price_unit"]} ${_data[0]["bulkorder_details"]["bulk_order_price_type"]}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Order Lead Time',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '${_data[0]["bulkorder_details"]["bulk_order_from_time_range"]} to ${_data[0]["bulkorder_details"]["bulk_order_to_time_range"]} Days',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Units Per Carton',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '${_data[0]["product"]["quantity_per_carton"]}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Cart Dimension',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '${_data[0]["carton_details"]["carton_dimension_length"]} x ${_data[0]["carton_details"]["carton_dimension_breadth"]} x ${_data[0]["carton_details"]["carton_dimension_height"]} ${_data[0]["carton_details"]["carton_dimension_unit"]}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sample Weight',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '${_data[0]["carton_details"]["carton_weight"]} ${_data[0]["carton_details"]["carton_weight_unit"]}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  padding: EdgeInsets.all(20),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Payment Details',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Payment Method',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '${_data[0]["product"]["payment_method"]}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Port',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          '${_data[0]["bulkorder_details"]["bulk_order_port"]}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Tech Transfer',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Theme.of(context).canvasColor,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          _data[0]["product"]["tech_transfer_investment"] ? 'Yes' : 'No',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        spreadRadius: 2,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Disclaimer',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Excluding Shipping and Custom charges (Shipping and Custom charges will be calculated on checkout)',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 5, 2, 0),
                color: Theme.of(context).primaryColor,
                alignment: Alignment.center,
                child: Text(
                  'General Inquiry',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(2, 5, 2, 0),
                color: Theme.of(context).primaryColor,
                alignment: Alignment.center,
                child: Text(
                  'Add to Cart',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(2, 5, 0, 0),
                color: Theme.of(context).primaryColor,
                alignment: Alignment.center,
                child: Text(
                  'Bulk Inquiry',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
