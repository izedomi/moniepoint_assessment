import 'package:flutter/material.dart';
import 'package:moniepoint/core/theme/app_color.dart';
import 'package:moniepoint/shared/utils/space.dart';

class CircleButtonComponent extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final double? width;
  final double? height;
  final Color? color;

  const CircleButtonComponent(
      {super.key,
      this.width,
      this.height,
      this.color,
      required this.icon,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width ?? w(45),
      height: height ?? w(45),
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
          color: color ?? appColor.white.withOpacity(0.4),
          shape: BoxShape.circle),
      child: Icon(
        icon,
        color: iconColor ?? appColor.white,
      ),
    );
  }
}
