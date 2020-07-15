import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlala_shopping/widgets/common_button.dart';
import 'package:onlala_shopping/widgets/common_field.dart';
import 'package:provider/provider.dart';

import './bulk_inquiry_screen.dart';
import '../widgets/image_slider.dart';
import '../providers/wishlist.dart';
import '../providers/auth.dart';
import '../providers/cart.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();

  final String id;
  final String name;
  final String url;

  ProductDetailsScreen(this.id, this.name, this.url);
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;
  List<dynamic> _data = [];
  List<dynamic> _data1 = [];
  CartItem cart;
  bool _cartItemExists = false;
  int quantity = 1;
  Map<String, String> _productEnquiry = {"message": "", "product": ""};
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
      final url = baseUrl + 'product/productDetail/?product_id=${widget.id}';
      final response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final resBody = json.decode(response.body);

        cart = Provider.of<Cart>(context, listen: false).getifExist(widget.id);
        _data = resBody['payload'];
        print(cart.quantity);
        if (cart.quantity > 0) {
          setState(() {
            _cartItemExists = true;
          });
        }
      }
    } catch (e) {
      print(e);
    }
    getRelatedproducts();
  }

  Future<void> getRelatedproducts() async {
    try {
      final url = baseUrl + 'product/related/show/';
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({"product_id": widget.id}));
      print(response.statusCode);
      if (response.statusCode == 200) {
        final resBody = json.decode(response.body);
        setState(() {
          _data1 = resBody['payload'];
        });
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    try {
      Navigator.of(context).pop();
      showDialog(
        barrierDismissible: false,
        context: context,
        child: Dialog(
          child: Container(
            height: 100,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
      await Provider.of<Cart>(context, listen: false).addItem(
        Provider.of<Auth>(context, listen: false).token,
        widget.id,
        quantity,
        widget.name,
      );
      Navigator.of(context).pop();
      setState(() {
        _cartItemExists = true;
      });
    } catch (e) {
      await showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Error'),
          content: Text('Something went wrong. Please try again later.'),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _submitQuery() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    _productEnquiry["product"] = widget.id;
    try {
      final url = baseUrl + 'message/user/create/';
      final response = await http.post(url,
          headers: {
            'Authorization': Provider.of<Auth>(context, listen: false).token,
            'Content-Type': 'application/json'
          },
          body: json.encode(_productEnquiry));
      print(response.statusCode);
      if (response.statusCode == 201) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _addToCart() async {
    await showDialog(
      context: context,
      child: Dialog(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Add to Cart',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: CommonField(
                    bgColor: Colors.white,
                    borderColor: Colors.grey,
                    borderRadius: 10,
                    placeholder: 'Quantity',
                    keyboardType: TextInputType.numberWithOptions(
                      signed: false,
                      decimal: false,
                    ),
                    validator: (value) {
                      if (value == '') {
                        return 'This field is required';
                      }
                    },
                    onSaved: (value) {
                      quantity = int.parse(value);
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: CommonButton(
                    title: 'Add',
                    onPressed: _submit,
                    bgColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColor,
                    borderRadius: 10,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _raiseGeneralInquiry() async {
    await showDialog(
      context: context,
      child: StatefulBuilder(
        builder: (ctx, setState) => Dialog(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      'General Inquiry',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: CommonField(
                      bgColor: Colors.white,
                      borderColor: Colors.grey,
                      borderRadius: 10,
                      placeholder: 'Enter your Message',
                      maxLines: 5,
                      topPadding: 20,
                      validator: (value) {
                        if (value == '') {
                          return 'This field is required';
                        }
                      },
                      onSaved: (value) {
                        _productEnquiry["message"] = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: _isLoading
                        ? CircularProgressIndicator()
                        : CommonButton(
                            title: 'Submit',
                            onPressed: () async {
                              setState(() {
                                _isLoading = true;
                              });
                              await _submitQuery();
                              setState(() {
                                _isLoading = false;
                              });
                            },
                            bgColor: Theme.of(context).primaryColor,
                            borderColor: Theme.of(context).primaryColor,
                            borderRadius: 10,
                            fontSize: 18,
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: <Widget>[
          if (Provider.of<Auth>(context, listen: false).isAuth)
            IconButton(
              icon: Icon(
                Provider.of<Wishlist>(context, listen: false)
                            .items
                            .where((element) => element.productId == widget.id)
                            .length ==
                        1
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              onPressed: () async {
                if (Provider.of<Wishlist>(context, listen: false)
                        .items
                        .where((element) => element.productId == widget.id)
                        .length ==
                    1) {
                  await Provider.of<Wishlist>(context, listen: false)
                      .removeItem(
                          Provider.of<Auth>(context, listen: false).token,
                          widget.id,
                          widget.name);
                  setState(() {});
                } else {
                  await Provider.of<Wishlist>(context, listen: false).addItem(
                    Provider.of<Auth>(context, listen: false).token,
                    widget.id,
                    widget.name,
                    _data[0]["product"]["product_description"],
                    _data[0]["bulkorder_details"]["bulk_order_price"]
                        .toString(),
                  );
                  setState(() {});
                }
              },
            ),
        ],
      ),
      body: _isLoading
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ImageSlider(_data[0]["product"]["pictures"],
                          _data[0]["product"]["videos"]),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 5),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '\€ ${_data[0]["bulkorder_details"]["bulk_order_price"]} ${_data[0]["bulkorder_details"]["bulk_order_price_type"]}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(),
                                children: [
                                  TextSpan(
                                    text: 'Minimum Order: ',
                                  ),
                                  TextSpan(
                                    text:
                                        '${_data[0]["product"]["minimum_order_quantity"].toString()} ${_data[0]["bulkorder_details"]["bulk_order_price_unit"]}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 5),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 5),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(),
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 5),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 5),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
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
                                _data[0]["product"]["tech_transfer_investment"]
                                    ? 'Yes'
                                    : 'No',
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.2),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
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
      bottomNavigationBar: !Provider.of<Auth>(context, listen: false).isAuth
          ? null
          : Container(
              height: 60,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
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
                      onTap: _raiseGeneralInquiry,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(2, 5, 2, 0),
                        color: !_cartItemExists
                            ? Theme.of(context).primaryColor
                            : Colors.green,
                        alignment: Alignment.center,
                        child: !_cartItemExists
                            ? Text(
                                'Add to Cart',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              )
                            : Text(
                                'Added to Cart',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                      ),
                      onTap: !_cartItemExists ? _addToCart : () {},
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
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
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => BulkInquiryScreen(
                              _data[0]["product"]["product_name"],
                              widget.id,
                              _data[0]["product"]["product_description"],
                              _data[0]["product"]["bulk_order_price"],
                              widget.url,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
