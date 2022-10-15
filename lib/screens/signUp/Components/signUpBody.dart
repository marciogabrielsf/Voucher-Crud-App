import 'package:flutter/material.dart';
import 'package:flutter_test_project/constants.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isTermChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
              CustomInput(placeholder: 'Nome'),
              SizedBox(
                height: 10,
              ),
              CustomInput(placeholder: 'E-mail'),
              SizedBox(
                height: 10,
              ),
              // senha
              CustomInput(
                placeholder: 'Senha',
                obscureText: true,
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
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: kPrimaryColor),
                  child: Center(
                    child: Text(
                      "Cadastrar-se",
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
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  final Color? textColor;
  final Color? placeholderColor;
  final String? placeholder;
  final Color? backgroundColor;
  final bool? obscureText;

  const CustomInput(
      {Key? key,
      this.backgroundColor,
      this.textColor,
      this.placeholder,
      this.placeholderColor,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          obscureText: obscureText ?? false,
          style: TextStyle(color: textColor ?? Colors.black),
          decoration: InputDecoration(
            hintText: placeholder ?? 'placeholder',
            hintStyle: TextStyle(color: placeholderColor ?? kSecondaryColor),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
