import 'package:flutter/material.dart';
import 'package:flutter_test_project/components/LastAddedItem.dart';
import 'package:flutter_test_project/models/add_voucher_model.dart';
import 'package:flutter_test_project/models/get_Voucher_model.dart';

class VoucherListBody extends StatefulWidget {
  const VoucherListBody({super.key});

  @override
  State<VoucherListBody> createState() => _VoucherListBodyState();
}

class _VoucherListBodyState extends State<VoucherListBody> {
  getVoucherModel defaultVoucher = getVoucherModel(
      company: 'Eneva',
      date: new DateTime.now().toIso8601String(),
      orderNumber: 5452,
      value: 120,
      voucherNumber: 10030);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        ),
                        Text(
                          'Voltar',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )
                      ],
                    )),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Vouchers',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - // total height
                kToolbarHeight - // top AppBar height
                MediaQuery.of(context).padding.top - // top padding
                kBottomNavigationBarHeight -
                102,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                    ),
                    SizedBox(width: 15),
                    Text(
                      '15 de Outubro - 15 de Novembro',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 15),
                    Icon(Icons.arrow_forward_ios, size: 16)
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      LastAddedItem(voucher: defaultVoucher),
                      LastAddedItem(voucher: defaultVoucher),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
