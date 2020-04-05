import 'package:flutter/material.dart';

abstract class Styles {
  static const Color white = Color(0xFFFBFBFB);
  static const Color black = Color(0xFF222F3E);
  static const Color lightGray = Color(0xFFE8E8E8);
  static const Color lightPink = Color(0xFFFFF2DE);
  static const Color gray = Color(0xFFB5B5B5);
  static const Color peach = Color(0xFFFFD1A5);
  static const Color lightOrange = Color(0xFFFECA57);
  static const Color orange = Color(0xFFFEBD51);
  static const Color darkOrange = Color(0xFFFF9F43);
  static const Color green = Color(0xFFFF9F43);
  static const Color red = Color(0xFFDB0000);

  // static const TextStyle mediumGray = TextStyle(
  //   fontSize: 16,
  //   color: gray,
  // );

  static TextStyle customStyle(String s) {
    s = s.toLowerCase();
    double size;
    Color color;
    FontWeight weight = FontWeight.w500;
    TextDecoration deco = TextDecoration.none;

    if (s.contains("small"))
      size = 12;
    else if (s.contains("medium"))
      size = 16;
    else if (s.contains("xlarge"))
      size = 37;
    else if (s.contains("larger"))
      size = 28;
    else if (s.contains("large")) size = 21;

    if (s.contains("white"))
      color = white;
    else if (s.contains("gray"))
      color = gray;
    else if (s.contains("black"))
      color = black;
    else if (s.contains("lightorange"))
      color = lightOrange;
    else if (s.contains("orange"))
      color = orange;
    else if (s.contains("darkOrange")) color = darkOrange;

    if (s.contains("bold")) weight = FontWeight.w700;

    if (s.contains("underline")) deco = TextDecoration.underline;

    return (TextStyle(
      fontSize: size,
      color: color,
      fontWeight: weight,
      decoration: deco,
    ));
  }
}
