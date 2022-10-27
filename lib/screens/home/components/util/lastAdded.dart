import 'package:flutter/material.dart';
import 'package:flutter_test_project/api/fetchVouchers.dart';
import 'package:flutter_test_project/models/get_Voucher_model.dart';
import 'package:flutter_test_project/providers/getVoucherProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LastVoucherAdded extends StatefulWidget {
  const LastVoucherAdded({
    Key? key,
  }) : super(key: key);

  @override
  State<LastVoucherAdded> createState() => _LastVoucherAddedState();
}

class _LastVoucherAddedState extends State<LastVoucherAdded> {
  @override
  Widget build(BuildContext context) {
    var voucherList = Provider.of<getVoucherProvider>(context);

    return Column(
      children: [
        Row(
          children: [
            Text(
              "Últimos Registros",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 215,
          decoration: BoxDecoration(
            color: Color(0xFFC8C8C8),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: FutureBuilder(
              future: voucherList.getVouchers(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Erro'),
                  );
                }

                if (snapshot.hasData) {
                  if (snapshot.data!.length > 0) {
                    var vouchers = snapshot.data as List<getVoucherModel>;
                    return ListView.builder(
                      itemCount: vouchers.length,
                      itemBuilder: (context, index) {
                        return LastAddedItem(
                          voucher: vouchers[index],
                        );
                      },
                    );
                  }
                } else {
                  return Center(
                    child: Text('Não Há nenhum voucher Adicionado'),
                  );
                }

                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class LastAddedItem extends StatelessWidget {
  final getVoucherModel voucher;
  const LastAddedItem({
    Key? key,
    required this.voucher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat =
        NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Voucher - ${voucher.voucherNumber}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF616161)),
            ),
            Text(
              numberFormat.format(voucher.value),
              style: TextStyle(fontSize: 16, color: Color(0x0FF138800)),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${voucher.company} - ${voucher.orderNumber}',
              style: TextStyle(fontSize: 12, color: Color(0xFF616161)),
            ),
            Text(
              DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt-Br')
                  .format(DateTime.parse(voucher.date ?? '')),
              style: TextStyle(fontSize: 12, color: Color(0xFF616161)),
            )
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
