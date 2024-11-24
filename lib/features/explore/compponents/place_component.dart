import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint/core/theme/app_color.dart';
import 'package:moniepoint/features/explore/compponents/lite_switch.dart';
import 'package:moniepoint/shared/utils/space.dart';

class PlaceComponent extends StatelessWidget {
  final double width;
  final double height;
  final double switchWidth;
  final String image;
  final double hPadding;
  final String name;
  final Alignment? textAlignment;
  final Duration delay;
  const PlaceComponent(
      {super.key,
      required this.height,
      required this.width,
      required this.switchWidth,
      required this.image,
      required this.hPadding,
      required this.name,
      this.textAlignment,
      required this.delay});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: w(4), vertical: h(6)),
      decoration: BoxDecoration(
          color: appColor.zion, borderRadius: BorderRadius.circular(r(16))),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(r(16)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: screenWidth,
                height: h(170),
              ),
            ),
          ),
          Positioned(
              bottom: h(12),
              left: hPadding,
              right: hPadding,
              child: FadeIn(
                delay: delay,
                child: LiteRollingSwitch(
                  textOn: name,
                  iconOn: Icons.chevron_right,
                  iconOff: Icons.chevron_right,
                  colorOn: appColor.zion.withOpacity(0.8),
                  colorOff: appColor.zion.withOpacity(0.8),
                  width: switchWidth,
                  textAlignment: textAlignment,
                  delay: delay,
                ),
              ))
        ],
      ),
    );
  }
}
