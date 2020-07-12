import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';

import './register_screen.dart';
import '../widgets/common_field.dart';
import '../widgets/common_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SafeArea(
        child: Container(
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
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: CommonButton(
                    title: 'Login',
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
                        _permissionGranted = await location.requestPermission();
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
    );
  }
}
