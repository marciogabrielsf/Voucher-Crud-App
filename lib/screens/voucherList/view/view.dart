import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_project/Widgets/LastAddedItem.dart';
import 'package:flutter_test_project/config/constants.dart';
import 'package:flutter_test_project/modals/updateVoucherModal/view/updateVoucherModal.dart';
import 'package:flutter_test_project/models/get_Voucher_model.dart';
import 'package:flutter_test_project/screens/voucherList/widgets/VouchersBottomResume.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../api/fetchVouchers.dart';
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
  num discountedAmmount = 0;

  int todayDay = DateTime.now().day;

  late DateTime startDate;
  late DateTime endDate;

  void handleDateUp() {
    startDate =
        DateTime.utc(startDate.year, startDate.month + 1, startDate.day);
    endDate =
        DateTime.utc(endDate.year, endDate.month + 1, endDate.day, 23, 59, 59);
  }

  void handleDateDown() {
    startDate =
        DateTime.utc(startDate.year, startDate.month - 1, startDate.day);
    endDate =
        DateTime.utc(endDate.year, endDate.month - 1, endDate.day, 23, 59, 59);
  }

  @override
  void initState() {
    super.initState();
    if (todayDay < startDay) {
      startDate =
          DateTime.utc(DateTime.now().year, DateTime.now().month - 1, startDay);
      endDate = DateTime.utc(
          DateTime.now().year, DateTime.now().month, endDay, 23, 59, 59);
    } else {
      startDate =
          DateTime.utc(DateTime.now().year, DateTime.now().month, startDay);
      endDate = DateTime.utc(
          DateTime.now().year, DateTime.now().month + 1, endDay, 23, 59, 59);
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
      discountedAmmount = ammount - (ammount * profitDiscount);
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
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
                          HapticFeedback.mediumImpact();
                          setState(() {
                            handleDateDown();
                          });
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 22,
                        ),
                      ),
                      // ------------------------ DATES ------------------------
                      Container(
                        constraints: BoxConstraints(minWidth: 280),
                        alignment: Alignment.center,
                        child: AnimatedSwitcher(
                          switchInCurve: Curves.easeOutExpo,
                          switchOutCurve: Curves.easeInExpo,
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            '${parsedStartDate} - ${parsedEndDate}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                            key: ValueKey(startDate),
                          ),
                        ),
                      ),
                      // ------------------------ DATE FORWARD BUTTON ------------------------
                      GestureDetector(
                        child: Icon(Icons.arrow_forward_ios, size: 22),
                        onTap: () {
                          HapticFeedback.mediumImpact();
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
                  Expanded(
                    child: Container(
                      child: FutureBuilder(
                        future:
                            voucherList.getVouchersByDate(startDate, endDate),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text('Erro'),
                            );
                          }
                          if (snapshot.hasData) {
                            if (snapshot.data!.length > 0) {
                              var vouchers =
                                  snapshot.data as List<getVoucherModel>;
                              return ListView.builder(
                                padding: EdgeInsets.all(20),
                                itemCount: vouchers.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      child: Container(
                                        color: Colors.transparent,
                                        child: LastAddedItem(
                                          voucher: vouchers[index],
                                        ),
                                      ),
                                      onTap: () => handleOpenBottomSheet(
                                          context, vouchers[index]));
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
          ),
        ],
      ),
    );
  }
}

void handleOpenBottomSheet(
    BuildContext context, getVoucherModel voucher) async {
  HapticFeedback.vibrate();
  var fetchedVouchers = Provider.of<getVoucherProvider>(context, listen: false);
  await showCupertinoModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      expand: true,
      context: context,
      builder: (context) => UpdateVoucherModal(voucher: voucher));
  fetchedVouchers.updateList(await fetchVouchers());
}
