// packages
import 'package:flutter/material.dart';
import 'package:flutter_test_project/config/constants.dart';
import 'package:flutter_test_project/providers/getVoucherProvider.dart';

// components

import 'package:flutter_test_project/screens/home/widgets/buttonWithLabel.dart';
import 'package:flutter_test_project/screens/home/widgets/cardWidget.dart';
import 'package:flutter_test_project/screens/home/widgets/lastAdded.dart';
import 'package:flutter_test_project/screens/voucherList/view/voucherListScreen.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// functions

// providers

import 'package:flutter_test_project/providers/authProvider.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final _pageController = PageController();
  NumberFormat numberFormat =
      NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2);

  DateTime today = DateTime.now();
  late DateTime plusOneMonth =
      DateTime.utc(today.year, today.month + 1, startDay);
  late DateTime todayMonth = DateTime.utc(today.year, today.month, startDay);
  late DateTime oneMonthAgo =
      DateTime.utc(today.year, today.month - 1, startDay);
  late DateTime twoMonthsAgo =
      DateTime.utc(today.year, today.month - 2, startDay);

  @override
  Widget build(BuildContext context) {
    var loggedUser = Provider.of<UserProvider>(context).user;
    getVoucherProvider voucherList = Provider.of<getVoucherProvider>(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // appBar

            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Olá,', style: TextStyle(fontSize: 24)),
                      Text(
                        loggedUser.firstName,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //card

            Container(
              height: 160,
              child: PageView(
                controller: _pageController,
                children: [
                  CardWidget(
                    balance:
                        "${numberFormat.format(voucherList.getVoucherFilteredSum(twoMonthsAgo, oneMonthAgo) * (1 - profitDiscount))}",
                    color: Color(0xFF1ED800),
                    month: "Neste Mês",
                  ),
                  CardWidget(
                    balance:
                        "${numberFormat.format(voucherList.getVoucherFilteredSum(oneMonthAgo, todayMonth) * (1 - profitDiscount))}",
                    color: Color(0xFF1ED800),
                    month: "Próximo Mês",
                  ),
                  CardWidget(
                    balance:
                        "${numberFormat.format(voucherList.getVoucherFilteredSum(todayMonth, plusOneMonth) * (1 - profitDiscount))}",
                    color: Color(0xFF1ED800),
                    month: "Em Dois Meses",
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 25,
            ),

            // dots indicators

            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: ScrollingDotsEffect(
                activeDotColor: Color(0xFF6A6A6A),
                dotWidth: 12,
                dotHeight: 12,
              ),
            ),

            SizedBox(
              height: 25,
            ),

            //Voucher Button

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VoucherListScreen(),
                  ),
                ),
                child: Container(
                  color: Colors.transparent,
                  child: ButtonWithLabel(
                    icon: Icon(
                      Icons.attach_money,
                      size: 50,
                    ),
                    mainText: 'Vouchers',
                    subText: 'Vouchers mensais, tabelas',
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // Statistics Button

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VoucherListScreen(),
                    ),
                  ),
                  child: Container(
                    color: Colors.transparent,
                    child: ButtonWithLabel(
                      icon: Icon(
                        Icons.insert_chart,
                        size: 50,
                      ),
                      mainText: "Estatísticas",
                      subText: "Valores, Descontos",
                    ),
                  ),
                )),

            // last registries

            SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: LastVoucherAdded(),
            ),

            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
