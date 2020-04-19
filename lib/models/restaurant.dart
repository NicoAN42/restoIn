import 'package:flutter/material.dart';

import '../styles.dart';
import 'food.dart';

class Restaurant {
  String image;
  List<double> rating;
  String name;
  String open;
  String close;
  String location;
  List<String> type;
  double distance;
  List<Food> featuredFoods;
  bool isClosed;
  List<String> menu;

  Restaurant(
      {this.image,
      this.rating,
      this.name,
      this.open,
      this.close,
      this.location,
      this.type,
      this.distance,
      this.featuredFoods,
      this.isClosed,
      this.menu});

  DecorationImage getImage() {
    return DecorationImage(image: AssetImage(image), fit: BoxFit.cover);
  }

  Text getRatingText() {
    double avg = 0;
    rating.forEach((r) => avg += r);
    avg /= rating.length;

    return Text("$avg", style: Styles.customStyle("smallWhite"));
  }

  String getRating() {
    double avg = 0;
    rating.forEach((r) => avg += r);
    avg /= rating.length;

    return avg.toString();
  }

  Text getNameText() {
    return Text(
      name,
      style: TextStyle(
          color: Styles.black, fontWeight: FontWeight.w700, fontSize: 19),
    );
  }

  Text getTimeText() {
    return Text("Open $open - $close", style: Styles.customStyle("smallBlack"));
  }

  String getTime() {
    return "$open - $close";
  }

  Text getLocationText() {
    return Text(location, style: Styles.customStyle("smallGray"));
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

  String getType() {
    if (type.length == 1) return "${type[0]}";
    return "${type[0]}    ${type[1]}";
  }

  Column getDistanceText() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text("$distance", style: Styles.customStyle("largeBoldBlack")),
          Text("KM", style: Styles.customStyle("mediumBlack")),
        ]);
  }
}
