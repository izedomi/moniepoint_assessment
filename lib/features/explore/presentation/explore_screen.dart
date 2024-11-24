import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint/core/theme/app_color.dart';
import 'package:moniepoint/features/explore/compponents/offer_component.dart';
import 'package:moniepoint/features/explore/compponents/slider_panel_component.dart';
import 'package:moniepoint/features/explore/compponents/user_avatar.dart';
import 'package:moniepoint/features/explore/compponents/user_location.dart';
import 'package:moniepoint/shared/utils/space.dart';
import 'package:moniepoint/shared/utils/textstyles.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 0.0;
  PanelController panelController = PanelController();
  //Transition durations
  Duration userAvatarFadeInDuration = const Duration(milliseconds: 1200);
  Duration offerTransitionDuration = const Duration(milliseconds: 500);

  //Transition delays
  Duration usernameTransitionDelay = const Duration(milliseconds: 1700);
  Duration descTransitionDelay = const Duration(milliseconds: 2300);
  Duration offerTransitionDelay = const Duration(milliseconds: 3000);
  Duration panelSliderDelay = const Duration(milliseconds: 5200);

  @override
  void initState() {
    Future.delayed(panelSliderDelay, () {
      panelController.open();
      _panelHeightClosed = screenHeight * .425;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = screenHeight * .69;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          panelController.isPanelOpen
              ? panelController.close()
              : panelController.open();
        },
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [appColor.white, appColor.resin])),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  yspace(kToolbarHeight),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const UserLocation(),
                            UserAvatar(duration: userAvatarFadeInDuration),
                          ],
                        ),
                        yspace(36),
                        FadeInUp(
                          from: 30,
                          delay: usernameTransitionDelay,
                          child: Text(
                            "Hi, Izedomi",
                            style: P31.r().copyWith(color: appColor.zion),
                          ),
                        ),
                        yspace(8),
                        FadeInUp(
                          from: 30,
                          delay: descTransitionDelay,
                          child: Text("let's select your\nperfect place",
                              style: P35.r().copyWith(
                                    height: 1.1,
                                  )),
                        ),
                        yspace(36),
                        OfferComponent(
                            delay: offerTransitionDelay,
                            duration: offerTransitionDuration),
                      ],
                    ),
                  ),
                ],
              ),
              SlidingUpPanel(
                  maxHeight: _panelHeightOpen,
                  minHeight: _panelHeightClosed,
                  parallaxEnabled: true,
                  controller: panelController,
                  parallaxOffset: 1,
                  isDraggable: true,
                  panelBuilder: (sc) => SliderPanelComponent(
                        delay: panelSliderDelay,
                      ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(r(24)),
                      topRight: Radius.circular(r(24))),
                  onPanelSlide: (double pos) => setState(() {})),
            ],
          ),
        ),
      ),
    );
  }
}
