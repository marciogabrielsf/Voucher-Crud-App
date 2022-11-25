import 'package:flutter/material.dart';

import '../../signUp/view/signUpScreen.dart';

class JoinNowButton extends StatelessWidget {
  const JoinNowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
