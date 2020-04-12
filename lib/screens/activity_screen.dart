import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int _currentIndex = 3;

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
              orderType: "Take away",
              restaurantName: "Louise Branz",
              screenWidth: screenWidth,
              status: "Preparing",
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
          switch(index) {
            case 0:
              Navigator.pushNamed(context, '/home');
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

  ActivitySection({this.restaurantName, this.orderId, this.orderType, this.date, this.status, this.screenWidth});

  Text getRestaurantName() {
    if (status.contains("Done") || status.contains("Canceled")) {
      return Text(restaurantName, style: Styles.customStyle("largeboldgray"));
    }
    return Text(restaurantName, style: Styles.customStyle("largeboldorange"));
  }

  Text getOrderType() {
    if (status.contains("Done") || status.contains("Canceled")) {
      return Text(status, style: Styles.customStyle("midboldgray"));
    }
    return Text(status, style: Styles.customStyle("midboldorange"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: screenWidth,
      padding: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
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
                    Text("Order Id", style: Styles.customStyle("mediumblack")),
                    SizedBox(height: 5),
                    Text(orderId, style: Styles.customStyle("mediumboldblack")),
                  ],
                ),
              ),
              Container(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(orderType, style: Styles.customStyle("midgray")),
                    SizedBox(height: 7.5),
                    Text(date, style: Styles.customStyle("midblack")),
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
      )
    );
  }
}