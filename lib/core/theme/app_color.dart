import 'package:flutter/material.dart';
import 'package:moniepoint/core/theme/colors/dark_theme_colors.dart';
import 'package:moniepoint/core/theme/colors/moniepoint_colors.dart';
import 'colors/light_theme_colors.dart';

class AppColor with ChangeNotifier {
  factory AppColor() {
    return _singleton;
  }

  AppColor._internal();

  static final AppColor _singleton = AppColor._internal();

  late MoniepointColors _c;
  MoniepointColors get c => _c;

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  init(ThemeMode mode) {
    _c = _getColor(mode);
    _themeMode = mode;
    notifyListeners();
  }

  MoniepointColors _getColor(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return LightThemeColors();
      case ThemeMode.dark:
        return DarkThemeColors();
      default:
        return LightThemeColors();
    }
  }
}

MoniepointColors appColor = AppColor().c;
ThemeMode appTheme = AppColor().themeMode;
