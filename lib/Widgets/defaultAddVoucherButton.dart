import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_project/config/constants.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../api/fetchVouchers.dart';
import '../modals/addVoucherModal/addVoucherModal.dart';
import '../providers/getVoucherProvider.dart';

class DefaultAddVoucherButton extends StatelessWidget {
  const DefaultAddVoucherButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kGreenButtonColor,
      onPressed: () async {
        HapticFeedback.mediumImpact();
        var fetchedVouchers =
            Provider.of<getVoucherProvider>(context, listen: false);
        await showCupertinoModalBottomSheet(
            isDismissible: false,
            enableDrag: false,
            expand: true,
            context: context,
            builder: (context) => AddVoucherModal());
        fetchedVouchers.updateList(await fetchVouchers());
      },
      child: Icon(Icons.add_circle, size: 30),
    );
  }
}
