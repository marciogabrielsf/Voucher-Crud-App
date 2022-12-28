import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/config/constants.dart';
import 'package:provider/provider.dart';

import '../../../api/userLogin.dart';
import '../../../providers/authProvider.dart';
import '../../login/view/loginScreen.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var loggedUser = Provider.of<UserProvider>(context).user;
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nome:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            loggedUser.name,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Versão do aplicativo: ${appVersion}',
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: CupertinoButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              borderRadius: BorderRadius.circular(10),
              color: kPrimaryColor,
              child: Text(
                'Sair',
                style: TextStyle(color: kTextColorInv),
              ),
              onPressed: () {
                logOut(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
