import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:restoin/screens/register_screen.dart';
import 'package:restoin/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/widgets/custom_text_field.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _email;
  String _pw;
  String _valEmail = "guest@gmail.com";
  String _valPw = "guest123";

  void _submitCommand() {
    _email = _emailController.text;
    _pw = _passwordController.text;

    if (_email != _valEmail && _pw != _valPw) {
      _loginCommand(1);
      _emailController.clear();
      _passwordController.clear();
    } else if (_email != _valEmail) {
      _loginCommand(2);
      _emailController.clear();
    } else if (_pw != _valEmail) {
      _loginCommand(3);
      _passwordController.clear();
    } else {
      //LOGIN
    }
  }

  void _loginCommand(int type) {
    Text message;

    switch (type) {
      case 1:
        message = Text("Invalid e-mail and password");
        break;
      case 2:
        message = Text("Invalid e-mail");
        break;
      case 3:
        message = Text("Invalid password");
        break;
    }

    final snackbar = SnackBar(
      content: message,
      duration: new Duration(seconds: 2),
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
                      padding: EdgeInsets.only(top: screenHeight * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Login",
                            style: Styles.customStyle("xLargeBoldBlack"),
                          ),
                          Text("Please sign in to continue",
                              style: Styles.customStyle("mediumGray"))
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.only(top: screenHeight * 0.07),
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
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.02),
                          child: CustomTextField(
                              hint: "Password",
                              icon: FontAwesomeIcons.lock,
                              isSuffix: true,
                              isObscureText: true,
                              controller: _passwordController),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.01),
                            //Add GestureDetector
                            child: Text("Forgot your password?",
                                style: Styles.customStyle("smallGray")))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        // SizedBox(
                        //   width: 60,
                        //   child: RaisedButton(
                        //     child: new Icon(MdiIcons.fingerprint,
                        //         color: Styles.white),
                        //     onPressed: () => _submitCommand(),
                        //     color: Styles.orange,
                        //     highlightColor: Styles.darkOrange,
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(10)),
                        //   ),
                        // ),
                        RaisedButton(
                          child: Text("Sign In",
                              style: Styles.customStyle("mediumBoldWhite")),
                          onPressed: () => _submitCommand(),
                          color: Styles.orange,
                          highlightColor: Styles.darkOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.18),
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
                                  style: Styles.customStyle("mediumBoldOrange"),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen()),
                                      );
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
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                              child: Image.asset('assets/icon/google_logo.png',
                                  width: 25, height: 25),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
