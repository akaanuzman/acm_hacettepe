import 'package:flutter/material.dart';

import '../color/color_theme.dart';
import 'ITheme.dart';

class LightTheme extends ITheme {
  static LightTheme? _instance;
  static LightTheme get instance {
    if (_instance != null)
      return _instance!;
    else {
      _instance = LightTheme._init();
      return _instance!;
    }
  }

  final ColorTheme colors = ColorTheme();
  LightTheme._init();

  @override
  ThemeData get data => ThemeData(
      tabBarTheme: TabBarTheme(
          labelColor: Colors.black, unselectedLabelColor: Colors.blue,));
}
