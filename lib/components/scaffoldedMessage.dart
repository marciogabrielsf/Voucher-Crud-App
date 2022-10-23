import 'package:flutter/material.dart';

void showBottomMessage(
    BuildContext context, String message, Color backgroundColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: backgroundColor,
    ),
  );
}
