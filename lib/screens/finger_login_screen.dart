import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';

import 'login_screen.dart';

class FingerLoginScreen extends StatefulWidget {
  @override
  _FingerLoginScreenState createState() => new _FingerLoginScreenState();
}

class _FingerLoginScreenState extends State<FingerLoginScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void _submitCommand() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.1),
                      child: Container(
                        alignment: Alignment.center,
                        child: new Image.asset('assets/icon/logo_oren.png',
                            width: 150, height: 150),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: new Image.asset('assets/icon/finger.png',
                              width: 150, height: 150),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: screenHeight * 0.05),
                          child: Text("Use Fingerprint to Sign In",
                              style: Styles.customStyle("largeBoldBlack")),
                        ),
                        Container(
                          child: Text(
                            "Place your finger on your device fingerprint scanner to continue",
                            style: Styles.customStyle("mediumGray"),
                            textAlign: TextAlign.center,
                          ),
                        )
                        // Container(
                        //     padding: EdgeInsets.only(
                        //         top: screenHeight * 0.01,
                        //         left: screenWidth * 0.05,
                        //         right: screenWidth * 0.05),
                        //     child: Text(
                        //       "Register your fingerprint for maximum security",
                        //       style: Styles.customStyle("mediumGray"),
                        //       textAlign: TextAlign.center,
                        //     )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.1),
                    child: Text("or", style: Styles.customStyle("mediumGray")),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: screenHeight * 0.01),
                    child: RaisedButton(
                      child: Text("Sign In With E-mail",
                          style: Styles.customStyle("mediumBoldWhite")),
                      onPressed: () => _submitCommand(),
                      color: Styles.orange,
                      highlightColor: Styles.darkOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
