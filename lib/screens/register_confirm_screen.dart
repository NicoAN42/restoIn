import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/styles.dart';

class RegisterConfirmScreen extends StatefulWidget {
  @override
  _RegisterConfirmScreenState createState() =>
      new _RegisterConfirmScreenState();
}

class _RegisterConfirmScreenState extends State<RegisterConfirmScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void _submitCommand() {
    final snackbar = SnackBar(
      content: Text("Email has been resent. Please check your inbox."),
      duration: new Duration(seconds: 3),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
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
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.1, left: screenWidth * 0.05),
              child: GestureDetector(
                onTap: () {
                  Navigator.popUntil(context, ModalRoute.withName("/"));
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Icon(
                    FontAwesomeIcons.angleLeft,
                    color: Styles.orange,
                    size: 37,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.02),
                      child: Container(
                        alignment: Alignment.center,
                        child: new Image.asset('assets/icon/logo_oren.png',
                            width: 150, height: 150),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: screenHeight * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "You're almost there",
                            style: Styles.customStyle("largerBoldBlack"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: screenHeight * 0.05,
                                left: screenWidth * 0.1,
                                right: screenWidth * 0.1),
                            child: Text(
                              "Please click the link on the email that we've send to confirm your registration.",
                              style: Styles.customStyle("mediumGray"),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.only(top: screenHeight * 0.05),
                    alignment: Alignment.center,
                    child: RaisedButton(
                      child: Text("Resend Email",
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
            ),
          ]),
        ),
      ),
    );
  }
}
