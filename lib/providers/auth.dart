import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  String _token;
  String _username;

  String get token {
    return _token;
  }

  String get username {
    return _username;
  }
}
