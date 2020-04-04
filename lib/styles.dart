import 'package:flutter/material.dart';

abstract class Styles {
  static const Color white = Color(0xFFFBFBFB);
  static const Color lightGray = Color(0xFFE8E8E8);
  static const Color lightPink = Color(0xFFFFF2DE);
  static const Color gray = Color(0xFFB5B5B5);
  static const Color peach = Color(0xFFFFD1A5);
  static const Color darkBlue = Color(0xFF222F3E);
  static const Color lightOrange = Color(0xFFFECA57);
  static const Color orange = Color(0xFFFEBD51);
  static const Color darkOrange = Color(0xFFFF9F43);

  static const TextStyle loginTitle = TextStyle(
    fontSize: 37,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle loginDesc = TextStyle(
    fontSize: 16,
    color: gray,
  );
}
