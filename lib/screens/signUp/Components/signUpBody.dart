import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/api/signUpUser.dart';
import 'package:flutter_test_project/constants.dart';
import 'package:flutter_test_project/components/customInput.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //vars
  bool isTermChecked = false;

  var maskFormatter = new MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  // controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _cpfController = TextEditingController();

  // keys
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cadastro",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                Row(
                  children: [
                    Text("Inicie seu cadastro!",
                        style: TextStyle(fontSize: 20, color: kSecondaryColor)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                //name

                CustomInput(
                  placeholder: 'Nome Completo',
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  validator: (name) {
                    if (name == null || name.isEmpty) {
                      return 'Por favor, digite seu nome.';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 10,
                ),

                //CPF

                CustomInput(
                  placeholder: 'CPF',
                  controller: _cpfController,
                  inputFormatters: [maskFormatter],
                  keyboardType: TextInputType.number,
                  validator: (name) {
                    if (name == null || name.isEmpty) {
                      return 'Por favor, digite seu cpf.';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 10,
                ),

                //email

                CustomInput(
                  placeholder: 'E-mail',
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (name) {
                    if (name == null || name.isEmpty) {
                      return 'Por favor, digite seu e-mail.';
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(_emailController.text)) {
                      return 'Por favor, digite um e-mail válido';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 10,
                ),

                //Password

                CustomInput(
                  placeholder: 'Senha',
                  controller: _passwordController,
                  obscureText: true,
                  validator: (name) {
                    if (name == null || name.isEmpty) {
                      return 'Por favor, digite sua senha.';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 10,
                ),

                //confirmPassword

                CustomInput(
                  placeholder: 'Confirme a senha',
                  controller: _confirmPasswordController,
                  obscureText: true,
                  validator: (name) {
                    if (name == null || name.isEmpty) {
                      return 'Por favor, confirme sua senha.';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        value: isTermChecked,
                        onChanged: (checked) {
                          setState(() {
                            isTermChecked = !isTermChecked;
                          });
                        }),
                    GestureDetector(
                      child: Text(
                        "Eu concordo com os termos de uso.",
                      ),
                      onTap: () {
                        setState(() {
                          isTermChecked = !isTermChecked;
                        });
                      },
                    )
                  ],
                ),

                SizedBox(
                  height: 25,
                ),

                //SignUp button

                Container(
                  width: double.infinity,
                  height: 60,
                  child: CupertinoButton(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    alignment: Alignment.center,
                    child: Text(
                      "Cadastrar-se",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    pressedOpacity: 0.8,
                    onPressed: () async {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (_formkey.currentState!.validate()) {
                        if (isTermChecked) {
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          await signUp(
                              _emailController.text,
                              _cpfController.text,
                              _nameController.text,
                              _passwordController.text,
                              _confirmPasswordController.text,
                              context);
                          _emailController.clear();
                          _cpfController.clear();
                          _nameController.clear();
                          _passwordController.clear();
                          _confirmPasswordController.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Você precisa aceitar os termos para continuar.',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
