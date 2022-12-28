import 'package:flutter/material.dart';
import 'package:flutter_test_project/config/constants.dart';
import 'package:flutter_test_project/screens/login/view/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/checkToken.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    verificarToken().then(
      (value) async {
        if (value) {
          checkToken(context);
        } else {
          // nao tem token vai pra login
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
        ),
      ),
    );
  }

  Future<bool> verificarToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') != null) {
      return true;
    } else {
      return false;
    }
  }
}
