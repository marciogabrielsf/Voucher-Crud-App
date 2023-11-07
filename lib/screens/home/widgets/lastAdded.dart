import 'package:flutter/material.dart';
import 'package:flutter_test_project/models/get_Voucher_model.dart';
import 'package:flutter_test_project/providers/getVoucherProvider.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/LastAddedItem.dart';

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
          height: 300,
          decoration: BoxDecoration(
            color: Color(0xFFC8C8C8),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: FutureBuilder(
            future: voucherList.getSortedVouchers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Erro'),
                );
              }
              print(snapshot);

              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data!.length > 0) {
                  var vouchers = snapshot.data as List<getVoucherModel>;
                  return ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: vouchers.length < 7 ? vouchers.length : 7,
                    itemBuilder: (context, index) {
                      return LastAddedItem(
                        voucher: vouchers[index],
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text('Não Há nenhum voucher Adicionado'),
                  );
                }
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}
