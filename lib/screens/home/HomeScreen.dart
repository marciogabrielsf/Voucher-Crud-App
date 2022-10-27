import 'package:flutter/material.dart';
import 'package:flutter_test_project/api/fetchVouchers.dart';
import 'package:flutter_test_project/components/defaultNavigationBar.dart';
import 'package:flutter_test_project/models/get_Voucher_model.dart';
import 'package:flutter_test_project/providers/getVoucherProvider.dart';
import 'package:flutter_test_project/screens/home/components/homeBody.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../../modals/addVoucherModal/addVoucherModal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    var fetchedVouchers =
        Provider.of<getVoucherProvider>(context, listen: false);

    fetchVouchers().then((value) {
      if (value.isNotEmpty) {
        fetchedVouchers.updateList(value);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var fetchedVouchers = Provider.of<getVoucherProvider>(context);
    return Scaffold(
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1ED800),
        onPressed: () async {
          await showCupertinoModalBottomSheet(
              isDismissible: false,
              enableDrag: false,
              expand: true,
              context: context,
              builder: (context) => AddVoucherModal());
          fetchedVouchers.updateList(await fetchVouchers());
        },
        child: Icon(Icons.add_circle, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: DefaultBottomNavigation(),
    );
  }
}
