import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';

import 'register_confirm_screen.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;

class FingerRegisterScreen extends StatefulWidget {
  final FirebaseUser user;
  final String name;

  const FingerRegisterScreen({
    Key key,
    this.user,
    this.name,
  }) : super(key: key);

  @override
  _FingerRegisterScreenState createState() => new _FingerRegisterScreenState();
}

class _FingerRegisterScreenState extends State<FingerRegisterScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void _submitCommand() async {
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RegisterConfirmScreen(
                  user: widget.user,
                  name: widget.name,
                )));
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.1),
                    child: new Image.asset('assets/icon/logo_oren.png',
                        width: 50, height: 50),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: screenHeight * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Create Account",
                            style: Styles.customStyle("xLargeBoldBlack"),
                          ),
                          Text("Join us to discover more food",
                              style: Styles.customStyle("mediumGray"))
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: new Image.asset('assets/icon/finger2.png',
                              width: 150, height: 150),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: screenHeight * 0.05),
                          child: Text("Scan Now",
                              style: Styles.customStyle("largeBoldBlack")),
                        ),
                        Container(
                            padding: EdgeInsets.only(
                                top: screenHeight * 0.01,
                                left: screenWidth * 0.05,
                                right: screenWidth * 0.05),
                            child: Text(
                              "Register your fingerprint for maximum security",
                              style: Styles.customStyle("mediumGray"),
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: screenHeight * 0.05),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlatButton(
                              child: Text("Skip",
                                  style: Styles.customStyle(
                                      "mediumBoldUnderlineOrange")),
                              onPressed: () => _submitCommand(),
                            ),
                            RaisedButton(
                              child: Text("Sign Up",
                                  style: Styles.customStyle("mediumBoldWhite")),
                              onPressed: () => _submitCommand(),
                              color: Styles.orange,
                              highlightColor: Styles.darkOrange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ])),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.05),
                    child: Container(
                        alignment: Alignment.center,
                        child: new RichText(
                          text: new TextSpan(
                            style: TextStyle(
                              fontFamily: "Futura",
                            ),
                            children: [
                              new TextSpan(
                                  text: "Already have an account? ",
                                  style: Styles.customStyle("mediumGray")),
                              new TextSpan(
                                  text: "Sign in",
                                  style: Styles.customStyle("mediumBoldOrange"),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.popUntil(
                                          context, ModalRoute.withName("/"));
                                    })
                            ],
                          ),
                        )),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
