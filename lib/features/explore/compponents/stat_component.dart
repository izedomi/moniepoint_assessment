import 'package:flutter/material.dart';
import 'package:moniepoint/features/explore/compponents/counter_text.dart';
import 'package:moniepoint/shared/utils/space.dart';
import 'package:moniepoint/shared/utils/textstyles.dart';

class StatComponent extends StatefulWidget {
  final double? width;
  final double? height;
  final double? radius;
  final String label;
  final int count;
  final Color bgColor;
  final Color textColor;

  const StatComponent(
      {super.key,
      this.width,
      this.height,
      this.radius,
      required this.label,
      required this.count,
      required this.bgColor,
      required this.textColor});

  @override
  State<StatComponent> createState() => _StatComponentState();
}

class _StatComponentState extends State<StatComponent> {
  @override
  Widget build(BuildContext context) {
    double wi = widget.width ?? w(170);
    double hi = widget.height ?? w(170);
    double ra = widget.radius ?? wi / 2;

    return Container(
      width: wi,
      height: hi,
      padding: EdgeInsets.symmetric(horizontal: w(12), vertical: h(20)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ra), color: widget.bgColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.label,
            style: P14.r().copyWith(color: widget.textColor),
          ),
          Column(
            children: [
              CounterText(
                duration: const Duration(milliseconds: 800),
                value: widget.count,
                style: P31
                    .sb()
                    .copyWith(color: widget.textColor, letterSpacing: 1.2),
              ),
              yspace(4),
              Text(
                "Offers",
                style: P14.r().copyWith(color: widget.textColor),
              ),
            ],
          ),
          const SizedBox()
        ],
      ),
    );
  }
}
