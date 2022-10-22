import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/modals/addVoucherModal/steps/step1.dart';
import 'package:flutter_test_project/providers/addVoucherProvider.dart';
import 'package:provider/provider.dart';

class AddVoucherModal extends StatelessWidget {
  const AddVoucherModal({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VoucherProvider(),
      child: Material(
        child: Navigator(
          onGenerateRoute: (_) => CupertinoPageRoute(
            builder: (builderContext) => Builder(
              builder: (context) => Scaffold(
                body: VoucherStep1(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
