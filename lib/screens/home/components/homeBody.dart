// packages
import 'package:flutter/material.dart';

// components

import 'package:flutter_test_project/screens/home/components/util/buttonWithLabel.dart';
import 'package:flutter_test_project/screens/home/components/util/cardWidget.dart';
import 'package:flutter_test_project/screens/home/components/util/lastAdded.dart';
import 'package:flutter_test_project/screens/login/loginScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// functions

import 'package:flutter_test_project/api/fetchLogin.dart';

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

  @override
  Widget build(BuildContext context) {
    var loggedUser = Provider.of<UserProvider>(context).user;
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
                    GestureDetector(
                      child: Text(
                        loggedUser.firstName,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        logOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
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
                  balance: "R\$ 15.430,10",
                  color: Color(0xFF1ED800),
                  month: "Neste Mês",
                ),
                CardWidget(
                  balance: "R\$ 9.543,20",
                  color: Color(0xFF1ED800),
                  month: "Próximo Mês",
                ),
                CardWidget(
                  balance: "R\$ 3.415,02",
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
            child: ButtonWithLabel(
              icon: Icon(
                Icons.currency_exchange,
                size: 50,
              ),
              mainText: 'Vouchers',
              subText: 'Vouchers mensais, tabelas',
            ),
          ),

          SizedBox(
            height: 20,
          ),

          // Statistics Button

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ButtonWithLabel(
                icon: Icon(
                  Icons.insert_chart,
                  size: 50,
                ),
                mainText: "Estatísticas",
                subText: "Valores, Descontos",
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
    ));
  }
}
