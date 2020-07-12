import 'package:flutter/material.dart';

import './login_screen.dart';
import './register_screen.dart';
import '../widgets/common_button.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CommonButton(
            bgColor: Theme.of(context).primaryColor,
            borderColor: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => LoginScreen(),
                ),
              );
            },
            borderRadius: 10,
            title: 'LOGIN',
          ),
          SizedBox(
            height: 30,
          ),
          CommonButton(
            bgColor: Theme.of(context).primaryColor.withOpacity(0.3),
            borderColor: Theme.of(context).primaryColor.withOpacity(0.2),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => RegisterScreen(),
                ),
              );
            },
            borderRadius: 10,
            title: 'SIGN UP',
          ),
        ],
      ),
    );
  }
}
