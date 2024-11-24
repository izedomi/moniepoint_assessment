import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:moniepoint/core/theme/app_color.dart';
import 'package:moniepoint/features/explore/presentation/explore_screen.dart';
import 'package:moniepoint/features/search/components/circle_button_component.dart';
import 'package:moniepoint/features/search/presentations/search_screen.dart';
import 'package:moniepoint/features/shared/presentation/placeholder_screen.dart';
import 'package:moniepoint/shared/utils/space.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({super.key});

  @override
  State<ParentScreen> createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  int currentIndex = 2;

  List<IconData> navIcons = [
    IconsaxPlusBold.search_normal,
    IconsaxPlusBold.message,
    IconsaxPlusBold.home,
    IconsaxPlusBold.heart,
    IconsaxPlusBold.user
  ];

  List<Widget> screens = [
    const SearchScreen(),
    const PlaceHolderScreen(
        label: "Chats", subLabel: "Instant messaging at yor finger tips"),
    const ExploreScreen(),
    const PlaceHolderScreen(
        label: "Wishlist", subLabel: "Your favourite items in one place"),
    const PlaceHolderScreen(
        label: "Account", subLabel: "Personalization at its best"),
  ];

  @override
  void initState() {
    super.initState();
  }

  updateIndex(index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            screens[currentIndex],
            Positioned(
                bottom: h(28),
                left: w(64),
                right: w(64),
                child: FadeInUp(
                  delay: const Duration(milliseconds: 8700),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: w(4), vertical: h(4)),
                    height: h(65),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(r(33)),
                      color: const Color(0xff2b2b2b).withOpacity(0.9),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...List.generate(navIcons.length, (index) {
                          return InkWell(
                            onTap: () => updateIndex(index),
                            child: CircleButtonComponent(
                                width: currentIndex == index ? w(60) : w(45),
                                height: currentIndex == index ? w(60) : w(45),
                                icon: navIcons[index],
                                color: currentIndex == index
                                    ? appColor.pitburg
                                    : appColor.black.withOpacity(0.5)),
                          );
                        })
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
