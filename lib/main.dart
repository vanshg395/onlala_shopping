import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlala_shopping/screens/department_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './providers/auth.dart';
import './providers/cart.dart';
import './providers/wishlist.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Wishlist(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Onlala Shppping',
          theme: ThemeData(
            primaryColor: Color(0xFF255AE7),
            accentColor: Color(0xFF255AE7),
            primaryColorDark: Color(0xFF030708),
            cardColor: Color(0xFF3E4346),
            canvasColor: Color(0xFFF3F6F7),
            fontFamily: GoogleFonts.montserrat().fontFamily,
            textTheme: TextTheme(
                // subtitle1: TextStyle(fontSize: 20),
                // bodyText1: TextStyle(fontSize: 16),
                ),
          ),
          home: FutureBuilder(
            future: auth.tryAutoLogin(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return FutureBuilder(
                  future: () async {
                    final prefs = await SharedPreferences.getInstance();
                    if (prefs.containsKey('secondAttempt')) {
                      return true;
                    } else {
                      return false;
                    }
                  }(),
                  builder: (ctx, snapshot2) {
                    if (snapshot2.connectionState == ConnectionState.waiting) {
                      return Scaffold(
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      if (snapshot2.data) {
                        return TabsScreen();
                      } else {
                        return DepartmentSelectScreen();
                      }
                    }
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
