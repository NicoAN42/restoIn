import 'package:flutter/material.dart';

import '../styles.dart';
import 'food.dart';

class Restaurant {
  String image;
  double rating;
  String name;
  String open;
  String close;
  String location;
  List<String> type;
  double distance;
  List<Food> featuredFoods;

  Restaurant(
      {this.image,
      this.rating,
      this.name,
      this.open,
      this.close,
      this.location,
      this.type,
      this.distance,
      this.featuredFoods});

  DecorationImage getImage() {
    return DecorationImage(image: AssetImage(image), fit: BoxFit.cover);
  }

  Text getRating() {
    return Text("$rating", style: Styles.customStyle("smallwhite"));
  }

  Text getNameText() {
    return Text(
      name,
      style: Styles.customStyle("largeBoldBlack"),
    );
  }

  Text getTimeText() {
    return Text("Open $open - $close", style: Styles.customStyle("smallBlack"));
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

  Column getDistanceText() {
    return Column(children: <Widget>[
      Text("$distance", style: Styles.customStyle("largerBoldBlack")),
      Text("KM", style: Styles.customStyle("mediumBlack")),
    ]);
  }
}
