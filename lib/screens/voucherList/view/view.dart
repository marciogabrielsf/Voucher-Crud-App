import 'package:flutter/material.dart';
import 'package:flutter_test_project/Widgets/LastAddedItem.dart';
import 'package:flutter_test_project/models/get_Voucher_model.dart';
import 'package:provider/provider.dart';

import '../../../providers/getVoucherProvider.dart';

class VoucherListBody extends StatefulWidget {
  const VoucherListBody({super.key});

  @override
  State<VoucherListBody> createState() => _VoucherListBodyState();
}

class _VoucherListBodyState extends State<VoucherListBody> {
  getVoucherModel defaultVoucher = getVoucherModel(
      company: 'Eneva',
      date: new DateTime.now().toIso8601String(),
      orderNumber: 5452,
      value: 120,
      voucherNumber: 10030);

  @override
  Widget build(BuildContext context) {
    var voucherList = Provider.of<getVoucherProvider>(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        ),
                        Text(
                          'Voltar',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )
                      ],
                    )),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Vouchers',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            height: MediaQuery.of(context).size.height - // total height
                kToolbarHeight - // top AppBar height
                MediaQuery.of(context).padding.top - // top padding
                kBottomNavigationBarHeight -
                102,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                    ),
                    SizedBox(width: 15),
                    Text(
                      '15 de Outubro - 15 de Novembro',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 15),
                    Icon(Icons.arrow_forward_ios, size: 16)
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - // total height
                      kToolbarHeight - // top AppBar height
                      MediaQuery.of(context).padding.top - // top padding
                      kBottomNavigationBarHeight -
                      265,
                  child: FutureBuilder(
                    future: voucherList.getSortedVouchers(),
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
                            padding: EdgeInsets.all(20),
                            itemCount: vouchers.length,
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
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                  ),
                ),
                Divider(
                  thickness: 2,
                  height: 0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Número de Pedidos:',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text('46',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'R\$50,00',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0x0FF138800)),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
