import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';

import '../providers/auth.dart';
import '../widgets/common_button.dart';
import './login_screen.dart';
import './register_screen.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        centerTitle: true,
        actions: <Widget>[
          if (Provider.of<Auth>(context).isAuth)
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
      ),
      body: Provider.of<Auth>(context, listen: false).isAuth
          ? Container()
          : Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CommonButton(
                    bgColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (ctx) => LoginScreen(),
                        ),
                      )
                          .then((value) {
                        if (value != null) {
                          setState(() {});
                        }
                      });
                    },
                    borderRadius: 10,
                    title: 'LOGIN',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CommonButton(
                    bgColor: Theme.of(context).primaryColor.withOpacity(0.3),
                    borderColor:
                        Theme.of(context).primaryColor.withOpacity(0.2),
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => RegisterScreen(address.first),
                        ),
                      );
                    },
                    borderRadius: 10,
                    title: 'SIGN UP',
                  ),
                ],
              ),
            ),
    );
  }
}
