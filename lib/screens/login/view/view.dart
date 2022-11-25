import 'package:flutter/material.dart';
import 'package:flutter_test_project/api/fetchLogin.dart';
import 'package:flutter_test_project/config/constants.dart';
import 'package:flutter_test_project/screens/login/widgets/joinNowButton.dart';
import 'package:flutter/cupertino.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool isFetching = false;

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
                        "Bem Vindo ao ",
                        style: TextStyle(fontSize: 20, color: kSecondaryColor),
                      ),
                      Text(
                        "VoucherLab.",
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

                  // login button

                  Container(
                    width: double.infinity,
                    height: 60,
                    child: CupertinoButton(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      alignment: Alignment.center,
                      child: isFetching
                          ? Container(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator.adaptive(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    kTextColorInv),
                              ),
                            )
                          : Text(
                              "Entrar",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                      pressedOpacity: 0.8,
                      onPressed: () async {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            isFetching = true;
                          });
                          await login(_emailController.text,
                              _passwordController.text, context);
                          setState(() {
                            isFetching = false;
                          });
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        }
                      },
                      color: kPrimaryColor,
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  JoinNowButton(),

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
