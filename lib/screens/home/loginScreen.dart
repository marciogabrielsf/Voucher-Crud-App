import 'package:flutter/material.dart';
import 'package:flutter_test_project/screens/home/components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }

  AppBar CustomAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.abc),
        onPressed: () {},
      ),
    );
  }
}
