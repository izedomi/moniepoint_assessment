import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint/core/constants/png_image_asset.dart';
import 'package:moniepoint/core/routes/routes.dart';
import 'package:moniepoint/core/theme/app_color.dart';
import 'package:moniepoint/shared/utils/space.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushNamed(context, AppRoute.navParent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.white,
      body: Container(
        padding: EdgeInsets.only(bottom: h(24)),
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShakeY(
              child: Image.asset(
                ImageAsset.logo2,
                width: w(200),
                height: h(120),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
