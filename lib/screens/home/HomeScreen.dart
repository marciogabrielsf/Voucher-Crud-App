import 'package:flutter/material.dart';
import 'package:flutter_test_project/components/defaultNavigationBar.dart';
import 'package:flutter_test_project/screens/home/components/homeBody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1ED800),
        onPressed: () {},
        child: Icon(Icons.add_circle, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: DefaultBottomNavigation(),
    );
  }
}
