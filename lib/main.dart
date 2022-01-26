import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/transactions_repo.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Expert',
      theme: ThemeData(
        // errorColor: Colors.red,
        fontFamily: 'Sanomat',
        textTheme: ThemeData.light().textTheme,
      ),
      home: MyHomePage(repo: SharedPrefTransactionsRepo()),
    );
  }
}

class AppColors {
  static final primaryDarkBlue = Color(0xFF008388);
  static final lightBlue = Color(0xFF01B5BC);
}
