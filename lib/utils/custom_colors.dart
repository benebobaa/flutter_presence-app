import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color menu1 = HexColor("#f0eaf8");
Color menu2 = HexColor("#fff4ed");
Color menu3 = HexColor("#edf5f1");
Color menu4 = HexColor("#fef0f0");

Color icon1 = HexColor("#4b15a6");
Color icon2 = HexColor("#f08e3a");
Color icon3 = HexColor("#358356");
Color icon4 = HexColor("#cf6767");

Color bgcolor = HexColor("#fafafa");
