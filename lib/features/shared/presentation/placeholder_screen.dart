import 'package:flutter/material.dart';
import 'package:moniepoint/shared/utils/space.dart';
import 'package:moniepoint/shared/utils/textstyles.dart';

class PlaceHolderScreen extends StatelessWidget {
  final String label;
  final String subLabel;
  const PlaceHolderScreen(
      {super.key, required this.label, required this.subLabel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: P24.r()),
            yspace(8),
            Text(subLabel, style: P14.r())
          ],
        ),
      ),
    );
  }
}
