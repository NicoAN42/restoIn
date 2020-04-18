import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int _currentIndex = 4;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return new Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.fromLTRB(
            screenWidth * 0.05, screenWidth * 0.1, screenWidth * 0.05, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            width: screenWidth * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("My Profile", style: Styles.customStyle("mediumblack")),
                GestureDetector(
                    onTap: () {
                      //TODO : Save profile data
                      Navigator.pop(context);
                    },
                    child:
                        Text("Save", style: Styles.customStyle("mediumorange")))
              ],
            ),
          ),
          SizedBox(height: 10),
          GrayLine(),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Container(
                width: screenWidth * 0.2,
                height: screenWidth * 0.2,
                child: Center(
                    child:
                        Text("Edit", style: Styles.customStyle("mediumwhite"))),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.1),
                    color: Colors.brown),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: screenWidth * 0.7 - 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("RR Marcel Osmond A",
                            style: Styles.customStyle("midboldblack")),
                        Image.asset("assets/icon/centang.png",
                            width: 16, height: 16)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Change Name
                    },
                    child: Container(
                        child: Row(
                      children: <Widget>[
                        Text("Change Name",
                            style: Styles.customStyle("midgray")),
                      ],
                    )),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15),
                Text("Email", style: Styles.customStyle("midgray")),
                Container(
                  width: screenWidth * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("contoh@gmail.com",
                          style: Styles.customStyle("midblack")),
                      Image.asset("assets/icon/centang.png",
                          width: 16, height: 16)
                    ],
                  ),
                ),
                SizedBox(height: 15),
                GrayLine()
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15),
                Text("Phone", style: Styles.customStyle("midgray")),
                Container(
                  width: screenWidth * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("+6285627477182",
                          style: Styles.customStyle("midblack")),
                      Image.asset("assets/icon/centang.png",
                          width: 16, height: 16)
                    ],
                  ),
                ),
                SizedBox(height: 15),
                GrayLine()
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: screenWidth * 0.9,
            child: Column(
              children: <Widget>[
                Text("Link Your Account",
                    style: Styles.customStyle("mediumgray")),
                SizedBox(height: 10),
                Container(
                  width: screenWidth * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          width: screenWidth * 0.3,
                          height: 2,
                          color: Styles.white),
                      Image.asset("assets/icon/facebook_logo.png",
                          width: 25, height: 25),
                      Image.asset("assets/icon/google_logo.png",
                          width: 25, height: 25),
                      Container(
                          width: screenWidth * 0.3,
                          height: 2,
                          color: Styles.white),
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
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
          setState(() {
            _currentIndex = index;
          });
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
