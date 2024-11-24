import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint/core/constants/app_text.dart';
import 'package:moniepoint/core/constants/png_image_asset.dart';
import 'package:moniepoint/shared/components/network_image_viewer_component.dart';
import 'package:moniepoint/shared/utils/space.dart';

class UserAvatar extends StatelessWidget {
  final Duration duration;
  const UserAvatar({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [ScaleEffect(duration: duration)],
      child: NetworkImageViewerComponent(
          width: w(45),
          height: w(45),
          radius: w(45) / 2,
          url: AppText.avatar,
          placeHolder: ImageAsset.avatar,
          initials: "IZ"),
    );
  }
}
