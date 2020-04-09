import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:restoin/screens/finger_register_screen.dart';
import 'package:restoin/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/widgets/custom_text_field.dart';

TextEditingController _newNameController;
TextEditingController _newEmailController;
TextEditingController _newPasswordController;
TextEditingController _newConfirmPasswordController;

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => new _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _name;
  String _email;
  String _pw;

  void savePw(val) {
    setState(() {
      _pw = val;
    });
  }

  void _submitCommand() {
    FocusScope.of(context).unfocus();
    final form = formKey.currentState;
    _newEmailController.text = _newEmailController.text.trim();
    if (form.validate()) {
      _name = _newNameController.text.trim();
      _email = _newEmailController.text.trim();
      _pw = _newPasswordController.text.trim();
      _loginCommand();
    } else {
      _newPasswordController.clear();
      _newConfirmPasswordController.clear();
    }
  }

  Future<void> _loginCommand() async {
    try {
      final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _pw,
      ))
          .user;

      await user.sendEmailVerification();

      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FingerRegisterScreen(
                    user: user,
                    name: _name,
                  )));
    } catch (e) {
      String error = e.toString();
      if (error.contains("EMAIL_ALREADY_IN_USE")) {
        final snackbar = SnackBar(
          content: Text("Invalid e-mail, e-mail already in use."),
          duration: new Duration(seconds: 3),
        );
        scaffoldKey.currentState.showSnackBar(snackbar);
      }
      _newEmailController.clear();
    }
  }

  @override
  void initState() {
    _newNameController = TextEditingController();
    _newEmailController = TextEditingController();
    _newPasswordController = TextEditingController();
    _newConfirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _newConfirmPasswordController.dispose();
    _newNameController.dispose();
    _newEmailController.dispose();
    _newPasswordController.dispose();
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
                            "Create Account",
                            style: Styles.customStyle("xLargeBoldBlack"),
                          ),
                          Text("Join us to discover more food",
                              style: Styles.customStyle("mediumGray"))
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(top: screenHeight * 0.07),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CustomTextField(
                                hint: "Full Name",
                                icon: FontAwesomeIcons.user,
                                controller: _newNameController),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.02),
                              child: CustomTextField(
                                  hint: "E-mail",
                                  icon: FontAwesomeIcons.envelope,
                                  type: "email",
                                  controller: _newEmailController),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.02),
                              child: CustomTextField(
                                  hint: "Password",
                                  icon: FontAwesomeIcons.lock,
                                  type: "pw",
                                  savePw: savePw,
                                  isSuffix: true,
                                  isObscureText: true,
                                  controller: _newPasswordController),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.02),
                              child: CustomTextField(
                                  hint: "Confirm Password",
                                  icon: FontAwesomeIcons.lock,
                                  type: "confPw",
                                  confPw: _pw,
                                  isSuffix: true,
                                  isObscureText: true,
                                  controller: _newConfirmPasswordController),
                            ),
                          ],
                        ),
                      )),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.03),
                          child: RaisedButton(
                            child: Text("Next",
                                style: Styles.customStyle("mediumBoldWhite")),
                            onPressed: () => _submitCommand(),
                            color: Styles.orange,
                            highlightColor: Styles.darkOrange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ))),
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
