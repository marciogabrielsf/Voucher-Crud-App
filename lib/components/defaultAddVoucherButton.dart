import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../modals/addVoucherModal/addVoucherModal.dart';

FloatingActionButton DefaultAddVoucherButton(
    BuildContext context, Function refresh) {
  return FloatingActionButton(
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
  );
}
