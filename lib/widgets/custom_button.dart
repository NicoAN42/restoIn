import 'package:flutter/material.dart';

import '../styles.dart';

class CustomButton extends StatefulWidget {
  final String text;

  const CustomButton({Key key, this.text}) : super(key: key);

  @override
  _CustomButtonState createState() => new _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 30,
      child: (FlatButton(
        child: Text(widget.text,
            maxLines: 1,
            style: isPressed
                ? Styles.customStyle("mediumWhite")
                : Styles.customStyle("mediumGray")),
        color: isPressed ? Styles.orange : Styles.white,
        onPressed: () {
          setState(() {
            isPressed = !isPressed;
          });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      )),
    );
  }
}

class CustomHistoryButton extends StatefulWidget {
  final String text;

  const CustomHistoryButton({Key key, this.text}) : super(key: key);

  @override
  _CustomHistoryButtonState createState() => new _CustomHistoryButtonState();
}

class _CustomHistoryButtonState extends State<CustomHistoryButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          isPressed = false;
        });
      },
      onTap: () {
        //TODO: link history to search page
      },
      child: Container(
        padding: EdgeInsets.only(top: 15, bottom: 5),
        child: Text(widget.text,
            style: isPressed
                ? Styles.customStyle("mediumBoldBlack")
                : Styles.customStyle("mediumGray")),
      ),
    );
  }
}
