import 'package:flutter/material.dart';

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
                    title: 'Next',
                    onPressed: () {},
                    fontSize: 18,
                    borderRadius: 10,
                    bgColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
