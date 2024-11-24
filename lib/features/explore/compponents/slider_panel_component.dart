import 'package:flutter/material.dart';
import 'package:moniepoint/core/constants/png_image_asset.dart';
import 'package:moniepoint/features/explore/compponents/place_component.dart';
import 'package:moniepoint/shared/utils/space.dart';

class SliderPanelComponent extends StatefulWidget {
  final Duration delay;
  const SliderPanelComponent({super.key, required this.delay});

  @override
  State<SliderPanelComponent> createState() => _SliderPanelComponentState();
}

class _SliderPanelComponentState extends State<SliderPanelComponent> {
  // Duration delay = widget.delay ?? Duration(milliseconds: 5200);
  @override
  Widget build(BuildContext context) {
    return _panel();
  }

  Widget _panel() {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            PlaceComponent(
                height: h(180),
                width: screenWidth,
                switchWidth: screenWidth - w(40),
                image: ImageAsset.decor1,
                hPadding: w(16),
                name: "Gladkova St, 25",
                delay: const Duration(milliseconds: 6000)),
            Row(
              children: [
                Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                    double width = constraints.biggest.width;
                    return PlaceComponent(
                        height: h(350),
                        width: width,
                        switchWidth: width - w(24),
                        image: ImageAsset.decor2,
                        hPadding: w(8),
                        name: "Zaziba St, 24",
                        textAlignment: Alignment.centerLeft,
                        delay: const Duration(milliseconds: 7600));
                  }),
                ),
                Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                    double width = constraints.biggest.width;
                    return Column(
                      children: [
                        PlaceComponent(
                            height: h(170),
                            width: width,
                            switchWidth: width - w(24),
                            image: ImageAsset.decor3,
                            hPadding: w(8),
                            name: "Trefeleva St, 43",
                            textAlignment: Alignment.centerLeft,
                            delay: const Duration(milliseconds: 6800)),
                        PlaceComponent(
                            height: h(170),
                            width: width,
                            switchWidth: width - w(24),
                            image: ImageAsset.decor4,
                            hPadding: w(8),
                            name: "Grekoka St, 107",
                            textAlignment: Alignment.centerLeft,
                            delay: const Duration(milliseconds: 7600)),
                      ],
                    );
                  }),
                ),
              ],
            ),
            yspace(110)
          ],
        ));
  }
}
