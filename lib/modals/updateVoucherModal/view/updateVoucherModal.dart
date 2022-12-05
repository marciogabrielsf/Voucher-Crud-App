import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/modals/updateVoucherModal/view/view.dart';
import 'package:flutter_test_project/models/get_Voucher_model.dart';

class UpdateVoucherModal extends StatelessWidget {
  final getVoucherModel voucher;
  const UpdateVoucherModal({super.key, required this.voucher});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Navigator(
        onGenerateRoute: (_) => CupertinoPageRoute(
          builder: (builderContext) => Builder(
            builder: (context) => Scaffold(
              body: UpdateVoucherView(voucher: voucher),
            ),
          ),
        ),
      ),
    );
  }
}
