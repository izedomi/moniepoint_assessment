import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint/core/theme/app_color.dart';
import 'package:moniepoint/features/explore/compponents/stat_component.dart';
import 'package:moniepoint/shared/utils/space.dart';

class OfferComponent extends StatefulWidget {
  final Duration delay;
  final Duration duration;
  const OfferComponent(
      {super.key, required this.delay, required this.duration});

  @override
  State<OfferComponent> createState() => _OfferComponentState();
}

class _OfferComponentState extends State<OfferComponent> {
  int buyOffers = 0;
  int rentOffers = 0;
  bool hasCounted = false;
  init() {
    Future.delayed(const Duration(milliseconds: 3800), () {
      if (!hasCounted) {
        buyOffers = random(1000, 1500);
        rentOffers = random(2000, 2750);
        hasCounted = true;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Animate(
      effects: [ScaleEffect(delay: widget.delay, duration: widget.duration)],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StatComponent(
              label: "BUY",
              count: buyOffers,
              bgColor: appColor.pitburg,
              textColor: appColor.white),
          StatComponent(
              label: "RENT",
              count: rentOffers,
              radius: r(24),
              bgColor: appColor.white,
              textColor: appColor.zion),
        ],
      ),
    );
  }

  int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }
}
