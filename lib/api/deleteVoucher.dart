import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test_project/config/constants.dart';

import '../Widgets/scaffoldedMessage.dart';

Future<void> deleteVoucher(String voucherID, BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = await sharedPreferences.getString('token');

  var url = Uri.parse("${URL_BASE}/voucher/delete/${voucherID}/");

  try {
    var response = await http.delete(url, headers: {
      "authorization": "$token",
      "content-type": "application/json"
    }).timeout(Duration(seconds: 30));

    if (response.statusCode == 200) {
      Navigator.of(context, rootNavigator: true).pop();
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
