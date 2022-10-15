// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<bool> login(
    TextEditingController email, TextEditingController senha) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url = Uri.parse("http://localhost:3000/auth/login/");

  var response = await http.post(
    url,
    body: {'email': email.text, 'password': senha.text},
  );

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    return true;
  } else {
    print(jsonDecode(response.body));
    return false;
  }
}
