import 'package:flutter/material.dart';
import 'package:flutter_test_project/api/fetchVouchers.dart';
import 'package:flutter_test_project/components/defaultNavigationBar.dart';
import 'package:flutter_test_project/modals/addVoucherModal/addVoucherModal.dart';
import 'package:flutter_test_project/screens/home/components/homeBody.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../components/defaultAddVoucherButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List> _voucherData;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(voucherData: _voucherData),
      floatingActionButton: DefaultAddVoucherButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: DefaultBottomNavigation(),
    );
  }
}
