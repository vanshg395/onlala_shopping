import 'package:flutter/material.dart';
import 'package:onlala_shopping/widgets/common_button.dart';
import 'package:onlala_shopping/widgets/common_dropdown.dart';
import 'package:onlala_shopping/widgets/common_field.dart';

class PlaceOrderScreen extends StatefulWidget {
  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  bool _callOurExec = false;
  String _deliveryTermsChoice;
  bool _isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, dynamic> _data = {};
  String _paymentTermsChoice;

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    // CODE HERE
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place Order'),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Technical Specifications (if any)',
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
                    topPadding: 30,
                    maxLines: 5,
                    placeholder: 'Some Specifications',
                    onSaved: (value) {
                      // _data['quantity'] = value;
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
                    validator: (value) {
                      if (value == null) {
                        return 'This field is required.';
                      }
                    },
                    onSaved: (value) {
                      // _data['terms_of_delivery'] = value;
                    },
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
                    validator: (value) {
                      if (value == null) {
                        return 'This field is required.';
                      }
                    },
                    onSaved: (value) {
                      _data['payment_terms'] = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Additional Information (Duty & Courier)',
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
                    topPadding: 30,
                    maxLines: 5,
                    placeholder: 'Some Specifications',
                    onSaved: (value) {
                      // _data['quantity'] = value;
                    },
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
                            // _data['call_our_excutive'] = value;
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
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : CommonButton(
                          title: 'Submit',
                          onPressed: _submit,
                          borderRadius: 10,
                          fontSize: 18,
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
