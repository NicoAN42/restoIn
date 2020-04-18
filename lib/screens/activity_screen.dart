import 'package:flutter/material.dart';
import 'package:restoin/models/cart.dart';
import 'package:restoin/models/food.dart';
import 'package:restoin/models/restaurant.dart';
import 'package:restoin/screens/change_order_type_screen.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'order_receipt_screen.dart';

class ActivityScreen extends StatefulWidget {
  final Cart c;
  final OrderTypeResult otr;

  const ActivityScreen({Key key, this.c, this.otr}) : super(key: key);
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int _currentIndex = 3;
  Cart _bufferCart;

  @override
  void initState() {
    super.initState();
    _bufferCart = widget.c;
    if (widget.c.resto?.name == null) {
      _bufferCart = new Cart(
          foods: [],
          extras: [],
          qtys: [],
          notes: [],
          resto: new Restaurant(
            name: "Louise Branz",
          ));
      _bufferCart.foods.add(new Food(name: "Chunky Pie", price: 75000));
      _bufferCart.qtys.add(1);
      _bufferCart.notes.add("Don't use too much milk");
      _bufferCart.extras.add(new Extra(name: "Wafflepuff", price: 7500));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Header
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                  screenHeight * 0.05, screenWidth * 0.05, 20),
              child: Stack(
                children: <Widget>[
                  Container(width: screenWidth, height: 20),
                  Positioned(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        child: new Icon(
                          FontAwesomeIcons.angleLeft,
                          color: Styles.black,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: Text(
                      "Activity",
                      style: Styles.customStyle("largeboldblack"),
                    ),
                  )
                ],
              ),
            ),

            Container(
              width: screenWidth,
              height: 10,
              color: Styles.white,
            ),

            ActivitySection(
              date: "21/06/2020 12:10",
              orderId: "LB-018271",
              orderType: widget.otr.orderType ?? "Take away",
              restaurantName: _bufferCart.resto.name,
              screenWidth: screenWidth,
              status: "Preparing",
              c: _bufferCart,
              otr: widget.otr,
            ),

            ActivitySection(
              date: "21/06/2020 12:10",
              orderId: "LB-018271",
              orderType: "Take away",
              restaurantName: "Louise Branz",
              screenWidth: screenWidth,
              status: "Done",
            ),

            ActivitySection(
              date: "21/06/2020 12:10",
              orderId: "LB-018271",
              orderType: "Take away",
              restaurantName: "Louise Branz",
              screenWidth: screenWidth,
              status: "Canceled",
            ),
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
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pop(context);
              break;
            case 1:
              // Notification
              break;
            case 2:
              //  Wallet
              break;
            case 4:
              // Profile
              break;
          }
        },
      ),
    );
  }
}

class ActivitySection extends StatelessWidget {
  final String restaurantName;
  final String orderId;
  final String orderType;
  final String date;
  final String status;
  final double screenWidth;
  final Cart c;
  final OrderTypeResult otr;

  ActivitySection(
      {this.restaurantName,
      this.orderId,
      this.orderType,
      this.date,
      this.status,
      this.screenWidth,
      this.c,
      this.otr});

  Text getRestaurantName() {
    if (status.contains("Done") || status.contains("Canceled")) {
      return Text(restaurantName, style: Styles.customStyle("largeboldblack"));
    }
    return Text(restaurantName, style: Styles.customStyle("largeboldorange"));
  }

  Text getOrderType() {
    if (status.contains("Done")) {
      return Text(status, style: Styles.customStyle("mediumboldBlack"));
    }
    if (status.contains("Canceled"))
      return Text(status, style: Styles.customStyle("mediumboldRed"));
    return Text(status, style: Styles.customStyle("mediumboldorange"));
  }

  String getDate() {
    if (status.contains("Done")) return "Apr 20";
    if (status.contains("Canceled")) return "Mar 16";
    return "Now";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OrderReceiptScreen(c: c, otr: otr, status: status)));
      },
      child: Container(
          color: Colors.white,
          width: screenWidth,
          padding: EdgeInsets.only(
              left: screenWidth * 0.05, right: screenWidth * 0.05),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        getRestaurantName(),
                        SizedBox(height: 5),
                        Text(otr?.orderType ?? "Take away",
                            style: Styles.customStyle("mediumgray")),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(getDate(),
                            style: Styles.customStyle("mediumblack")),
                        SizedBox(height: 7.5),
                        getOrderType(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: screenWidth,
                height: 2,
                color: Styles.white,
              )
            ],
          )),
    );
  }
}
