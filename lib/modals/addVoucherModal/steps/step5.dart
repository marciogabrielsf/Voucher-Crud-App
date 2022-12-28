import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/modals/addVoucherModal/steps/step6.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/customInput.dart';
import '../../../config/constants.dart';
import '../../../providers/addVoucherProvider.dart';

class VoucherStep5 extends StatefulWidget {
  VoucherStep5({super.key});

  @override
  State<VoucherStep5> createState() => _VoucherStep5State();
}

class _VoucherStep5State extends State<VoucherStep5> {
  final _companyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var voucherProvider = Provider.of<VoucherProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
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
                    "Qual a empresa que solicitou a corrida?",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Qual a empresa que fez o pedido da corrida?",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomInput(
                    controller: _companyController,
                    keyboardType: TextInputType.name,
                    placeholder: 'Empresa',
                    autofocus: true,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: "Step5",
                    onPressed: () {
                      voucherProvider
                          .setVoucherCompany(_companyController.text);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => VoucherStep6(),
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
