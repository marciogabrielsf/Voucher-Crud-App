import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test_project/models/get_Voucher_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test_project/config/constants.dart';

Future<List<getVoucherModel>> fetchVouchers() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = await sharedPreferences.getString('token');
  var url = Uri.parse("${URL_BASE}/voucher/getlist/");

  try {
    var response = await http.get(url,
        headers: {"authorization": "$token"}).timeout(Duration(seconds: 30));

    if (response.statusCode == 200) {
      final body = json.decode(response.body)['vouchers'] as List<dynamic>;
      return body.map((e) => getVoucherModel.fromJson(e)).toList();
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
