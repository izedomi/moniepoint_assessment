import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:moniepoint/core/constants/png_image_asset.dart';
import 'package:moniepoint/core/theme/app_color.dart';
import 'package:moniepoint/features/search/components/attribute_menu_popup_component.dart';
import 'package:moniepoint/features/search/components/attribute_properties_component.dart';
import 'package:moniepoint/features/search/components/circle_button_component.dart';
import 'package:moniepoint/features/search/components/tile_button_component.dart';
import 'package:moniepoint/features/search/models/attribute.dart';
import 'package:moniepoint/features/search/models/attribute_properties.dart';
import 'package:moniepoint/shared/components/textfield_component.dart';
import 'package:moniepoint/shared/utils/space.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool menuIsOpen = false;
  Attribute? selectedAttribute = defaultAttribute;
  int currentIndex = 0;

  List<IconData> navIcons = [
    IconsaxPlusBold.search_normal,
    IconsaxPlusBold.message,
    IconsaxPlusBold.home,
    IconsaxPlusBold.heart,
    IconsaxPlusBold.user
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1200), () {
      selectedAttribute = atrributes[1];
      setState(() {});
    });
  }

  applyAttributeSelection(Attribute attr) {
    menuIsOpen = false;
    selectedAttribute = attr;
    setState(() {});
  }

  showHideMenuPopup() {
    setState(() {
      menuIsOpen = !menuIsOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        //  padding: const EdgeInsets.only(top: kToolbarHeight),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              appColor.primary,
              appColor.primary,
            ])),
        child: Stack(
          children: [
            //map background
            Image.asset(
              ImageAsset.map,
              width: screenWidth,
              height: screenHeight,
              fit: BoxFit.cover,
            ),
            //property attribute floaters
            if (selectedAttribute != null) ...[
              ...List.generate(selectedAttribute!.properties.length, (index) {
                AttributeProperties p = selectedAttribute!.properties[index];
                return AttributePropertiesComponent(
                    selectedAttribute: selectedAttribute!, property: p);
              }),
            ],
            //textfield component
            Positioned(
              top: h(16) + kToolbarHeight,
              child: Container(
                width: screenWidth,
                padding: EdgeInsets.symmetric(horizontal: w(24)),
                child: Animate(
                  effects: const [
                    ScaleEffect(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn)
                  ],
                  child: Row(
                    children: [
                      const Expanded(flex: 6, child: TextfieldComponent()),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CircleButtonComponent(
                            icon: IconsaxPlusLinear.setting_4,
                            iconColor: appColor.primary,
                            color: appColor.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //Attribute menu popup
            AnimatedPositioned(
                width: menuIsOpen ? w(165) : 0,
                height: menuIsOpen ? h(170) : 0,
                bottom: h(160),
                duration: const Duration(milliseconds: 600),
                curve: Curves.fastOutSlowIn,
                left: w(24),
                child: LayoutBuilder(builder: (context, constraints) {
                  bool show = constraints.maxWidth >= w(165);
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: w(12)),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(r(24)),
                      color: appColor.white.withOpacity(1),
                    ),
                    child: show
                        ? AttributeMenuPopupComponent(
                            attributes: atrributes,
                            selectedAttribute: selectedAttribute,
                            onSelect: (attr) {
                              applyAttributeSelection(attr);
                            },
                          )
                        : const SizedBox(),
                  );
                })),

            //Action button menu button
            Positioned(
                bottom: h(110),
                left: w(24),
                child: Animate(
                  effects: const [
                    FadeEffect(duration: Duration(milliseconds: 1000)),
                    ScaleEffect(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn)
                  ],
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            showHideMenuPopup();
                          },
                          child: CircleButtonComponent(
                            icon: selectedAttribute?.icon ??
                                IconsaxPlusBold.row_vertical,
                          )),
                      yspace(5),
                      const CircleButtonComponent(
                          icon: IconsaxPlusLinear.send_2)
                    ],
                  ),
                )),
            //List of variants component
            Positioned(
              bottom: h(110),
              right: w(24),
              child: Animate(
                  effects: const [
                    FadeEffect(duration: Duration(milliseconds: 1000)),
                    ScaleEffect(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn)
                  ],
                  child: const TileButtonComponent(
                    icon: IconsaxPlusLinear.textalign_justifyleft,
                    label: "List of variants",
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
