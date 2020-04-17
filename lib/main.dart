import 'package:flutter/material.dart';
import 'package:restoin/screens/change_payment_screen.dart';
import 'package:restoin/screens/food_detail_screen.dart';
import 'package:restoin/screens/notification_screen.dart';
import 'package:restoin/screens/order_main_screen.dart';
import 'package:restoin/screens/resto_menu_screen.dart';
import 'package:restoin/screens/voucher_detail_screen.dart';
import 'package:restoin/screens/voucher_search_screen.dart';
// import 'package:restoin/init_data.dart';

import 'screens/login_and_register/finger_login_screen.dart';
import 'screens/location_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/search_result_screen.dart';
import 'screens/search_screen.dart';
import 'screens/favorite_screen.dart';
import 'screens/home_screen.dart';
import 'screens/filter_screen.dart';
import 'screens/activity_screen.dart';
import 'screens/order_receipt_screen.dart';
import 'screens/order_status_screen.dart';
import 'styles.dart';

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
      initialRoute: '/notification',
      routes: {
        '/': (context) => FingerLoginScreen(),
        '/search': (context) => SearchScreen(),
        '/location': (context) => LocationScreen(),
        '/searchResult': (context) => SearchResultScreen(),
        '/favorite': (context) => FavoriteScreen(),
        '/home': (context) => HomeScreen(),
        '/filter': (context) => FilterScreen(),
        '/foodDetail': (context) => FoodDetailScreen(),
        '/restoMenu': (context) => RestoMenuScreen(),
        // '/initData': (context) => InitData(),
        '/activity': (context) => ActivityScreen(),
        '/orderReceipt': (context) => OrderReceiptScreen(),
        '/orderStatus': (context) => OrderStatusScreen(),
        '/order': (context) => OrderMainScreen(),
        '/restoMenu': (context) => RestoMenuScreen(),
        '/voucherSearch': (context) => VoucherSearchScreen(),
        '/voucherDetail': (context) =>
            VoucherDetailScreen(voucherCode: "CODE145"),
        '/changePayment': (context) => ChangePaymentScreen(),
        '/profile': (context) => ProfileScreen(),
        '/notification' : (context) => NotificationScreen()
      },
    );
  }
}
