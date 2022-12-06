import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_project/providers/authProvider.dart';
import 'package:flutter_test_project/providers/getVoucherProvider.dart';
import 'package:flutter_test_project/screens/loading/loadingScreen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'config/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  initializeDateFormatting();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => getVoucherProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        unselectedWidgetColor: kSecondaryColor,
        toggleableActiveColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: kTextColor,
              fontFamily: 'Inter',
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoadingScreen(),
    );
  }
}
