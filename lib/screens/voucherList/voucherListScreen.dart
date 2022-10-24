import 'package:flutter/material.dart';
import 'package:flutter_test_project/components/defaultNavigationBar.dart';
import 'package:flutter_test_project/screens/voucherList/components/voucherListBody.dart';

class VoucherListScreen extends StatelessWidget {
  const VoucherListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VoucherListBody(),
      bottomNavigationBar: DefaultBottomNavigation(),
    );
  }
}
