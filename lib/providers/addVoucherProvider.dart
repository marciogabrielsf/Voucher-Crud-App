import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/models/add_voucher_model.dart';

class VoucherProvider extends ChangeNotifier {
  VoucherModel _voucher = VoucherModel(
    company: '',
    date: '',
    orderNumber: '',
    value: '',
    voucherNumber: '',
  );

  VoucherModel get voucher => _voucher;

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
