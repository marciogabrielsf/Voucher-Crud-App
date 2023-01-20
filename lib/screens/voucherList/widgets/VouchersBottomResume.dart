import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_project/config/constants.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../api/fetchVouchers.dart';
import '../../../modals/addVoucherModal/addVoucherModal.dart';
import '../../../providers/getVoucherProvider.dart';

class VouchersResume extends StatefulWidget {
  final num value;
  final num qnt;
  final num discount;
  const VouchersResume({
    Key? key,
    required this.value,
    required this.qnt,
    required this.discount,
  }) : super(key: key);

  @override
  State<VouchersResume> createState() => _VouchersResumeState();
}

class _VouchersResumeState extends State<VouchersResume> {
  NumberFormat numberFormat =
      NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ------------------------ NUMBER OF ORDERS ------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Número de Pedidos:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('${widget.qnt}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          // ------------------------ ORDER VALUES ------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Faturamento:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                numberFormat.format(widget.value),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lucro:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                numberFormat.format(widget.discount),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0x0FF138800)),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          CupertinoButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            borderRadius: BorderRadius.circular(10),
            color: kPrimaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Adicionar Voucher',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onPressed: () async {
              HapticFeedback.mediumImpact();
              var fetchedVouchers =
                  Provider.of<getVoucherProvider>(context, listen: false);
              await showCupertinoModalBottomSheet(
                  isDismissible: false,
                  enableDrag: false,
                  expand: true,
                  context: context,
                  builder: (context) => AddVoucherModal());
              fetchedVouchers.updateList(await fetchVouchers());
            },
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
