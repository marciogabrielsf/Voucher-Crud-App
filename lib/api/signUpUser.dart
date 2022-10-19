import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test_project/constants.dart';

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
        .timeout(Duration(seconds: 15));

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          jsonDecode(response.body)['message'],
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF1ED800),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            jsonDecode(response.body)['message'],
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  } on TimeoutException catch (_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "O Servidor não está respondendo, tente novamente mais tarde.",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
