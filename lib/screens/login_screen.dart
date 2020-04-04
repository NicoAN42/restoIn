import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _newNameController = TextEditingController();
TextEditingController _newEmailController = TextEditingController();
TextEditingController _newPasswordController = TextEditingController();
TextEditingController _newConfirmPasswordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return new Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: screenWidth,
            height: screenHeight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 75.0),
                    child: new Image.asset('assets/icon/logo_oren.png',
                        width: 50, height: 50),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 75.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Login",
                            style: Styles.loginTitle,
                          ),
                          Text("Please sign in to continue.",
                              style: Styles.loginDesc)
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 75.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(),
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    // hintStyle: ,
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 13.5),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Styles.gray, width: 2.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2.0)),
                                    prefixIcon: new Icon(
                                        FontAwesomeIcons.envelope,
                                        size: 20)
                                    // Image.asset(
                                    //     'assets/icon/email_abu.png',
                                    //     width: 50,
                                    //     height: 50)
                                    ),
                                obscureText: false,
                              )),
                          Padding(
                              padding: EdgeInsets.only(),
                              child: TextField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    // hintStyle: ,
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 13.5),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Styles.gray, width: 2.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2.0)),
                                    prefixIcon: Container(
                                      child: new Icon(FontAwesomeIcons.lock,
                                          size: 20),
                                    )
                                    // Image.asset(
                                    //     'assets/icon/pass_abu.png',
                                    //     width: 50,
                                    //     height: 50)
                                    ,
                                    suffixIcon: GestureDetector(
                                        // onTap: _toggleObscure,
                                        child: new Icon(
                                      // _isObscureText
                                      // ? FontAwesomeIcons.eye
                                      // : FontAwesomeIcons.eyeSlash,
                                      FontAwesomeIcons.eyeSlash,
                                      color: Colors.black,
                                      size: 20,
                                    ))),
                                obscureText: true,
                              )),
                          Padding(
                              padding: EdgeInsets.only(),
                              //Add GestureDetector
                              //TODO: Textstyle
                              child: Text("Forgot your password?"))
                        ],
                      )),
                  Container(
                      child: Padding(
                          padding: EdgeInsets.only(),
                          child: FlatButton(
                            //TODO: TextStyle
                            child: Text("Sign In"), onPressed: () {},
                          ))),
                  Column(
                    children: <Widget>[
                      Container(
                          child: new RichText(
                        text: new TextSpan(
                          //TODO: Textstyle
                          children: [
                            new TextSpan(text: "Don't have an account? "),
                            new TextSpan(
                              text: "Sign up",
                              // recognizer: new TapGestureRecognizer() ..onTap = () {}
                            )
                          ],
                        ),
                      )),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 1.0,
                              width: 60.0,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            //TODO: TextStyle
                            child: Text("or"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 1.0,
                              width: 60.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              child: Image.asset(
                                  'assets/icon/facebook_logo.png',
                                  width: 50,
                                  height: 50)),
                          Container(
                            child: Image.asset('assets/icon/google_logo.png',
                                width: 50, height: 50),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String hint;
  final String img;
  final String focusImg;
  final bool isObscureText;
  final TextEditingController controller;
  bool isFocus = false;

  CustomTextField(
      {this.hint,
      this.img,
      this.focusImg,
      this.isObscureText,
      this.controller,
      key})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => new _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void dispose() {
    _focus.removeListener(_onFocusChange);
    widget.controller.dispose();
    super.dispose();
  }

  Future<Null> _onFocusChange() async {
    if (_focus.hasFocus) {
      setState(() {
        widget.isFocus = true;
      });
    } else {
      setState(() {
        widget.isFocus = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        // hintStyle: ,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Styles.gray, width: 2.0)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0)),
        prefixIcon:
            Image.asset(widget.isFocus == false ? widget.img : widget.focusImg),
      ),
      obscureText: widget.isObscureText,
    );
  }
}
