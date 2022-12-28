import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test_project/config/constants.dart';

import '../Widgets/scaffoldedMessage.dart';

Future<void> updateVoucher(
    String voucherID,
    String voucherNumber,
    String value,
    String voucherDate,
    String orderNumber,
    String company,
    BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = await sharedPreferences.getString('token');

  var url = Uri.parse("${URL_BASE}/voucher/update/${voucherID}/");

  NumberFormat numberFormat =
      NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2);

  num parsedValue = numberFormat.parse(value);
  num parsedVoucher = int.parse(voucherNumber);
  var parsedOrder = int.parse(orderNumber);

  var splitedDate = voucherDate.split('/');
  var date = DateTime(int.parse(splitedDate[2]), int.parse(splitedDate[1]),
              int.parse(splitedDate[0]))
          .toIso8601String() +
      'Z';

  try {
    var response = await http
        .put(url,
            headers: {
              "authorization": "$token",
              "content-type": "application/json"
            },
            body: jsonEncode({
              "voucherNumber": parsedVoucher,
              "orderNumber": parsedOrder,
              "value": parsedValue,
              "company": company,
              "voucherDate": date
            }))
        .timeout(Duration(seconds: 30));

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
