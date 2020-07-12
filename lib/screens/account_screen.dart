import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';

import './login_screen.dart';
import './register_screen.dart';
import '../widgets/common_button.dart';
import './auth_view.dart';
import '../providers/auth.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        centerTitle: true,
        actions: <Widget>[
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
      body: SafeArea(
        // child: AuthView(),
        child: Provider.of<Auth>(context, listen: false).isAuth
            ? Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            // image: CachedNetworkImageProvider(url)
                            // fit: BoxFit.cover,
                            // ),
                          ),
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 150,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'John Doe',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          'johndoe@gmail.com',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          '9999999999',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                            children: [
                              TextSpan(
                                text: 'Company: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              TextSpan(
                                text: 'Corevyan',
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 2,
                        indent: 30,
                        endIndent: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Cart'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.credit_card,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('My Orders'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Wishlist'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                spreadRadius: 2,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            leading: Icon(
                              Icons.settings,
                              color: Theme.of(context).primaryColor,
                            ),
                            title: Text(
                              'Edit Profile',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                spreadRadius: 2,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            leading: Icon(
                              Icons.account_balance_wallet,
                              color: Theme.of(context).primaryColor,
                            ),
                            title: Text(
                              'Bulk Inquiry Status',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                spreadRadius: 2,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            leading: Icon(
                              Icons.map,
                              color: Theme.of(context).primaryColor,
                            ),
                            title: Text(
                              'Shipping Address',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                spreadRadius: 2,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            leading: Icon(
                              Icons.people,
                              color: Theme.of(context).primaryColor,
                            ),
                            title: Text(
                              'Invite Friends',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                spreadRadius: 2,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            leading: Icon(
                              Icons.feedback,
                              color: Theme.of(context).primaryColor,
                            ),
                            title: Text(
                              'Feedback',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                spreadRadius: 2,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            leading: Icon(
                              Icons.info,
                              color: Theme.of(context).primaryColor,
                            ),
                            title: Text(
                              'Terms and Conditions',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                spreadRadius: 2,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30),
                            leading: Icon(
                              Icons.exit_to_app,
                              color: Theme.of(context).primaryColor,
                            ),
                            title: Text(
                              'Logout',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
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
      ),
    );
  }
}
