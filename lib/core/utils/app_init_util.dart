import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moniepoint/core/theme/app_color.dart';

class AppInitService {
  init() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    AppColor().init(ThemeMode.light);
  }
}
