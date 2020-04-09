import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:restoin/screens/register_screen.dart';
import 'package:restoin/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/widgets/custom_text_field.dart';

TextEditingController _emailController;

final FirebaseAuth _auth = FirebaseAuth.instance;

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => new _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _email;

  void _resetPassword() async {
    FocusScope.of(context).unfocus();
    setState(() {
      _email = _emailController.text.trim();
    });

    if (_email.isEmpty)
      _loginSnackBar(1);
    else {
      try {
        await _auth.sendPasswordResetEmail(email: _email);

        _loginSnackBar(4);
      } catch (e) {
        String error = e.toString();
        if (error.contains("INVALID_EMAIL"))
          _loginSnackBar(2);
        else if (error.contains("USER_NOT_FOUND")) _loginSnackBar(3);
        _emailController.clear();
      }
    }
  }

  void _loginSnackBar(int type) {
    Text message;

    switch (type) {
      case 1:
        message = Text("Invalid submission, textfield cannot be empty");
        break;
      case 2:
        message = Text("Invalid e-mail");
        break;
      case 3:
        message = Text("User not found");
        break;

      case 4:
        message =
            Text("Your reset email has been sent, please check your inbox");
        break;
    }

    final snackbar = SnackBar(
      content: message,
      duration: new Duration(seconds: 3),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  void initState() {
    _emailController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
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
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.1, left: screenWidth * 0.05),
                  alignment: Alignment.centerLeft,
                  child: new Icon(
                    FontAwesomeIcons.angleLeft,
                    color: Styles.black,
                    size: 37,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: screenHeight * 0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Reset Password",
                              style: Styles.customStyle("xLargeBoldBlack"),
                            ),
                            Text("Please input your e-mail to continue",
                                style: Styles.customStyle("mediumGray"))
                          ],
                        )),
                    Container(
                      padding: EdgeInsets.only(top: screenHeight * 0.12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(),
                            child: CustomTextField(
                                hint: "E-mail",
                                icon: FontAwesomeIcons.envelope,
                                isObscureText: false,
                                controller: _emailController),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          RaisedButton(
                            child: Text("Reset Password",
                                style: Styles.customStyle("mediumBoldWhite")),
                            onPressed: () => _resetPassword(),
                            color: Styles.orange,
                            highlightColor: Styles.darkOrange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.23),
                      child: Column(
                        children: <Widget>[
                          Container(
                              child: new RichText(
                            text: new TextSpan(
                              style: TextStyle(
                                fontFamily: "Futura",
                              ),
                              children: [
                                new TextSpan(
                                    text: "Don't have an account? ",
                                    style: Styles.customStyle("mediumGray")),
                                new TextSpan(
                                    text: "Sign up",
                                    style:
                                        Styles.customStyle("mediumBoldOrange"),
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterScreen()));
                                      })
                              ],
                            ),
                          )),
                          Padding(
                            padding: EdgeInsets.all(screenHeight * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Container(
                                    height: 1.0,
                                    width: 60.0,
                                    color: Styles.gray,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text("or",
                                      style: Styles.customStyle("mediumGray")),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Container(
                                      height: 1.0,
                                      width: 60.0,
                                      color: Styles.gray),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Image.asset(
                                      'assets/icon/facebook_logo.png',
                                      width: 25,
                                      height: 25)),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                    'assets/icon/google_logo.png',
                                    width: 25,
                                    height: 25),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ])),
      ),
    );
  }
}
