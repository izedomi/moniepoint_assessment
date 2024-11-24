import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:moniepoint/features/search/models/attribute_properties.dart';
import 'package:moniepoint/shared/utils/space.dart';

class Attribute {
  IconData? icon;
  String? label;
  double markerWidth;
  double markerHeight;
  List<AttributeProperties> properties;

  Attribute(
      {this.icon,
      this.label,
      required this.markerWidth,
      required this.markerHeight,
      required this.properties});
}

List<Attribute> atrributes = [
  Attribute(
      icon: IconsaxPlusLinear.shield_tick,
      label: "Cozy areas",
      markerWidth: w(60),
      markerHeight: h(40),
      properties: cosyAreas),
  Attribute(
      icon: IconsaxPlusLinear.wallet_3,
      label: "Price",
      markerWidth: w(90),
      markerHeight: h(40),
      properties: prices),
  Attribute(
      icon: IconsaxPlusLinear.bag,
      label: "Infrastructure",
      markerWidth: w(50),
      markerHeight: h(40),
      properties: infrasture),
  Attribute(
      icon: IconsaxPlusLinear.textalign_justifycenter,
      label: "Without any layer",
      markerWidth: w(40),
      markerHeight: h(40),
      properties: withoutLayer),
];

final defaultAttribute = Attribute(
    markerWidth: w(0), markerHeight: h(0), properties: defAttrProperties);
