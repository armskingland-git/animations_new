import 'package:flutter/material.dart';

class NextToPage {
  static push(BuildContext context, dynamic page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static back(BuildContext context) {
    Navigator.pop(context);
  }
}
