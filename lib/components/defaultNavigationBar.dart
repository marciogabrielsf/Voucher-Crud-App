import 'package:flutter/material.dart';
import 'package:flutter_test_project/screens/home/HomeScreen.dart';

class DefaultBottomNavigation extends StatefulWidget {
  const DefaultBottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  State<DefaultBottomNavigation> createState() =>
      DefaultBottomNavigationState();
}

class DefaultBottomNavigationState extends State<DefaultBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                icon: Icon(
                  Icons.home,
                  size: 32,
                )),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                size: 32,
              ),
            )
          ],
        ),
      ),
    );
  }
}
