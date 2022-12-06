import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/Widgets/customInput.dart';
import 'package:flutter_test_project/api/deleteVoucher.dart';
import 'package:flutter_test_project/api/updateVoucher.dart';
import 'package:flutter_test_project/config/constants.dart';
import 'package:flutter_test_project/models/get_Voucher_model.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UpdateVoucherView extends StatefulWidget {
  final getVoucherModel voucher;
  const UpdateVoucherView({
    super.key,
    required this.voucher,
  });

  @override
  State<UpdateVoucherView> createState() => _UpdateVoucherViewState();
}

class _UpdateVoucherViewState extends State<UpdateVoucherView> {
  final _valueController = TextEditingController();
  final _voucherController = TextEditingController();
  final _orderController = TextEditingController();
  final _dateController = TextEditingController();
  final _companyController = TextEditingController();
  final CurrencyTextInputFormatter _formatter =
      CurrencyTextInputFormatter(symbol: "R\$", locale: 'pt-BR');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var dateFormat = DateFormat('dd/MM/yyyy');

    _valueController.text =
        _formatter.format(widget.voucher.value!.toStringAsFixed(2));
    _voucherController.text = widget.voucher.voucherNumber.toString();
    _orderController.text = widget.voucher.orderNumber.toString();
    _dateController.text =
        dateFormat.format(DateTime.parse(widget.voucher.date ?? ''));
    _companyController.text = widget.voucher.company!;
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    var maskFormatter = new MaskTextInputFormatter(
        mask: '##/##/####',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Icon(Icons.close),
              onTap: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Voucher',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            CustomInput(
              placeholder: 'Número do voucher',
              controller: _voucherController,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Número do Pedido',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            CustomInput(
              placeholder: 'Número do Pedido',
              controller: _orderController,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Valor',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            CustomInput(
              inputFormatters: [_formatter],
              placeholder: 'Valor do pedido',
              controller: _valueController,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            CustomInput(
              inputFormatters: [maskFormatter],
              placeholder: 'Número do voucher',
              controller: _dateController,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Empresa',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            CustomInput(
              placeholder: 'Número do voucher',
              controller: _companyController,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  CupertinoButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Você tem certeza?'),
                              content: Text(
                                  'Tem certeza que quer deletar esse voucher?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Não')),
                                TextButton(
                                    onPressed: () async {
                                      await deleteVoucher(
                                          widget.voucher.id!, context);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Sim')),
                              ],
                            );
                          });
                      //
                    },
                    child: Text(
                      'Excluir Voucher',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  Container(
                    child: Container(
                      width: 200,
                      child: CupertinoButton(
                          child: loading
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator.adaptive(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          kTextColorInv)),
                                )
                              : Text('Salvar'),
                          color: kPrimaryColor,
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            await updateVoucher(
                                widget.voucher.id!,
                                _voucherController.text,
                                _valueController.text,
                                _dateController.text,
                                _orderController.text,
                                _companyController.text,
                                context);
                            setState(() {
                              loading = false;
                            });
                          }),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
