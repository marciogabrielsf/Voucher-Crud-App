// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<bool> login(String email, String senha) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url = Uri.parse("http://10.0.2.2:3000/auth/login/");

  var response = await http.post(url,
      headers: {"content-type": "application/json"},
      body: jsonEncode({"email": email, "password": senha}));

  if (response.statusCode == 200) {
    await sharedPreferences.setString(
        'token', "Token ${jsonDecode(response.body)['token']}");
    return true;
  } else {
    print(jsonDecode(response.body));
    return false;
  }
}
