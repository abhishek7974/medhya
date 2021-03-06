import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medhya/services/authentication.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color mainColor = HexColor("#98E1F2");

void showSnackBar(BuildContext context, String str) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(str),
    ),
  );
}

var firebaseAuth = FirebaseAuth.instance;
var authController = FirebaseAuthMethods.instance;
