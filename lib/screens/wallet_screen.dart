import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restoin/models/cart.dart';
import 'package:restoin/screens/change_order_type_screen.dart';
import 'package:restoin/screens/notification_screen.dart';
import 'package:restoin/screens/profile_screen.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'activity_screen.dart';

class WalletScreen extends StatefulWidget {
  final Cart c;
  final OrderTypeResult otr;

  const WalletScreen({Key key, this.c, this.otr}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return new Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.34,
                ),
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.29,
                  color: Styles.orange,
                ),
                Positioned(
                    top: screenHeight * 0.03,
                    right: 0,
                    child: Image.asset("assets/icon/half_logo.png",
                        height: screenHeight * 0.26)),
                Positioned(
                    top: screenWidth * 0.1,
                    width: screenWidth,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Text("E - Wallet",
                              style: Styles.customStyle("largeboldwhite")),
                          SizedBox(height: 10),
                          Container(
                              width: screenWidth * 0.9,
                              height: 2,
                              color: Colors.white),
                          SizedBox(height: 20),
                          Text("Saldo OYO",
                              style: Styles.customStyle("mediumwhite")),
                          SizedBox(height: 10),
                          Text("IDR 750.000",
                              style: Styles.customStyle("largerboldwhite")),
                        ],
                      ),
                    )),
                Positioned(
                    bottom: screenHeight * 0.01,
                    child: Container(
                      width: screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: screenHeight * 0.08,
                            height: screenHeight * 0.08,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.015),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Styles.lightGray,
                                  blurRadius:
                                      9, // has the effect of softening the shadow
                                  spreadRadius:
                                      3, // has the effect of extending the shadow
                                  offset: Offset(
                                    0, // horizontal, move right 10
                                    0, // vertical, move down 10
                                  ),
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(FontAwesomeIcons.upload,
                                    color: Color(0xFFFF6D00),
                                    size: screenHeight * 0.04),
                                Text("Pay",
                                    style: Styles.customStyle("midorange"))
                              ],
                            ),
                          ),
                          Container(
                            width: screenHeight * 0.08,
                            height: screenHeight * 0.08,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.015),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Styles.lightGray,
                                  blurRadius:
                                      9, // has the effect of softening the shadow
                                  spreadRadius:
                                      3, // has the effect of extending the shadow
                                  offset: Offset(
                                    0, // horizontal, move right 10
                                    0, // vertical, move down 10
                                  ),
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(FontAwesomeIcons.plus,
                                    color: Color(0xFFFF6D00),
                                    size: screenHeight * 0.04),
                                Text("Top Up",
                                    style: Styles.customStyle("midorange"))
                              ],
                            ),
                          ),
                          Container(
                            width: screenHeight * 0.08,
                            height: screenHeight * 0.08,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.015),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Styles.lightGray,
                                  blurRadius:
                                      9, // has the effect of softening the shadow
                                  spreadRadius:
                                      3, // has the effect of extending the shadow
                                  offset: Offset(
                                    0, // horizontal, move right 10
                                    0, // vertical, move down 10
                                  ),
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Image.asset("assets/icon/o_voucher.png",
                                    height: screenHeight * 0.04),
                                Text("Voucher",
                                    style: Styles.customStyle("midorange"))
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
            Container(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.05, 20, screenWidth * 0.05, 0),
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("History",
                            style: Styles.customStyle("largeboldblack")),
                        Text("Show All",
                            style: Styles.customStyle("mediumorange")),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: screenWidth, height: 2, color: Styles.white)
                  ],
                )),
            TransactionSection(
                restaurantName: "Louise Branz",
                date: "Apr 20",
                paymentType: "Cash",
                paymentTotal: 270000),
            TransactionSection(
                restaurantName: "Louise Branz",
                date: "Apr 20",
                paymentType: "OYO",
                paymentTotal: 270000),
            TransactionSection(
                restaurantName: "Louise Branz",
                date: "Apr 20",
                paymentType: "Cash",
                paymentTotal: 270000),
            TransactionSection(
                restaurantName: "Louise Branz",
                date: "Apr 20",
                paymentType: "Cash",
                paymentTotal: 270000),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Image.asset("assets/icon/o_home.png", width: 20, height: 20)
                : Image.asset("assets/icon/b_home.png", width: 20, height: 20),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Image.asset("assets/icon/o_notif.png", width: 20, height: 20)
                : Image.asset("assets/icon/b_notif.png", width: 20, height: 20),
            title: Text('Notification'),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Image.asset("assets/icon/o_wallet.png", width: 20, height: 20)
                : Image.asset("assets/icon/b_wallet.png",
                    width: 20, height: 20),
            title: Text('Wallet'),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? Image.asset("assets/icon/o_note.png", width: 20, height: 20)
                : Image.asset("assets/icon/b_note.png", width: 20, height: 20),
            title: Text('Note'),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4
                ? Image.asset("assets/icon/o_profile.png",
                    width: 20, height: 20)
                : Image.asset("assets/icon/b_profile.png",
                    width: 20, height: 20),
            title: Text('Profile'),
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pop(context);
              break;
            case 1:
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NotificationScreen(c: widget.c, otr: widget.otr)));
              break;
            case 2:
              // Do nothing
              break;
            case 3:
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ActivityScreen(c: widget.c, otr: widget.otr)));
              break;
            case 4:
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfileScreen(c: widget.c, otr: widget.otr)));
              break;
          }
        },
      ),
    );
  }
}

class TransactionSection extends StatelessWidget {
  final String restaurantName;
  final String date;
  final String paymentType;
  final int paymentTotal;
  final formatter =
      NumberFormat.currency(locale: "id", symbol: "", decimalDigits: 0);

  TransactionSection(
      {this.restaurantName, this.date, this.paymentType, this.paymentTotal});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding:
          EdgeInsets.fromLTRB(screenWidth * 0.05, 0, screenWidth * 0.05, 0),
      width: screenWidth,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.025),
                        image: DecorationImage(
                            image:
                                AssetImage("assets/restaurant/louiseBranz.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(restaurantName,
                          style: Styles.customStyle("mediumboldblack")),
                      SizedBox(height: 10),
                      Text(date, style: Styles.customStyle("midblack"))
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(paymentType, style: Styles.customStyle("midblack")),
                  SizedBox(height: 10),
                  Text("IDR " + formatter.format(paymentTotal),
                      style: Styles.customStyle("midboldblack"))
                ],
              )
            ],
          ),
          SizedBox(height: 10),
          Container(width: screenWidth, height: 2, color: Styles.white)
        ],
      ),
    );
  }
}
