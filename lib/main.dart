import 'package:flutter/material.dart';
import 'package:flutter_test_project/screens/home/HomeScreen.dart';
import 'package:flutter_test_project/screens/loading/loadingScreen.dart';
import 'package:flutter_test_project/screens/login/loginScreen.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        unselectedWidgetColor: kSecondaryColor,
        toggleableActiveColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: kTextColor,
              fontFamily: 'Inter',
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoadingScreen(),
    );
  }
}
