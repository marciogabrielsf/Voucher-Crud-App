import 'package:flutter/material.dart';
import '../../../config/constants.dart';

class CardWidget extends StatelessWidget {
  final String balance;
  final String month;
  final Color color;

  const CardWidget({
    Key? key,
    required this.balance,
    required this.month,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Você vai receber",
                  style: TextStyle(color: kTextColorInv, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(balance,
                    style: TextStyle(
                        color: color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 35,
                ),
                Text(
                  month,
                  style: TextStyle(color: kTextColorInv, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
