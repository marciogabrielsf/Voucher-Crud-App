import 'package:flutter/material.dart';
import '../../../config/constants.dart';
import 'package:flutter_test_project/screens/signUp/view/view.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: kPrimaryColor,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Body(),
    );
  }
}
