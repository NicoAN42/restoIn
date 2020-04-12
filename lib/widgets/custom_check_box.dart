import 'package:flutter/material.dart';
import '../styles.dart';

class CustomCheckBox extends StatefulWidget {
  final int price;
  final bool isChecked;
  final Function addPrice;

  const CustomCheckBox({
    Key key,
    this.price,
    this.isChecked,
    this.addPrice,
  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Styles.orange,
      value: widget.isChecked,
      onChanged: (bool val) {
        setState(() {
          widget.addPrice(widget.price);
        });
      },
    );
  }
}
