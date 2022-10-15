import 'package:flutter/material.dart';
import 'package:flutter_test_project/screens/home/components/util/cardWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          // appbar

          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Olá,', style: TextStyle(fontSize: 24)),
                    Text(
                      "Marcondes",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  balance: "R\$ 15.375,10",
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

          //buttons

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Color(0x39000000),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Icon(Icons.currency_exchange, size: 50),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vouchers",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "Vouchers mensais, tabelas",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Color(0x39000000),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Icon(Icons.insert_chart, size: 50),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Estatísticas",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "Faturamentos, Descontos",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),

          // last registries

          SizedBox(
            height: 30,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text(
                  "Últimos Registros",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFFC8C8C8),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
