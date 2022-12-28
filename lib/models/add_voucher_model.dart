import 'package:flutter/cupertino.dart';

class VoucherModel extends ChangeNotifier {
  late String voucherNumber;
  late String orderNumber;
  late String value;
  late String date;
  late String company;

  VoucherModel(
      {required this.voucherNumber,
      required this.orderNumber,
      required this.date,
      required this.value,
      required this.company});
}
