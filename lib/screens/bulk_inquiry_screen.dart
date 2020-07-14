import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:onlala_shopping/providers/auth.dart';
import 'package:provider/provider.dart';

import '../widgets/common_field.dart';
import '../widgets/common_dropdown.dart';
import '../widgets/common_button.dart';
import 'package:http/http.dart' as http;

class BulkInquiryScreen extends StatefulWidget {
  @override
  _BulkInquiryScreenState createState() => _BulkInquiryScreenState();

  final String productName;
  final String description;
  final String price;
  final String url;

  BulkInquiryScreen(this.productName, this.description, this.price, this.url);
}

class _BulkInquiryScreenState extends State<BulkInquiryScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _userTypeChoice;
  String _deliveryTermsChoice;
  String _paymentTermsChoice;
  bool _callOurExec = false;
  bool _reportsQCStand = false;
  bool _isLoading = false;
  int _quantity = 1;
  var baseUrl = "https://onlala-api.herokuapp.com/";

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      final url = baseUrl + 'query/add/';
      final response = await http.post(url,
          headers: {
            'Authorization': Provider.of<Auth>(context, listen: false).token,
            'Content-Type': 'application/json'
          },
          body: json.encode({
            "type_of_user": _userTypeChoice,
            "technical_specifications": "This product is delicate",
            "payment_terms": "Cash",
            "additional_message": "jbfnslkjgnlk",
            "product": "b18e0f88-7d4a-440a-898c-b9b822739e6f",
            "quantity": "78",
            "terms_of_delivery": "Factory",
            "call_our_excutive": "0",
            "reports_qc_stand": "0"
          }));
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 202) {}
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
        title: Text('Bulk Order Inquiry'),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                PopularProductCard(
                  widget.productName,
                  widget.description,
                  widget.price,
                  widget.url,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Type of User',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: MultilineDropdownButtonFormField(
                    value: _userTypeChoice,
                    onChanged: (value) {
                      setState(() {
                        _userTypeChoice = value;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Importer',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: 'Importer',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'Wholesaler',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: 'Wholeseller',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'Distributor',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: 'Distributor',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'Own Brand',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: 'Own Brand',
                      ),
                    ],
                    iconSize: 40,
                    decoration: InputDecoration(
                      // counterText: controller.text.length.toString(),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                      ),
                      errorStyle: TextStyle(color: Colors.red[200]),
                      alignLabelWithHint: true,
                      hintText: '',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                      // suffixIcon: Padding(
                      //   padding: const EdgeInsetsDirectional.only(end: 15, start: 10),
                      //   child: Icon(Icons.arrow_drop_down),
                      // ),
                      suffixStyle: TextStyle(fontSize: 16),
                      contentPadding: EdgeInsets.only(
                        left: 30,
                        top: 10,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Quantity',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: CommonField(
                    bgColor: Colors.white,
                    borderColor: Colors.grey,
                    borderRadius: 10,
                    placeholder: 'XX',
                    keyboardType: TextInputType.numberWithOptions(
                      signed: false,
                      decimal: true,
                    ),
                    onSaved: (value) {
                      _quantity = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Technical Specification',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: CommonField(
                    bgColor: Colors.white,
                    borderColor: Colors.grey,
                    borderRadius: 10,
                    maxLines: 5,
                    topPadding: 30,
                    placeholder: 'Some Specifications',
                    keyboardType: TextInputType.multiline,
                    onSaved: (value) {
                      // _tech
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Terms of Delivery',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: MultilineDropdownButtonFormField(
                    value: _deliveryTermsChoice,
                    onChanged: (value) {
                      setState(() {
                        _deliveryTermsChoice = value;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'EX-FACTORY',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: 'EX-FACTORY',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'FOB',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: 'FOB',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'CNF',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: 'CNF',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'OTHER',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: 'OTHER',
                      ),
                    ],
                    iconSize: 40,
                    decoration: InputDecoration(
                      // counterText: controller.text.length.toString(),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                      ),
                      errorStyle: TextStyle(color: Colors.red[200]),
                      alignLabelWithHint: true,
                      hintText: '',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                      // suffixIcon: Padding(
                      //   padding: const EdgeInsetsDirectional.only(end: 15, start: 10),
                      //   child: Icon(Icons.arrow_drop_down),
                      // ),
                      suffixStyle: TextStyle(fontSize: 16),
                      contentPadding: EdgeInsets.only(
                        left: 30,
                        top: 10,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Payment Terms',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: MultilineDropdownButtonFormField(
                    value: _paymentTermsChoice,
                    onChanged: (value) {
                      setState(() {
                        _paymentTermsChoice = value;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'LC at Site',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: 'LC at Site',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'LC 30 days',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: 'LC 30 days',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'LC 90 days',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: 'LC 90 days',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'LC 120 days',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: 'LC 120 days',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'TT',
                          style: TextStyle(fontSize: 18),
                        ),
                        value: 'TT',
                      ),
                    ],
                    iconSize: 40,
                    decoration: InputDecoration(
                      // counterText: controller.text.length.toString(),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.grey,
                        ),
                      ),
                      errorStyle: TextStyle(color: Colors.red[200]),
                      alignLabelWithHint: true,
                      hintText: '',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                      // suffixIcon: Padding(
                      //   padding: const EdgeInsetsDirectional.only(end: 15, start: 10),
                      //   child: Icon(Icons.arrow_drop_down),
                      // ),
                      suffixStyle: TextStyle(fontSize: 16),
                      contentPadding: EdgeInsets.only(
                        left: 30,
                        top: 10,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Additional Message',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: CommonField(
                    bgColor: Colors.white,
                    borderColor: Colors.grey,
                    borderRadius: 10,
                    maxLines: 5,
                    topPadding: 30,
                    placeholder: 'Some Message',
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: _callOurExec,
                        onChanged: (value) {
                          setState(() {
                            _callOurExec = value;
                          });
                        },
                      ),
                      Text(
                        'Call our Executive',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: _reportsQCStand,
                        onChanged: (value) {
                          setState(() {
                            _reportsQCStand = value;
                          });
                        },
                      ),
                      Text(
                        'Reports QC Stand',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Our team will contact you soon for further procedures.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: CommonButton(
                    title: 'Submit',
                    onPressed: _submit,
                    borderRadius: 10,
                    bgColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColor,
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
    );
  }
}

class PopularProductCard extends StatelessWidget {
  final String productName;
  final String description;
  final String price;
  final String url;

  PopularProductCard(
    this.productName,
    this.description,
    this.price,
    this.url,
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(url),
                    fit: BoxFit.cover,
                  ) // ENTER IMAGE LINK FOR CATEGORY
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
                      productName ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(),
                    ),
                    Text(
                      description ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(),
                    ),
                    Text(
                      '€ $price' ?? '',
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
    );
  }
}
