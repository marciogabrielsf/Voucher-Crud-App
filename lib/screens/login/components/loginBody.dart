import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/api/fetchLogin.dart';
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
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Form(
          key: _formkey,
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
                      child: TextFormField(
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Por favor, Digite seu email.';
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(_emailController.text)) {
                            return 'Por favor, digite um e-mail válido';
                          }
                          return null;
                        },
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
                      child: TextFormField(
                        validator: (senha) {
                          if (senha == null || senha.isEmpty) {
                            return 'Por favor, Digite sua senha.';
                          } else
                            return null;
                        },
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
                    onTap: () async {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (_formkey.currentState!.validate()) {
                        login(_emailController.text, _passwordController.text,
                            context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      }

                      //Navigator.pushReplacement(
                      //  context,
                      //  MaterialPageRoute(
                      //    builder: (context) => HomeScreen(),
                      //  ),
                      //);
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
      ),
    );
  }
}
