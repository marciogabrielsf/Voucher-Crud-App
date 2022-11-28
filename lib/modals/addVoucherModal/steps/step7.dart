import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_project/config/constants.dart';

class VoucherStep7 extends StatefulWidget {
  VoucherStep7({super.key});

  @override
  State<VoucherStep7> createState() => _VoucherStep7State();
}

class _VoucherStep7State extends State<VoucherStep7> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HapticFeedback.vibrate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: saveBottomSheet(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Icon(Icons.close),
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Voucher Adicionado com sucesso!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Boa! agora é só conferir no app!",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class saveBottomSheet extends StatefulWidget {
  const saveBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<saveBottomSheet> createState() => _saveBottomSheetState();
}

class _saveBottomSheetState extends State<saveBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
      color: kBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CupertinoButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            borderRadius: BorderRadius.circular(50),
            color: kPrimaryColor,
            child: Row(
              children: [
                Text(
                  'Fechar',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 10),
              ],
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        ],
      ),
    );
  }
}
