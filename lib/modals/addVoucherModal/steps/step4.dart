import 'package:flutter/material.dart';

import '../../../components/customInput.dart';
import '../../../constants.dart';

class VoucherStep4 extends StatefulWidget {
  VoucherStep4({super.key});

  @override
  State<VoucherStep4> createState() => _VoucherStep4State();
}

class _VoucherStep4State extends State<VoucherStep4> {
  final _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "corrida?",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                      controller: _dateController,
                      keyboardType: TextInputType.datetime,
                      placeholder: 'R\$ 0,00',
                      autofocus: true,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      heroTag: "Step4",
                      onPressed: () {},
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
      ),
    );
  }
}
