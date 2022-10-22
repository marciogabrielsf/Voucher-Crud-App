import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/modals/addVoucherModal/steps/step4.dart';
import '../../../components/customInput.dart';
import '../../../constants.dart';

class VoucherStep3 extends StatefulWidget {
  VoucherStep3({super.key});

  @override
  State<VoucherStep3> createState() => _VoucherStep3State();
}

class _VoucherStep3State extends State<VoucherStep3> {
  final CurrencyTextInputFormatter _formatter =
      CurrencyTextInputFormatter(symbol: "R\$", locale: 'pt-BR');

  final _valueController = TextEditingController(text: ('R\$ 0,00'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                    "Quanto Vale o",
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
                    "Quanto é o valor do pedido a ser",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "adicionado?",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomInput(
                    controller: _valueController,
                    keyboardType: TextInputType.number,
                    placeholder: 'R\$ 0,00',
                    autofocus: true,
                    inputFormatters: [_formatter],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: "Step3",
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => VoucherStep4(),
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
