import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:moniepoint/core/theme/app_color.dart';
import 'package:moniepoint/shared/utils/space.dart';
import 'package:moniepoint/shared/utils/textstyles.dart';

class AttributeProperties {
  Widget child;
  double left;
  double bottom;

  AttributeProperties(
      {required this.child, required this.left, required this.bottom});
}

List<AttributeProperties> prices = [
  AttributeProperties(
      left: w(60), bottom: h(300), child: _getPricesWidget("23.5mn P")),
  AttributeProperties(
      left: w(80), bottom: h(365), child: _getPricesWidget("41.2mn P")),
  AttributeProperties(
      left: w(screenWidth - 150),
      bottom: h(375),
      child: _getPricesWidget("10.9mn P")),
  AttributeProperties(
      left: w(50), bottom: h(450), child: _getPricesWidget("56.3mn P")),
  AttributeProperties(
      left: w(screenWidth - 150),
      bottom: h(500),
      child: _getPricesWidget("89.3mn P")),
  AttributeProperties(
      left: w(screenWidth - 180),
      bottom: h(600),
      child: _getPricesWidget("120.5mn P")),
  AttributeProperties(
      left: w(60), bottom: h(300), child: _getPricesWidget("70.3mn P")),
];

List<AttributeProperties> cosyAreas = [
  AttributeProperties(left: w(60), bottom: h(300), child: _getCozyWidget()),
  AttributeProperties(left: w(80), bottom: h(365), child: _getCozyWidget()),
  AttributeProperties(
      left: w(screenWidth - 150), bottom: h(375), child: _getCozyWidget()),
  AttributeProperties(left: w(50), bottom: h(450), child: _getCozyWidget()),
  AttributeProperties(
      left: w(screenWidth - 150), bottom: h(500), child: _getCozyWidget()),
  AttributeProperties(
      left: w(screenWidth - 180), bottom: h(600), child: _getCozyWidget()),
  AttributeProperties(left: w(60), bottom: h(300), child: _getCozyWidget()),
];

List<AttributeProperties> infrasture = [
  AttributeProperties(
      left: w(60), bottom: h(300), child: _getInfrastureWidget()),
  AttributeProperties(
      left: w(80), bottom: h(365), child: _getInfrastureWidget()),
  AttributeProperties(
      left: w(screenWidth - 150),
      bottom: h(375),
      child: _getInfrastureWidget()),
  AttributeProperties(
      left: w(50), bottom: h(450), child: _getInfrastureWidget()),
  AttributeProperties(
      left: w(screenWidth - 150),
      bottom: h(500),
      child: _getInfrastureWidget()),
  AttributeProperties(
      left: w(screenWidth - 180),
      bottom: h(600),
      child: _getInfrastureWidget()),
  AttributeProperties(
      left: w(60), bottom: h(300), child: _getInfrastureWidget()),
];

List<AttributeProperties> withoutLayer = [
  AttributeProperties(left: w(60), bottom: h(300), child: _getLayerWidget()),
  AttributeProperties(left: w(80), bottom: h(365), child: _getLayerWidget()),
  AttributeProperties(
      left: w(screenWidth - 150), bottom: h(375), child: _getLayerWidget()),
  AttributeProperties(left: w(50), bottom: h(450), child: _getLayerWidget()),
  AttributeProperties(
      left: w(screenWidth - 150), bottom: h(500), child: _getLayerWidget()),
  AttributeProperties(
      left: w(screenWidth - 180), bottom: h(600), child: _getLayerWidget()),
  AttributeProperties(left: w(60), bottom: h(300), child: _getLayerWidget()),
];

List<AttributeProperties> defAttrProperties = [
  AttributeProperties(left: w(60), bottom: h(300), child: _getDefaultWidget()),
  AttributeProperties(left: w(80), bottom: h(365), child: _getDefaultWidget()),
  AttributeProperties(
      left: w(screenWidth - 150),
      bottom: h(375),
      child: _getPricesWidget("10.9mn P")),
  AttributeProperties(left: w(50), bottom: h(450), child: _getDefaultWidget()),
  AttributeProperties(
      left: w(screenWidth - 150), bottom: h(500), child: _getDefaultWidget()),
  AttributeProperties(
      left: w(screenWidth - 180), bottom: h(600), child: _getDefaultWidget()),
  AttributeProperties(left: w(60), bottom: h(300), child: _getDefaultWidget()),
];

_getPricesWidget(String price) {
  return FadeIn(
    duration: const Duration(milliseconds: 1000),
    child: Text(
      price,
      style: P13.ssb().copyWith(color: appColor.white),
    ),
  );
}

_getCozyWidget() {
  return Icon(IconsaxPlusLinear.shield_tick, color: appColor.white);
}

_getInfrastureWidget() {
  return Icon(IconsaxPlusLinear.bag, color: appColor.white);
}

_getLayerWidget() {
  return Icon(IconsaxPlusLinear.buliding, color: appColor.white);
}

_getDefaultWidget() {
  return const SizedBox();
}
