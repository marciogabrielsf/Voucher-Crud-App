import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_project/Widgets/LastAddedItem.dart';
import 'package:flutter_test_project/config/constants.dart';
import 'package:flutter_test_project/models/get_Voucher_model.dart';
import 'package:flutter_test_project/screens/voucherList/widgets/VouchersBottomResume.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../providers/getVoucherProvider.dart';

class VoucherListBody extends StatefulWidget {
  const VoucherListBody({super.key});

  @override
  State<VoucherListBody> createState() => _VoucherListBodyState();
}

class _VoucherListBodyState extends State<VoucherListBody>
    with SingleTickerProviderStateMixin {
  num ammount = 0;
  num voucherQnt = 0;
  num discountPercentage = 0.15;
  num discountedAmmount = 0;

  int todayDay = DateTime.now().day;

  late DateTime startDate;
  late DateTime endDate;

  void handleDateUp() {
    startDate =
        DateTime.utc(startDate.year, startDate.month + 1, startDate.day);
    endDate = DateTime.utc(endDate.year, endDate.month + 1, endDate.day);
  }

  void handleDateDown() {
    startDate =
        DateTime.utc(startDate.year, startDate.month - 1, startDate.day);
    endDate = DateTime.utc(endDate.year, endDate.month - 1, endDate.day);
  }

  @override
  void initState() {
    super.initState();
    if (todayDay < 15) {
      startDate =
          DateTime.utc(DateTime.now().year, DateTime.now().month - 1, 15);
      endDate = DateTime.utc(DateTime.now().year, DateTime.now().month, 15);
    } else {
      startDate = DateTime.utc(DateTime.now().year, DateTime.now().month, 15);
      endDate = DateTime.utc(DateTime.now().year, DateTime.now().month + 1, 15);
    }
  }

  @override
  Widget build(BuildContext context) {
    getVoucherProvider voucherList = Provider.of<getVoucherProvider>(context);
    String parsedStartDate =
        DateFormat(DateFormat.MONTH_DAY, 'pt-Br').format(startDate);
    String parsedEndDate =
        DateFormat(DateFormat.MONTH_DAY, 'pt-Br').format(endDate);

    setState(() {
      ammount = voucherList.getVoucherFilteredSum(startDate, endDate);
      voucherQnt = voucherList.getVoucherFilteredLength(startDate, endDate);
      discountedAmmount = ammount - (ammount * discountPercentage);
    });

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            // ------------------------ HEADER ------------------------
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoNavigationBarBackButton(
                  color: kPrimaryColor,
                  previousPageTitle: 'Voltar',
                ),
                Text(
                  ' Vouchers',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                )
              ],
            ),
          ),
          // ------------------------ BACKGROUND WHITE CONTAINER ------------------------
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
                74,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  '${startDate.year}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 10,
                ),
                // ------------------------ DATE BACK BUTTON ------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.lightImpact();
                        setState(() {
                          handleDateDown();
                        });
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                      ),
                    ),
                    // ------------------------ DATES ------------------------
                    Container(
                      alignment: Alignment.center,
                      width: 270,
                      child: AnimatedSwitcher(
                        switchInCurve: Curves.easeOutExpo,
                        switchOutCurve: Curves.easeInExpo,
                        duration: Duration(milliseconds: 500),
                        child: Text(
                          '${parsedStartDate} - ${parsedEndDate}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          key: ValueKey(startDate),
                        ),
                      ),
                    ),
                    // ------------------------ DATE FORWARD BUTTON ------------------------
                    GestureDetector(
                      child: Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        HapticFeedback.lightImpact();
                        setState(() {
                          handleDateUp();
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // ------------------------ BUILDER CONTAINER ------------------------
                Container(
                  height: MediaQuery.of(context).size.height - // total height
                      kToolbarHeight - // top AppBar height
                      MediaQuery.of(context).padding.top - // top padding
                      kBottomNavigationBarHeight -
                      260,
                  child: FutureBuilder(
                    future: voucherList.getVouchersByDate(startDate, endDate),
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
                // ------------------------ BOTTOM RESUME ------------------------
                Divider(
                  thickness: 2,
                  height: 0,
                ),
                // ------------------------ AMMOUNT AND QNT ------------------------
                VouchersResume(
                  value: ammount,
                  qnt: voucherQnt,
                  discount: discountedAmmount,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
