import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/styles.dart';
import 'package:restoin/widgets/custom_text_field.dart';

TextEditingController _locationController = new TextEditingController();

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => new _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return new Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            width: screenWidth,
            height: screenHeight,
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.05,
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05),
                    height: 50 + screenHeight * 0.05,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            child: new Icon(
                              FontAwesomeIcons.angleLeft,
                              color: Styles.black,
                              size: 28,
                            ),
                          ),
                        ),
                        SizedBox(
                            width: screenWidth * 0.9 - 28,
                            height: 37,
                            child: CustomLocationField(
                                controller: _locationController)),
                      ],
                    )),
                Stack(
                  children: <Widget>[
                    Container(
                      height: screenHeight * 0.888,
                      width: screenWidth,
                      child: new Image.asset("assets/icon/map.png",
                          fit: BoxFit.fill),
                    ),
                    Positioned(
                      left: screenWidth * 0.05,
                      bottom: screenHeight * 0.03,
                      child: SizedBox(
                        height: 60,
                        width: screenWidth * 0.9,
                        child: RaisedButton(
                          color: Styles.orange,
                          child: Text("Confirm",
                              style: Styles.customStyle("largeBoldWhite")),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
