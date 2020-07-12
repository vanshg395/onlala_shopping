import 'package:flutter/material.dart';
import 'package:onlala_shopping/widgets/common_button.dart';

import './register_screen.dart';
import './login_screen.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
        ),
      ),
    );
  }
}
