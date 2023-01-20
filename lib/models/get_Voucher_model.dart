class getVoucherModel {
  String? id;
  num? value;
  num? voucherNumber;
  num? orderNumber;
  String? date;
  String? createdAt;
  String? company;

  getVoucherModel(
      {this.id,
      this.value,
      this.voucherNumber,
      this.orderNumber,
      this.createdAt,
      this.date,
      this.company});

  getVoucherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    createdAt = json['createdAt'];
    voucherNumber = json['voucherNumber'];
    orderNumber = json['orderNumber'];
    date = json['voucherDate'];
    company = json['company'];
  }
}
