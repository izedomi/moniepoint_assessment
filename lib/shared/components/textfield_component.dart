import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:moniepoint/core/theme/app_color.dart';
import 'package:moniepoint/shared/utils/space.dart';
import 'package:moniepoint/shared/utils/textstyles.dart';

class TextfieldComponent extends StatelessWidget {
  const TextfieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h(45),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: w(16)),
      decoration: BoxDecoration(
          color: appColor.white, borderRadius: BorderRadius.circular(r(40))),
      child: Row(
        children: [
          const Icon(IconsaxPlusLinear.search_normal),
          xspace(8),
          Expanded(
            child: TextField(
              style: P16.r(),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  isCollapsed: true,
                  isDense: true,
                  hintText: "St Peterbug",
                  hintStyle: P16.r()),
            ),
          ),
        ],
      ),
    );
  }
}
