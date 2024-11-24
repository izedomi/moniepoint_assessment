import 'package:flutter/material.dart';
import 'package:moniepoint/core/theme/app_color.dart';
import 'package:moniepoint/features/search/models/attribute.dart';
import 'package:moniepoint/features/search/models/attribute_properties.dart';
import 'package:moniepoint/shared/utils/space.dart';

class AttributePropertiesComponent extends StatelessWidget {
  final Attribute selectedAttribute;
  final AttributeProperties property;

  const AttributePropertiesComponent(
      {super.key, required this.selectedAttribute, required this.property});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        left: property.left,
        bottom: property.bottom,
        width: selectedAttribute.markerWidth,
        height: selectedAttribute.markerHeight,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 1000),
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(r(8)),
                topRight: Radius.circular(r(8)),
                bottomRight: Radius.circular(r(8)),
              ),
              color: appColor.pitburg,
            ),
            child: property.child));
  }
}
