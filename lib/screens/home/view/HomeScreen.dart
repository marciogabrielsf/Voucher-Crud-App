import 'package:flutter/material.dart';
import 'package:flutter_test_project/api/fetchVouchers.dart';
import 'package:flutter_test_project/models/get_Voucher_model.dart';
import 'package:flutter_test_project/providers/getVoucherProvider.dart';
import 'package:flutter_test_project/screens/home/view/view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/defaultAddVoucherButton.dart';
import '../../../Widgets/defaultNavigationBar.dart';
import '../../../modals/addVoucherModal/addVoucherModal.dart';

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
    return Scaffold(
      body: HomeBody(),
      floatingActionButton: DefaultAddVoucherButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: DefaultBottomNavigation(),
    );
  }
}
