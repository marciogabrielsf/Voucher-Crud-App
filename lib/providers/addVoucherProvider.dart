import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/models/Voucher.dart';

class VoucherProvider extends ChangeNotifier {
  Voucher _voucher = Voucher(
    company: '',
    date: '',
    orderNumber: '',
    value: '',
    voucherNumber: '',
  );

  Voucher get voucher => _voucher;

  void setVoucherCompany(String company) {
    _voucher.company = company;
    notifyListeners();
  }

  void setVoucherOrderNumber(String order) {
    _voucher.orderNumber = order;
    notifyListeners();
  }

  void setVoucherValue(String value) {
    _voucher.value = value;
    notifyListeners();
  }

  void setVoucherDate(String date) {
    _voucher.date = date;
    notifyListeners();
  }

  void setVoucherNumber(String voucherNumber) {
    _voucher.voucherNumber = voucherNumber;
    notifyListeners();
  }
}
