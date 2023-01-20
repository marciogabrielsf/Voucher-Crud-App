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

  Future<List<getVoucherModel>> getSortedVouchers() async {
    if (_vouchers.isNotEmpty) {
      _vouchers.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    }
    return _vouchers;
  }

  Future<List<getVoucherModel>> getVouchersByDate(
      DateTime a, DateTime b) async {
    List<getVoucherModel> filteredList = [];
    if (_vouchers.isNotEmpty) {
      filteredList.addAll(
        _vouchers.where(
          (element) {
            var date = DateTime.parse(element.date!);
            return date.compareTo(a) >= 0 && date.compareTo(b) <= 0;
          },
        ),
      );
      filteredList.sort((a, b) => b.date!.compareTo(a.date!));
    }
    return filteredList;
  }

  num getVoucherFilteredSum(DateTime a, DateTime b) {
    List<getVoucherModel> filteredList = [];
    filteredList.addAll(
      _vouchers.where(
        (element) {
          var date = DateTime.parse(element.date!);
          return date.compareTo(a) >= 0 && date.compareTo(b) <= 0;
        },
      ),
    );

    num sum = 0;

    for (var element in filteredList) {
      sum += element.value!;
    }
    return sum;
  }

  num getVoucherFilteredLength(DateTime a, DateTime b) {
    List<getVoucherModel> filteredList = [];
    filteredList.addAll(
      _vouchers.where(
        (element) {
          var date = DateTime.parse(element.date!);
          return date.compareTo(a) >= 0 && date.compareTo(b) <= 0;
        },
      ),
    );
    return filteredList.length;
  }
}
