// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/providers/authProvider.dart';
import 'package:flutter_test_project/screens/home/HomeScreen.dart';
import 'package:flutter_test_project/screens/login/loginScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const String URL_BASE = "http://10.0.2.2:8888";

// login

Future<void> login(String email, String senha, BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url = Uri.parse("${URL_BASE}/auth/login/");
  var userProvider = Provider.of<UserProvider>(context, listen: false);
  final navigator = Navigator.of(context);

  var response = await http.post(url,
      headers: {"content-type": "application/json"},
      body: jsonEncode({"email": email, "password": senha}));

  if (response.statusCode == 200) {
    await sharedPreferences.setString(
        'token', "Token ${jsonDecode(response.body)['token']}");
    userProvider.setUser(response.body);
    navigator
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          jsonDecode(response.body)['message'],
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
      ),
    );
    print(jsonDecode(response.body));
  }
}

// verify token

Future<void> checkToken(BuildContext context) async {
  var url = Uri.parse("${URL_BASE}/auth/verify/");
  var userProvider = Provider.of<UserProvider>(context, listen: false);
  final navigator = Navigator.of(context);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = await sharedPreferences.getString('token');

  var response = await http.get(url, headers: {"authorization": "$token"});

  if (response.statusCode == 200) {
    userProvider.setUser(response.body);
    navigator
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  } else {
    sharedPreferences.clear();
    navigator.pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}

Future logOut() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.clear();
}
