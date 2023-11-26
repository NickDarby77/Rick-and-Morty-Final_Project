import 'package:flutter/material.dart';

abstract class AppFonts {
  static const TextStyle s10w500Green = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: Color(0xff43D049),
    letterSpacing: 1.5,
  );

  static const TextStyle charactersNumber = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: Color(0xff5B6975),
  );

  static const TextStyle selectedLabelStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: Color(0xff43D049),
  );

  static const TextStyle unselectedLabelStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: Color(0xff5B6975),
  );

  static const TextStyle s12w400Gender = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    // color: Color(0xff6E798C),
    color: Colors.white,
  );

  static const TextStyle s13w400 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 0.25,
  );

  static const TextStyle s16w500White = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xffFFFFFF),
    letterSpacing: 0.5,
  );

  static const TextStyle hintStyle = TextStyle(
    fontSize: 16,
    color: Color(0xff5B6975),
    fontWeight: FontWeight.w400,
    letterSpacing: 0.45,
  );

  static const TextStyle locationNameStyle = TextStyle(
    fontSize: 20,
    color: Color(0xffFFFFFF),
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  static const TextStyle s24w700 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}
