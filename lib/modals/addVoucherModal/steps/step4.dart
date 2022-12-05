import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/modals/addVoucherModal/steps/step5.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/customInput.dart';
import '../../../config/constants.dart';
import '../../../providers/addVoucherProvider.dart';

class VoucherStep4 extends StatefulWidget {
  VoucherStep4({super.key});

  @override
  State<VoucherStep4> createState() => _VoucherStep4State();
}

class _VoucherStep4State extends State<VoucherStep4> {
  var maskFormatter = new MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final _dateController = TextEditingController();
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
                    "Qual a data da",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "corrida?",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Qual o dia em que a corrida",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "aconteceu?",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomInput(
                    controller: _dateController,
                    keyboardType: TextInputType.datetime,
                    placeholder: '00/00/0000',
                    inputFormatters: [maskFormatter],
                    autofocus: true,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: "Step4",
                    onPressed: () {
                      voucherProvider.setVoucherDate(_dateController.text);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => VoucherStep5(),
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
