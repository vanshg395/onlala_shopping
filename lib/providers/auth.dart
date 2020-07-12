import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlala_shopping/utils/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  String _username;

  String baseUrl = "https://onlala-api.herokuapp.com/";

  bool get isAuth {
    return token != null;
  }

  String get token {
    return _token;
  }

  String get username {
    return _username;
  }

  Future<void> signup() async {}

  Future<void> login(Map<String, dynamic> loginData, [bool bool]) async {
    try {
      print('>>>>>>>>>>>>>>login');
      final url = baseUrl + 'user/api/token/buyer/';
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(loginData),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        _token = 'JWT ' + responseBody['access'];
        final prefs = await SharedPreferences.getInstance();
        final _data = json.encode({
          'token': _token,
        });
        await prefs.setString('userData', _data);
        final url2 = baseUrl + 'business/buyer/create/';
        final response2 = await http.get(
          url2,
          headers: {
            'Authorization': _token,
          },
        );
        print(response2.statusCode);
        print(response2.body);
        if (response2.statusCode == 200) {
          final resBody = json.decode(response2.body);
          print(resBody);
        } else if (response2.statusCode == 403) {
          throw HttpException('Not a buyer');
        }
      } else if (response.statusCode == 202) {
        final responseBody = json.decode(response.body);
        _token = 'JWT ' + responseBody['access'];
        final prefs = await SharedPreferences.getInstance();
        final _data = json.encode({
          'token': _token,
        });
        await prefs.setString('userData', _data);
        final url2 = baseUrl + 'business/buyer/create/';
        final response2 = await http.get(
          url2,
          headers: {
            'Authorization': _token,
          },
        );
        print(response2.statusCode);
        print(response2.body);
        if (response2.statusCode == 200) {
          final resBody = json.decode(response2.body);
          print(resBody);
          throw HttpException('Complete Profile');
        } else if (response2.statusCode == 403) {
          throw HttpException('Not a buyer');
        }
      } else if (response.statusCode == 401) {
        throw HttpException('Invalid Cred');
      } else if (response.statusCode == 412) {
        throw HttpException('User Blocked');
      }
    } catch (e) {
      throw e;
    }
  }
}
