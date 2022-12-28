import 'package:flutter/material.dart';
import 'package:flutter_test_project/Widgets/defaultAddVoucherButton.dart';
import 'package:flutter_test_project/Widgets/defaultNavigationBar.dart';
import 'view.dart';

class VoucherListScreen extends StatelessWidget {
  const VoucherListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VoucherListBody(),
      floatingActionButton: DefaultAddVoucherButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: DefaultBottomNavigation(),
    );
  }
}
