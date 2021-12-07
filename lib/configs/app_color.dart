import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColor {
  static Color pinkPrimary = Color.fromRGBO(239, 166, 161, 1.0);
  static Color pinkSecondary = Color.fromRGBO(255, 204, 200, 1.0);
  static Color blackPrimary = Color.fromRGBO(132, 132, 132, 1.0);
  static Color blackMain = Color.fromRGBO(0, 0, 0, 1.0);
  static Color whiteMain = Color.fromRGBO(255, 255, 255, 1);

  static final AppColor _instance = AppColor._internal();

  factory AppColor() {
    return _instance;
  }

  AppColor._internal();
}
