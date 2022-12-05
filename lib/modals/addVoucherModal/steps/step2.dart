import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/modals/addVoucherModal/steps/step3.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/customInput.dart';
import '../../../config/constants.dart';
import '../../../providers/addVoucherProvider.dart';

class VoucherStep2 extends StatefulWidget {
  VoucherStep2({super.key});

  @override
  State<VoucherStep2> createState() => _VoucherStep2State();
}

class _VoucherStep2State extends State<VoucherStep2> {
  final _orderNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // providers
    var voucherProvider = Provider.of<VoucherProvider>(context, listen: false);

    // body
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
                  "Qual o número do",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "pedido?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Digite o número do pedido a ser",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "adicionado.",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomInput(
                  controller: _orderNumberController,
                  keyboardType: TextInputType.number,
                  placeholder: 'Número do Pedido',
                  autofocus: true,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: "Step2",
                  onPressed: () {
                    voucherProvider
                        .setVoucherOrderNumber(_orderNumberController.text);
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => VoucherStep3(),
                      ),
                    );
                  },
                  backgroundColor: kPrimaryColor,
                  child: Icon(Icons.arrow_forward),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
