import 'package:flutter/material.dart';
import 'package:flutter_test_project/screens/home/view/HomeScreen.dart';
import 'package:flutter_test_project/screens/settings/view/settingsScreen.dart';

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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                icon: Icon(
                  Icons.home,
                  size: 32,
                )),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
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
