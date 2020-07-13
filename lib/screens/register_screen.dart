import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';

import './login_screen.dart';
import '../widgets/common_field.dart';
import '../widgets/common_button.dart';
import '../widgets/common_dropdown.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();

  final Address address;

  RegisterScreen(this.address);
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  final _compController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  Map<String, String> _data = {
    "email": "",
    "password": "",
    "first_name": "",
    "last_name": ""
  };
  Map<String, String> _buyerData = {
    "postal_state": "",
    "postal_city": "",
    "postal_country": "",
    "postal_code": "",
    "postal_address1": "",
    "postal_landmark": "",
    "brought_from": "",
    "company": "OnLAla",
    "mobile": "7980674526",
    "department": "Automobiles",
    "administrativeArea": "Vaishali",
    "isoCountryCode": "+231",
    "postal_details": "76, Beni Banerjee Avenue",
    "phone_verified": "true",
    "first_term_acceptance": "true",
    "second_term_acceptance": "true"
  };
  bool _isLoading = false;
  int _currentPart = 1;
  String _departmentChoice;
  String _sourcingChoice;

  Future<void> _submit1() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _currentPart++;
    });
    print(_data);
    // SNED REQUEST HERE USIGN PROVIDER.
  }

  Future<void> _submit2() async {
    _buyerData['postal_state'] = widget.address.adminArea;
    _buyerData['postal_city'] = widget.address.locality;
    _buyerData['postal_landmark'] = widget.address.subLocality;
    _buyerData['postal_address1'] = widget.address.countryName;
    _buyerData['postal_state'] = widget.address.addressLine;
    _buyerData['postal_code'] = widget.address.postalCode;
    _buyerData["department"] = _departmentChoice;
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    print(_buyerData);
    // SNED REQUEST HERE USIGN PROVIDER.
  }

  Widget buildPartOne() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Tell us About You!',
            style: Theme.of(context).textTheme.headline5.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'First Name',
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
            placeholder: 'John',
            controller: _firstnameController,
            validator: (value) {
              if (value == '') {
                return 'This field is required.';
              }
            },
            onSaved: (value) {
              _data['first_name'] = _firstnameController.text;
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Last Name',
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
            placeholder: 'Doe',
            controller: _lastnameController,
            validator: (value) {
              if (value == '') {
                return 'This field is required.';
              }
            },
            onSaved: (value) {
              _data['last_name'] = _lastnameController.text;
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Email Address',
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
            placeholder: 'abc@xyz.com',
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            validator: (value) {
              if (value == '') {
                return 'This field is required.';
              }
            },
            onSaved: (value) {
              _data['email'] = _emailController.text;
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Password',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: CommonField(
            isPassword: true,
            bgColor: Colors.white,
            borderColor: Colors.grey,
            borderRadius: 10,
            placeholder: 'XXXXXXXX',
            controller: _passController,
            validator: (value) {
              if (value == '') {
                return 'This field is required.';
              }
            },
            onSaved: (value) {
              _data['password'] = _passController.text;
            },
          ),
        ),
      ],
    );
  }

  Widget buildPartTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Tell us about your Company!',
            style: Theme.of(context).textTheme.headline5.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Company Name',
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
            placeholder: 'ABC Inc.',
            controller: _compController,
            validator: (value) {
              if (value == '') {
                return 'This field is required.';
              }
            },
            onSaved: (value) {
              _buyerData["company"] = _compController.text;
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Mobile Number',
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
            placeholder: 'XXXXXXXX',
            controller: _mobileController,
            validator: (value) {
              if (value == '') {
                return 'This field is required.';
              }
            },
            onSaved: (value) {
              _buyerData["mobile"] = _mobileController.text;
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Department',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: MultilineDropdownButtonFormField(
            value: _departmentChoice,
            onChanged: (value) {
              setState(() {
                _departmentChoice = value;
              });
            },
            items: [
              DropdownMenuItem(
                child: Text(
                  'Item 1',
                  style: TextStyle(fontSize: 18),
                ),
                value: '1',
              ),
              DropdownMenuItem(
                child: Text(
                  'Item 2',
                  style: TextStyle(fontSize: 18),
                ),
                value: '2',
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
              if (value == '') {
                return 'This field is required.';
              }
            },
            onSaved: (value) {},
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'You are Sourcing as',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: MultilineDropdownButtonFormField(
            value: _sourcingChoice,
            onChanged: (value) {
              setState(() {
                _sourcingChoice = value;
              });
            },
            items: [
              DropdownMenuItem(
                child: Text(
                  'Item 1',
                  style: TextStyle(fontSize: 18),
                ),
                value: '1',
              ),
              DropdownMenuItem(
                child: Text(
                  'Item 2',
                  style: TextStyle(fontSize: 18),
                ),
                value: '2',
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
              if (value == '') {
                return 'This field is required.';
              }
            },
            onSaved: (value) {},
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (_currentPart == 1) buildPartOne() else buildPartTwo(),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: CommonButton(
                      title: _currentPart == 1 ? 'Next' : 'Sign Up',
                      onPressed: _currentPart == 1 ? _submit1 : _submit2,
                      fontSize: 18,
                      borderRadius: 10,
                      bgColor: Theme.of(context).primaryColor,
                      borderColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: FlatButton(
                      child: Text(
                        'Login Instead',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
