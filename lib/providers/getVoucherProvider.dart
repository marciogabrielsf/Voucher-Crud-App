import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/models/get_Voucher_model.dart';

class getVoucherProvider extends ChangeNotifier {
  List<getVoucherModel> _vouchers = [];

  List<getVoucherModel> get vouchers => _vouchers;

  void updateList(List<getVoucherModel> vouchers) {
    _vouchers = vouchers;
    notifyListeners();
  }

  Future<List<getVoucherModel>> getVouchers() async {
    return _vouchers;
  }
}
