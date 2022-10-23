import 'package:flutter/material.dart';

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
                  setState(() {});
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
