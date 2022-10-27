import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test_project/constants.dart';

import '../components/scaffoldedMessage.dart';

Future<void> signUp(String email, String cpf, String name, String password,
    String confirmPassword, BuildContext context) async {
  var url = Uri.parse("${URL_BASE}/auth/register/");

  try {
    var response = await http
        .post(
          url,
          headers: {"content-type": "application/json"},
          body: jsonEncode({
            "email": email,
            "name": name,
            "password": password,
            "confirmpassword": confirmPassword,
            "cpf": cpf,
          }),
        )
        .timeout(Duration(seconds: 30));

    if (response.statusCode == 201) {
      showBottomMessage(
          context, jsonDecode(response.body)['message'], Color(0xFF1ED800));
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
