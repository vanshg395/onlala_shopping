import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:onlala_shopping/providers/auth.dart';
import 'package:onlala_shopping/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

import './register_screen.dart';
import '../widgets/common_field.dart';
import '../widgets/common_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _data = {'username': '', 'password': ''};
  bool _isLoading = false;

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    _formKey.currentState.save();
    if (!_formKey.currentState.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false).login(_data, false);
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => TabsScreen(),
        ),
      );
    } catch (e) {
      print(e);
      if (e.toString() == 'Complete Profile') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => TabsScreen(),
          ),
        );
        showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Attention'),
            content:
                Text('You are requested to upload the required documents.'),
          ),
        );
      } else if (e.toString() == 'Invalid Cred') {
        await showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Error'),
            content: Text('Account with following credentials doesn\'t exist'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      } else if (e.toString() == 'Not a buyer') {
        await showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Error'),
            content: Text('This registered user is not a buyer.'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      } else if (e.toString() == 'User Blocked') {
        await showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Error'),
            content: Text(
                'Access for this user has been block due to some reason. Please contact our team to use your account.'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      } else {
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
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SafeArea(
        child: Container(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Welcome Back',
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
                      validator: (value) {
                        if (value == '') {
                          return 'This field is required';
                        }
                      },
                      onSaved: (value) {
                        _data['username'] = value;
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
                      validator: (value) {
                        if (value == '') {
                          return 'This field is required';
                        }
                      },
                      onSaved: (value) {
                        _data['password'] = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: _isLoading
                        ? CircularProgressIndicator()
                        : CommonButton(
                            title: 'Login',
                            onPressed: _submit,
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
                        'Sign Up Instead',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      onPressed: () async {
                        Location location = new Location();

                        bool _serviceEnabled;
                        PermissionStatus _permissionGranted;
                        LocationData _locationData;

                        _serviceEnabled = await location.serviceEnabled();
                        if (!_serviceEnabled) {
                          _serviceEnabled = await location.requestService();
                          if (!_serviceEnabled) {
                            return;
                          }
                        }

                        _permissionGranted = await location.hasPermission();
                        if (_permissionGranted == PermissionStatus.denied) {
                          _permissionGranted =
                              await location.requestPermission();
                          if (_permissionGranted != PermissionStatus.granted) {
                            return;
                          }
                        }
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          child: Dialog(
                            child: Container(
                              height: 120,
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircularProgressIndicator(),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text('Getting Your Location'),
                                ],
                              ),
                            ),
                          ),
                        );

                        _locationData = await location.getLocation();
                        Navigator.of(context).pop();
                        print(_locationData.latitude);
                        print(_locationData.longitude);
                        final coordinates = Coordinates(
                          _locationData.latitude,
                          _locationData.longitude,
                        );
                        final address = await Geocoder.local
                            .findAddressesFromCoordinates(coordinates);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => RegisterScreen(address.first),
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
