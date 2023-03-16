import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/constants.dart';
import '../providers/authProvider.dart';
import '../screens/home/view/HomeScreen.dart';
import '../screens/login/view/loginScreen.dart';
import 'package:http/http.dart' as http;

Future<void> checkToken(BuildContext context) async {
  var url = Uri.parse("${URL_BASE}/auth/verify/");
  var userProvider = Provider.of<UserProvider>(context, listen: false);
  final navigator = Navigator.of(context);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = await sharedPreferences.getString('token');

  try {
    var response = await http.get(url,
        headers: {"authorization": "$token"}).timeout(Duration(seconds: 45));

    if (response.statusCode == 200) {
      userProvider.setUser(response.body);
      navigator.pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      sharedPreferences.clear();
      navigator.pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  } on TimeoutException catch (_) {
    sharedPreferences.clear();
    navigator.pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  } on SocketException catch (e) {
    print(e.message);
  }
}
