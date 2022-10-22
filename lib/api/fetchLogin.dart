// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/providers/authProvider.dart';
import 'package:flutter_test_project/screens/home/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

// login

Future<void> login(String email, String senha, BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url = Uri.parse("${URL_BASE}/auth/login/");
  var userProvider = Provider.of<UserProvider>(context, listen: false);
  final navigator = Navigator.of(context);

  try {
    var response = await http
        .post(url,
            headers: {"content-type": "application/json"},
            body: jsonEncode({"email": email, "password": senha}))
        .timeout(Duration(seconds: 15));

    if (response.statusCode == 200) {
      await sharedPreferences.setString(
          'token', "Token ${jsonDecode(response.body)['token']}");
      userProvider.setUser(response.body);
      navigator.pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
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
    }
  } on TimeoutException catch (_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'O Servidor não está respondendo, tente novamente mais tarde.',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
      ),
    );
  } on SocketException catch (e) {
    print(e.message);
  }
}

// verify token

Future logOut() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.clear();
}
