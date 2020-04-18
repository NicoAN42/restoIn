import 'package:flutter/material.dart';
import 'package:restoin/models/cart.dart';
import 'package:restoin/screens/change_order_type_screen.dart';
import 'package:restoin/screens/my_voucher_screen.dart';
import 'package:restoin/screens/privacy_policy_screen.dart';
import 'package:restoin/screens/terms_of_service_screen.dart';
import 'package:restoin/screens/wallet_screen.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/screens/edit_profile_screen.dart';
import 'package:launch_review/launch_review.dart';

import 'activity_screen.dart';
import 'help_screen.dart';
import 'notification_screen.dart';

class ProfileScreen extends StatefulWidget {
  final Cart c;
  final OrderTypeResult otr;

  const ProfileScreen({Key key, this.c, this.otr}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 4;
  bool isSwitched = false;
  bool isLanguageDisplay = false;
  String language = "English";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return new Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.fromLTRB(
            screenWidth * 0.05, screenWidth * 0.1, screenWidth * 0.05, 0),
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("My Profile", style: Styles.customStyle("mediumblack")),
            SizedBox(height: 10),
            GrayLine(),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Container(
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.1),
                      color: Styles.orange),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("RR Marcel Osmond A",
                        style: Styles.customStyle("midboldblack")),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfileScreen(
                                    c: widget.c, otr: widget.otr)));
                      },
                      child: Container(
                          child: Row(
                        children: <Widget>[
                          Text("Edit Profile",
                              style: Styles.customStyle("midblack")),
                          SizedBox(width: 20),
                          Icon(FontAwesomeIcons.angleRight, size: 16)
                        ],
                      )),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                //TODO: Go to Membership
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Membership",
                              style: Styles.customStyle("midblack")),
                          Icon(FontAwesomeIcons.angleRight, size: 16)
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    GrayLine()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ActivityScreen(c: widget.c, otr: widget.otr)));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("My Order",
                              style: Styles.customStyle("midblack")),
                          Icon(FontAwesomeIcons.angleRight, size: 16)
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    GrayLine()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyVoucherScreen()));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("My Voucher",
                              style: Styles.customStyle("midblack")),
                          Icon(FontAwesomeIcons.angleRight, size: 16)
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    GrayLine()
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: screenWidth * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Notification",
                            style: Styles.customStyle("midblack")),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                          activeTrackColor: Styles.peach,
                          activeColor: Styles.orange,
                        )
                      ],
                    ),
                  ),
                  GrayLine()
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isLanguageDisplay = !isLanguageDisplay;
                });
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Language",
                              style: Styles.customStyle("midblack")),
                          Row(
                            children: <Widget>[
                              Text(language,
                                  style: Styles.customStyle("midgray")),
                              SizedBox(width: 10),
                              isLanguageDisplay
                                  ? Icon(FontAwesomeIcons.angleUp, size: 16)
                                  : Icon(FontAwesomeIcons.angleDown, size: 16)
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    GrayLine()
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isLanguageDisplay,
              child: Container(
                color: Styles.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          language = "English";
                          isLanguageDisplay = false;
                        });
                      },
                      child: Container(
                        width: screenWidth * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("English",
                                style: Styles.customStyle("midgray")),
                            SizedBox(width: 26),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          language = "Indonesian";
                          isLanguageDisplay = false;
                        });
                      },
                      child: Container(
                        width: screenWidth * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("Indonesian",
                                style: Styles.customStyle("midgray")),
                            SizedBox(width: 26),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    GrayLine()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HelpScreen()));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Help", style: Styles.customStyle("midblack")),
                          Icon(FontAwesomeIcons.angleRight, size: 16)
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    GrayLine()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacyPolicyScreen()));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Privacy Policy",
                              style: Styles.customStyle("midblack")),
                          Icon(FontAwesomeIcons.angleRight, size: 16)
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    GrayLine()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermsOfServiceScreen()));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Terms of Service",
                              style: Styles.customStyle("midblack")),
                          Icon(FontAwesomeIcons.angleRight, size: 16)
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    GrayLine()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                LaunchReview.launch();
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Rate Us",
                              style: Styles.customStyle("midblack")),
                          Icon(FontAwesomeIcons.angleRight, size: 16)
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    GrayLine()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context, builder: (context) => LogoutPopUp());
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Logout",
                              style: Styles.customStyle("midboldblack")),
                          Icon(FontAwesomeIcons.angleRight, size: 16)
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
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
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          WalletScreen(c: widget.c, otr: widget.otr)));
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
              // Do nothing
              break;
          }
        },
      ),
    );
  }
}

class GrayLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(width: screenWidth * 0.9, height: 2, color: Styles.white);
  }
}

class LogoutPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.white,
            ),
          ),
          Positioned(
              top: 10,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child:
                    Image.asset("assets/icon/close.png", width: 15, height: 15),
              )),
          Positioned(
              top: 10,
              child: Container(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Are you sure to",
                        style: Styles.customStyle("mediumgray")),
                  ],
                ),
              )),
          Positioned(
              top: 40,
              child: Container(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Logout",
                        style: Styles.customStyle("largerboldblack")),
                  ],
                ),
              )),
          Positioned(
            bottom: 10,
            child: Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.only(
                        left: 40, top: 10, right: 40, bottom: 10),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/");
                    },
                    child:
                        Text("Yes", style: Styles.customStyle("mediumwhite")),
                    color: Styles.gray,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(width: 20),
                  FlatButton(
                    padding: EdgeInsets.only(
                        left: 40, top: 10, right: 40, bottom: 10),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No", style: Styles.customStyle("mediumwhite")),
                    color: Styles.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
