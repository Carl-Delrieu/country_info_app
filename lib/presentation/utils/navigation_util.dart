import 'package:flutter/material.dart';

class NavigationUtil {
  static navigateTo(BuildContext context, Widget page, {bool replace = false}) {
    if (replace) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => page));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));
    }
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
