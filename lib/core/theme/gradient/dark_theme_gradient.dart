import 'package:flutter/material.dart';
import 'package:moniepoint/core/theme/gradient/moniepoint_gradient.dart';

class DarkThemeGradient implements MoniepointGradient {
  @override
  List<Color> get splash => [
        const Color(0xff08B94F),
        const Color(0xff016717),
      ];
}
