import 'package:flutter/material.dart';
import 'package:moniepoint/core/theme/app_color.dart';
import 'package:moniepoint/shared/utils/space.dart';
import 'package:moniepoint/shared/utils/textstyles.dart';

class TileButtonComponent extends StatelessWidget {
  final IconData icon;
  final String label;
  const TileButtonComponent(
      {super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(r(24)),
        color: appColor.white.withOpacity(0.6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: appColor.white,
          ),
          xspace(8),
          Text(label, style: P14.r().copyWith(color: appColor.white))
        ],
      ),
    );
  }
}
