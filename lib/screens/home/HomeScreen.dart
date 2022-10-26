import 'package:flutter/material.dart';
import 'package:flutter_test_project/api/fetchVouchers.dart';
import 'package:flutter_test_project/components/defaultNavigationBar.dart';
import 'package:flutter_test_project/screens/home/components/homeBody.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../modals/addVoucherModal/addVoucherModal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List> _voucherData;

  void refresh() {
    setState(() {
      _voucherData = fetchVouchers();
    });
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(voucherData: _voucherData),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1ED800),
        onPressed: () async {
          await showCupertinoModalBottomSheet(
              isDismissible: false,
              enableDrag: false,
              expand: true,
              context: context,
              builder: (context) => AddVoucherModal());
          refresh();
        },
        child: Icon(Icons.add_circle, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: DefaultBottomNavigation(),
    );
  }
}
