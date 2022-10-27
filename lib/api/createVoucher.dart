import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/components/scaffoldedMessage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test_project/constants.dart';

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
  var date = new DateTime(2022, 11, 10);
  var datetime = date.toIso8601String() + 'Z';

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
              "voucherDate": datetime
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
      print(jsonDecode(response.body));
      showBottomMessage(
          context, jsonDecode(response.body)['message'], Colors.red);
    }
  } on TimeoutException catch (_) {
    showBottomMessage(
        context,
        "Não foi possível se comunicar com o servidor, verifique sua conexão ou tente novamente mais tarde.",
        Colors.red);
  } on SocketException catch (e) {
    print(e.message);
  }
}
