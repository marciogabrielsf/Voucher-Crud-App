import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/get_Voucher_model.dart';

class LastAddedItem extends StatelessWidget {
  final getVoucherModel voucher;
  const LastAddedItem({
    Key? key,
    required this.voucher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat =
        NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Voucher - ${voucher.voucherNumber}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF616161)),
            ),
            Text(
              numberFormat.format(voucher.value),
              style: TextStyle(fontSize: 18, color: Color(0x0FF138800)),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${voucher.company} - ${voucher.orderNumber}',
              style: TextStyle(fontSize: 12, color: Color(0xFF616161)),
            ),
            Text(
              DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt-Br')
                  .format(DateTime.parse(voucher.date ?? '')),
              style: TextStyle(fontSize: 12, color: Color(0xFF616161)),
            )
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
