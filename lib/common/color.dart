import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF452E7C);
const Color orangeColor = Color(0xFFF16726);
const Color greenColor = Color(0xFF39870F);
const Color autumnColor = Color(0xFFFDECE5);
const Color springColor = Color(0xFFFEF5F6);
const Color summerColor = Color(0xFFFDFAE7);
const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;

const Color transparentColor = Color(0xFF23575757);

const MaterialColor appColor = MaterialColor(
  _primaryValue,
  <int, Color>{
    50: Color(0xFF452E7C),
    100: Color(0xFF452E7C),
    200: Color(0xFF452E7C),
    300: Color(0xFF452E7C),
    400: Color(0xFF452E7C),
    500: Color(_primaryValue),
    600: Color(0xFF452E7C),
    700: Color(0xFF452E7C),
    800: Color(0xFF452E7C),
    900: Color(0xFF452E7C),
  },
);
const int _primaryValue = 0xFF452E7C;
