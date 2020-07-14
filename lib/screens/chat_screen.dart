import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:onlala_shopping/providers/wishlist.dart';
import 'package:onlala_shopping/screens/wishlist_screen.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';

import '../providers/auth.dart';
import '../providers/cart.dart';
import '../widgets/common_button.dart';
import './login_screen.dart';
import './register_screen.dart';
import './cart_screen.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        centerTitle: true,
        actions: <Widget>[
          if (Provider.of<Auth>(context).isAuth)
            IconButton(
              icon: Badge(
                showBadge: Provider.of<Wishlist>(context).numberOfwishItems == 0
                    ? false
                    : true,
                animationType: BadgeAnimationType.scale,
                animationDuration: Duration(milliseconds: 200),
                child: Icon(Icons.favorite),
                badgeContent: Text(
                  Provider.of<Wishlist>(context).numberOfwishItems.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => WishlistScreen(),
                  ),
                );
              },
            ),
          if (Provider.of<Auth>(context).isAuth)
            IconButton(
              icon: Badge(
                showBadge: Provider.of<Cart>(context).numberOfCartItems == 0
                    ? false
                    : true,
                animationType: BadgeAnimationType.scale,
                animationDuration: Duration(milliseconds: 200),
                child: Icon(Icons.shopping_cart),
                badgeContent: Text(
                  Provider.of<Cart>(context).numberOfCartItems.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => CartScreen(),
                  ),
                );
              },
            ),
        ],
      ),
      body: Provider.of<Auth>(context, listen: false).isAuth
          ? Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ChatCard(),
                    ChatCard(),
                    ChatCard(),
                  ],
                ),
              ),
            )
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

class ChatCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
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
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              children: [
                TextSpan(
                  text: 'Query made at: ',
                ),
                TextSpan(
                  text: 'Importer',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              children: [
                TextSpan(
                  text: 'Message: ',
                ),
                TextSpan(
                  text:
                      'Minim non duis ex voluptate eiusmod qui. Quis consequat ut anim velit aliquip commodo nostrud. Duis laboris elit nisi dolor ex consequat aute sunt ad quis occaecat in sunt cupidatat. Adipisicing culpa proident mollit ad. Voluptate excepteur ipsum nostrud eu nisi nisi. Ad exercitation reprehenderit ipsum esse nisi id nostrud quis qui eiusmod.',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
