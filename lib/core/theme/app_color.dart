import 'package:flutter/material.dart';
import 'package:moniepoint/core/theme/colors/dark_theme_colors.dart';
import 'package:moniepoint/core/theme/colors/moniepoint_colors.dart';
import 'package:moniepoint/core/theme/gradient/dark_theme_gradient.dart';
import 'package:moniepoint/core/theme/gradient/light_theme_gradient.dart';
import 'package:moniepoint/core/theme/gradient/moniepoint_gradient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'colors/light_theme_colors.dart';

class AppColor with ChangeNotifier {
  factory AppColor() {
    return _singleton;
  }

  AppColor._internal();

  static final AppColor _singleton = AppColor._internal();

  late MoniepointColors _c;
  MoniepointColors get c => _c;

  late MoniepointGradient _g;
  MoniepointGradient get g => _g;

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  init(ThemeMode mode) {
    _c = _getColor(mode);
    _themeMode = mode;
    _g = _getGradient(mode);
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

  MoniepointGradient _getGradient(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return LightThemeGradient();
      case ThemeMode.dark:
        return DarkThemeGradient();
      default:
        return LightThemeGradient();
    }
  }

  getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDarkMode') ?? false;
  }
}

MoniepointColors appColor = AppColor().c;
MoniepointGradient appGradient = AppColor().g;
ThemeMode appTheme = AppColor().themeMode;
