import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test_project/constants.dart';

Future<List> fetchVouchers() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = await sharedPreferences.getString('token');
  var url = Uri.parse("${URL_BASE}/voucher/getlist/");

  try {
    var response = await http.get(url,
        headers: {"authorization": "$token"}).timeout(Duration(seconds: 20));

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes))['vouchers'];
    } else {
      return [];
    }
  } on TimeoutException catch (_) {
    return [];
  } on SocketException catch (e) {
    print(e.message);
    return [];
  }
}
