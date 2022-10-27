import 'package:flutter/material.dart';

class getVoucherModel {
  String? id;
  num? value;
  num? voucherNumber;
  num? orderNumber;
  String? date;
  String? company;

  getVoucherModel(
      {this.id,
      this.value,
      this.voucherNumber,
      this.orderNumber,
      this.date,
      this.company});

  getVoucherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    voucherNumber = json['voucherNumber'];
    orderNumber = json['orderNumber'];
    date = json['voucherDate'];
    company = json['company'];
  }
}
