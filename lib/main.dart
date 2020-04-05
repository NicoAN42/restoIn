import 'package:flutter/material.dart';
// import 'package:restoin/screens/login_screen.dart';
import 'package:restoin/styles.dart';

import 'screens/finger_login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          cursorColor: Styles.darkOrange,
          primarySwatch: Colors.blue,
          fontFamily: 'Futura',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => FingerLoginScreen(),
        });
  }
}
