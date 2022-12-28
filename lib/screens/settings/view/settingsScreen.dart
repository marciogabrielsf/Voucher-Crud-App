import 'package:flutter/material.dart';
import 'package:flutter_test_project/screens/settings/view/view.dart';
import '../../../Widgets/defaultAddVoucherButton.dart';
import '../../../Widgets/defaultNavigationBar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsView(),
      floatingActionButton: DefaultAddVoucherButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: DefaultBottomNavigation(),
    );
  }
}
