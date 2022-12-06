import 'package:flutter/material.dart';
import 'package:flutter_test_project/config/constants.dart';
import 'package:intl/intl.dart';

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
          )
        ],
      ),
    );
  }
}
