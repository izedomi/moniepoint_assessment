import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint/core/theme/app_color.dart';
import 'package:moniepoint/features/search/models/attribute.dart';
import 'package:moniepoint/shared/utils/space.dart';
import 'package:moniepoint/shared/utils/textstyles.dart';

class AttributeMenuPopupComponent extends StatelessWidget {
  final List<Attribute> attributes;
  final Attribute? selectedAttribute;
  final Function(Attribute attr) onSelect;

  const AttributeMenuPopupComponent(
      {super.key,
      required this.attributes,
      required this.selectedAttribute,
      required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(atrributes.length, (index) {
            bool islastItem = (atrributes.length - 1) == index;
            Attribute attr = atrributes[index];
            return InkWell(
              onTap: () {
                onSelect(attr);
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        attr.icon,
                        color: selectedAttribute?.icon == attr.icon
                            ? appColor.pitburg
                            : appColor.zion,
                      ),
                      xspace(12),
                      FittedBox(
                        child: Text(
                          attr.label ?? "",
                          style: P14.r().copyWith(
                                color: selectedAttribute?.icon == attr.icon
                                    ? appColor.pitburg
                                    : appColor.zion,
                              ),
                        ),
                      )
                    ],
                  ),
                  if (!islastItem) yspace(16)
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
