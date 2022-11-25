import 'package:flutter/material.dart';

class ButtonWithLabel extends StatelessWidget {
  final Icon icon;
  final String mainText;
  final String? subText;

  const ButtonWithLabel({
    Key? key,
    required this.icon,
    required this.mainText,
    this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              child: icon,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainText,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  subText ?? '',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        Icon(Icons.arrow_forward_ios)
      ],
    );
  }
}
