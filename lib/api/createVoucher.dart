import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test_project/config/constants.dart';

import '../Widgets/scaffoldedMessage.dart';
import '../modals/addVoucherModal/steps/step7.dart';

Future<void> createVoucher(
    String voucherNumber,
    String value,
    String voucherDate,
    String orderNumber,
    String company,
    BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = await sharedPreferences.getString('token');
  var url = Uri.parse("${URL_BASE}/voucher/create/");

  NumberFormat numberFormat =
      NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2);

  num parsedValue = numberFormat.parse(value);
  num parsedVoucher = int.parse(voucherNumber);
  var parsedOrder = int.parse(orderNumber);

  var now = DateTime.now();
  var splittedDate = voucherDate.split('/');
  var date = DateTime(int.parse(splittedDate[2]), int.parse(splittedDate[1]),
              int.parse(splittedDate[0]), now.hour, now.minute, now.second)
          .toIso8601String() +
      'Z';

  try {
    var response = await http
        .post(url,
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

    if (response.statusCode == 201) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => VoucherStep7(),
        ),
      );
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
