import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:moniepoint/core/theme/app_color.dart';
import 'package:moniepoint/shared/utils/space.dart';
import 'package:moniepoint/shared/utils/textstyles.dart';

class UserLocation extends StatefulWidget {
  const UserLocation({super.key});

  @override
  State<UserLocation> createState() => _UserLocationState();
}

class _UserLocationState extends State<UserLocation> {
  double width = 0;
  double opacity = 0;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        width = w(180);
      });
    });
    Future.delayed(const Duration(milliseconds: 1200), () {
      setState(() {
        opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        padding: EdgeInsets.symmetric(horizontal: w(8), vertical: h(12)),
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: appColor.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black12.withOpacity(0.02),
                  offset: const Offset(0, 0),
                  blurRadius: 6,
                  spreadRadius: 3)
            ],
            borderRadius: BorderRadius.circular(r(12))),
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 700),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                IconsaxPlusBold.location,
                color: appColor.zion,
              ),
              xspace(8),
              Flexible(
                child: Text(
                  "Saint Peterburg",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: P16.r().copyWith(color: appColor.zion),
                ),
              )
            ],
          ),
        ));
  }
}
