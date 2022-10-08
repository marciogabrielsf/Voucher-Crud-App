import 'package:flutter/material.dart';
import 'package:flutter_test_project/constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Login
            Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),

            Row(
              children: [
                Text(
                  "Bem Vindo A ",
                  style: TextStyle(fontSize: 20, color: kSecondaryColor),
                ),
                Text(
                  "Design Company.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: kSecondaryColor),
                ),
              ],
            ),

            SizedBox(
              height: 25,
            ),
            //Email

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            //Password

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            //Sign in Button
            SizedBox(
              height: 25,
            ),

            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: kPrimaryColor),
                child: Center(
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      color: kTextColorInv,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () {
                print("CLICOU");
              },
            ),
            SizedBox(
              height: 25,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Precisa de uma conta? "),
                Text(
                  "Cadastre-se Agora.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
