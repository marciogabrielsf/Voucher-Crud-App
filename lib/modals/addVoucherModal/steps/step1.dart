import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/modals/addVoucherModal/steps/step2.dart';
import 'package:flutter_test_project/providers/addVoucherProvider.dart';
import 'package:provider/provider.dart';

import '../../../components/customInput.dart';
import '../../../constants.dart';

class VoucherStep1 extends StatefulWidget {
  VoucherStep1({
    super.key,
  });

  @override
  State<VoucherStep1> createState() => _VoucherStep1State();
}

class _VoucherStep1State extends State<VoucherStep1> {
  final _voucherNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var voucherProvider = Provider.of<VoucherProvider>(context, listen: false);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Icon(Icons.close),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).pop();
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
                    "Voucher?",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Digite o número do voucher a ser",
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
                    controller: _voucherNumberController,
                    keyboardType: TextInputType.number,
                    placeholder: 'Voucher',
                    autofocus: true,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: "Step1",
                    onPressed: () {
                      voucherProvider
                          .setVoucherNumber(_voucherNumberController.text);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => VoucherStep2(),
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
      ),
    );
  }
}
