import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScanQRScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return new Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: screenWidth,
              height: screenHeight,
              color: Styles.black,
            ),
            Positioned(
                top: screenWidth * 0.1,
                left: screenWidth * 0.05,
                width: screenWidth * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        child: new Icon(
                          FontAwesomeIcons.angleLeft,
                          color: Styles.white,
                          size: 28,
                        ),
                      ),
                    ),
                    Text(
                      "#CAMERA",
                      style: Styles.customStyle("largeOrange"),
                    ),
                    Text("Help", style: Styles.customStyle("mediumBoldWhite"))
                  ],
                )),
            Positioned(
                top: screenHeight * 0.35,
                left: (screenWidth - screenHeight * 0.15) / 2,
                child: Container(
                  height: screenHeight * 0.15,
                  width: screenHeight * 0.15,
                  color: Styles.gray,
                  child: Text("#AREASCAN",
                      style: Styles.customStyle("largeOrange")),
                )),
            Positioned(
                bottom: screenHeight * 0.1,
                child: Icon(
                  FontAwesomeIcons.camera,
                  color: Styles.orange,
                ))
          ],
        ),
      ),
    );
  }
}
