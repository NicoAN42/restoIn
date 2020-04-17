import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../styles.dart';

class Food {
  String image;
  String name;
  int price;
  List<String> type;
  List<double> rating;

  Food({this.image, this.name, this.price, this.type, this.rating});

  DecorationImage getImage() {
    return DecorationImage(image: AssetImage(image), fit: BoxFit.cover);
  }

  Text getNameText() {
    return Text(
      name,
      style: Styles.customStyle("mediumBlack"),
    );
  }

  Text getPriceText() {
    String p = price.toString();
    List<String> res = [];
    for (int i = p.length; i > 0; i -= 3) {
      if (i - 3 >= 0) {
        res.insert(0, "${p.substring(i - 3, i)}");
      } else {
        res.insert(0, "${p.substring(0, i)}");
      }
    }
    String r = res.join(".");

    return Text("IDR $r", style: Styles.customStyle("smallBlack"));
  }

  String getPrice() {
    final formatter =
        NumberFormat.currency(locale: "id", symbol: "", decimalDigits: 0);
    return formatter.format(price);
  }

  Text getTypeText() {
    if (type.length == 1)
      return Text(
        "${type[0]}",
        style: Styles.customStyle("smallGray"),
      );
    return Text(
      "${type[0]}    ${type[1]}",
      style: Styles.customStyle("smallGray"),
    );
  }

  Text getRatingText() {
    double avg = 0;
    rating.forEach((r) => avg += r);
    avg /= rating.length;

    return Text("$avg", style: Styles.customStyle("smallWhite"));
  }
}
