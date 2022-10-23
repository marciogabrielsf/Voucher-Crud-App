import 'package:flutter/material.dart';

class LastVoucherAdded extends StatelessWidget {
  const LastVoucherAdded({
    Key? key,
  }) : super(key: key);

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
          height: 200,
          decoration: BoxDecoration(
            color: Color(0xFFC8C8C8),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  LastAddedItem(),
                  LastAddedItem(),
                  LastAddedItem(),
                  LastAddedItem(),
                  LastAddedItem(),
                  LastAddedItem(),
                  LastAddedItem(),
                  LastAddedItem(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LastAddedItem extends StatelessWidget {
  const LastAddedItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Voucher',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF616161)),
            ),
            Text(
              'R\$ 198,00',
              style: TextStyle(fontSize: 16, color: Color(0x0FF138800)),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Eneva - 5405',
              style: TextStyle(fontSize: 12, color: Color(0xFF616161)),
            ),
            Text(
              '14 de outubro de 2022',
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
