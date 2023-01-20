import 'package:flutter/material.dart';
import 'package:flutter_test_project/api/fetchVouchers.dart';
import 'package:flutter_test_project/config/constants.dart';
import 'package:flutter_test_project/providers/getVoucherProvider.dart';
import 'package:flutter_test_project/screens/home/view/view.dart';
import 'package:flutter_test_project/screens/settings/view/view.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/defaultAddVoucherButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    var fetchedVouchers =
        Provider.of<getVoucherProvider>(context, listen: false);

    pageController = PageController(initialPage: this.pageIndex);

    fetchVouchers().then((value) {
      if (value.isNotEmpty) {
        fetchedVouchers.updateList(value);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          HomeBody(),
          SettingsView(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      floatingActionButton: DefaultAddVoucherButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimaryColor,
        iconSize: 30,
        onTap: (index) => {
          setState(() {
            this.pageIndex = index;
          }),
          pageController.jumpToPage(index)
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: this.pageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home Screen'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings Screen')
        ],
      ),
    );
  }
}
