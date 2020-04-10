import 'package:flutter/material.dart';
import '../styles.dart';

class CustomCheckBox extends StatefulWidget {
  final int price;

  const CustomCheckBox({Key key, this.price, }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
   return Checkbox(
      activeColor: Styles.orange,
      value: isChecked,
      onChanged: (bool val) {
        setState(() {
          isChecked = val;
        });
      },
    );
  }
}