import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/constants.dart';
import 'package:provider/provider.dart';

import '../../../providers/addVoucherProvider.dart';

class VoucherStep6 extends StatefulWidget {
  VoucherStep6({super.key});

  @override
  State<VoucherStep6> createState() => _VoucherStep6State();
}

class _VoucherStep6State extends State<VoucherStep6> {
  @override
  Widget build(BuildContext context) {
    var voucherProvider = Provider.of<VoucherProvider>(context).voucher;
    return Scaffold(
      bottomSheet: saveBottomSheet(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Revise dos dados do seu voucher:",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  dataItem(
                      itemType: 'Voucher:',
                      item: voucherProvider.voucherNumber),
                  dataItem(
                      itemType: 'Pedido:', item: voucherProvider.orderNumber),
                  dataItem(itemType: 'Valor:', item: voucherProvider.value),
                  dataItem(itemType: 'Data:', item: voucherProvider.date),
                  dataItem(itemType: 'Empresa:', item: voucherProvider.company),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class dataItem extends StatelessWidget {
  const dataItem({
    Key? key,
    required this.item,
    required this.itemType,
  }) : super(key: key);

  final String item;
  final String itemType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          itemType,
          style: TextStyle(fontSize: 18),
        ),
        Text(
          item,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class saveBottomSheet extends StatefulWidget {
  const saveBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<saveBottomSheet> createState() => _saveBottomSheetState();
}

class _saveBottomSheetState extends State<saveBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
      color: kBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CupertinoButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            borderRadius: BorderRadius.circular(50),
            color: kPrimaryColor,
            child: Row(
              children: [
                Text(
                  'Salvar',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.check,
                  size: 24,
                )
              ],
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        ],
      ),
    );
  }
}
