import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:restoin/screens/forgot_password_screen.dart';
import 'package:restoin/screens/home_screen.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:restoin/screens/register_screen.dart';
import 'package:restoin/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/widgets/custom_text_field.dart';

TextEditingController _emailController;
TextEditingController _passwordController;

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _email;
  String _pw;

  TextStyle forgotPasswordStyle = Styles.customStyle("smallGray");

  void _submitCommand() {
    FocusScope.of(context).unfocus();
    setState(() {
      _email = _emailController.text.trim();
      _pw = _passwordController.text;
    });

    if (_email.isEmpty || _pw.isEmpty) {
      _loginSnackBar(4);
      _emailController.clear();
      _passwordController.clear();
    } else
      _login(_email, _pw);
  }

  void _resetPassword() async {
    Navigator.pop(context);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
  }

  void _loginSnackBar(int type) {
    Text message;

    switch (type) {
      case 1:
        message = Text(
          "User not found",
        );
        break;
      case 2:
        message = Text("Invalid e-mail");
        break;
      case 3:
        message = Text("Invalid password");
        break;
      case 4:
        message = Text("Invalid submission, textfield cannot be empty");
        break;
      case 5:
        message = Text("Email hasn't been verified, please check your inbox.");
        break;
    }

    final snackbar = SnackBar(
      content: message,
      duration: new Duration(seconds: 3),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  Future<void> _login(String email, String pw) async {
    try {
      FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: pw,
      ))
          .user;

      if (!user.isEmailVerified) throw Exception("EMAIL_NOT_VERIFIED");

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    user: user,
                  )));
    } catch (e) {
      String error = e.toString();
      if (error.contains("USER_NOT_FOUND")) {
        _loginSnackBar(1);
        _emailController.clear();
        _passwordController.clear();
      } else if (error.contains("INVALID_EMAIL")) {
        _loginSnackBar(2);
        _emailController.clear();
      } else if (error.contains("WRONG_PASSWORD")) {
        _loginSnackBar(3);
        _passwordController.clear();
      } else if (error.contains("EMAIL_NOT_VERIFIED")) {
        _loginSnackBar(5);
      }
    }
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                            child: GestureDetector(
                              onTap: () => _resetPassword(),
                              onTapDown: (TapDownDetails details) =>
                                  setState(() {
                                forgotPasswordStyle =
                                    Styles.customStyle("smallUnderlineGray");
                              }),
                              onTapUp: (TapUpDetails details) => setState(() {
                                forgotPasswordStyle =
                                    Styles.customStyle("smallGray");
                              }),
                              child: Text("Forgot your password?",
                                  style: forgotPasswordStyle),
                            ))
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
