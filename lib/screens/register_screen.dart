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
  int _currentPart = 1;
  String _departmentChoice;
  String _sourcingChoice;
  GlobalKey<FormState> _formKey = GlobalKey();

  Future<void> getLocation() async {}

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
                      title: 'Next',
                      onPressed: () {},
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
