import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';

class CustomInput extends StatelessWidget {
  final Color? textColor;
  final Color? placeholderColor;
  final String? placeholder;
  final Color? backgroundColor;
  final bool? obscureText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const CustomInput({
    Key? key,
    this.backgroundColor,
    this.textColor,
    this.placeholder,
    this.placeholderColor,
    this.obscureText,
    required this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          validator: validator,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
          style: TextStyle(color: textColor ?? Colors.black),
          controller: controller,
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
