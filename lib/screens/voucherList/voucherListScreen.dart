import 'package:flutter/material.dart';
import 'package:flutter_test_project/components/defaultNavigationBar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../modals/addVoucherModal/addVoucherModal.dart';
import 'componets/voucherListBody.dart';

class VoucherListScreen extends StatelessWidget {
  const VoucherListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VoucherListBody(),
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
      bottomNavigationBar: DefaultBottomNavigation(),
    );
  }

  void refresh() {}
}
