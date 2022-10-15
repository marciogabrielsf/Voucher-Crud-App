import 'package:flutter/material.dart';
import 'package:flutter_test_project/constants.dart';
import 'package:flutter_test_project/screens/home/HomeScreen.dart';
import 'package:flutter_test_project/screens/signUp/signUpScreen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
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
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Senha',
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
                    print("Email: ${_emailController.text}");
                    print("Senha: ${_passwordController.text}");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 25,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Precisa de uma conta? "),
                    GestureDetector(
                      child: Text(
                        "Junte-se agora.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
