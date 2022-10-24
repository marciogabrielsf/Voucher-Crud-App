import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastVoucherAdded extends StatefulWidget {
  final Future<List> data;

  const LastVoucherAdded({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<LastVoucherAdded> createState() => _LastVoucherAddedState();
}

class _LastVoucherAddedState extends State<LastVoucherAdded> {
  NumberFormat numberFormat =
      NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2);
  @override
  Widget build(BuildContext context) {
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
            child: FutureBuilder<List>(
              future: widget.data,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('erro ao carregar vouchers'),
                  );
                }
                if (snapshot.hasData) {
                  if (snapshot.data!.length > 0) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return LastAddedItem(
                          voucherNumber:
                              snapshot.data![index]['voucherNumber'].toString(),
                          value: numberFormat
                              .format(snapshot.data![index]['value']),
                          order:
                              snapshot.data![index]['orderNumber'].toString(),
                          company: snapshot.data![index]['company'],
                          date: DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br')
                              .format(DateTime.parse(
                                  snapshot.data![index]['voucherDate'])),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text('Não há nenhum voucher adicionado'),
                    );
                  }
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
  final String value;
  final String order;
  final String date;
  final String company;
  final String voucherNumber;
  const LastAddedItem({
    Key? key,
    required this.value,
    required this.order,
    required this.date,
    required this.company,
    required this.voucherNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Voucher - $voucherNumber',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF616161)),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 16, color: Color(0x0FF138800)),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$company - $order',
              style: TextStyle(fontSize: 12, color: Color(0xFF616161)),
            ),
            Text(
              '$date',
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
