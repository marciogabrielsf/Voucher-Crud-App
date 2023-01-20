import 'package:flutter/material.dart';
import 'view.dart';

class VoucherListScreen extends StatelessWidget {
  const VoucherListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VoucherListBody(),
    );
  }
}
