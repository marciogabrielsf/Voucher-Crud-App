import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/providers/authProvider.dart';
import 'package:flutter_test_project/screens/home/view/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Widgets/scaffoldedMessage.dart';
import '../config/constants.dart';
import '../providers/getVoucherProvider.dart';

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
        .timeout(Duration(seconds: 30));

    if (response.statusCode == 200) {
      await sharedPreferences.setString(
          'token', "Token ${jsonDecode(response.body)['token']}");
      userProvider.setUser(response.body);
      navigator.pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      showBottomMessage(
          context, jsonDecode(response.body)['message'], Colors.red);
    }
  } on TimeoutException catch (_) {
    showBottomMessage(
        context,
        "Não foi possível se comunicar com o servidor, verifique sua conexão ou tente novamente mais tarde.",
        Colors.red);
  }
}

// verify token

Future logOut(BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var voucherList = Provider.of<getVoucherProvider>(context, listen: false);

  voucherList.updateList([]);
  await sharedPreferences.clear();
}
