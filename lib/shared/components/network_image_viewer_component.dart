import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint/core/theme/app_color.dart';
import 'package:moniepoint/shared/utils/textstyles.dart';

class NetworkImageViewerComponent extends StatelessWidget {
  final String url;
  final String initials;
  final String placeHolder;
  final double? width;
  final double? height;
  final double? radius;
  final BoxFit? boxFit;
  NetworkImageViewerComponent(
      {super.key,
      required this.url,
      required this.initials,
      required this.placeHolder,
      this.height,
      this.width,
      this.radius,
      this.boxFit});

  final double w = 28.w;
  final double h = 28.w;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 16.r),
      child: SizedBox(
        width: width ?? w,
        height: height ?? h,
        child: CachedNetworkImage(
          imageUrl: url,
          width: width ?? w,
          height: height ?? h,
          placeholder: (context, url) {
            return _placeHolder();
          },
          errorWidget: (context, _, url) {
            return _imagePlaceHolder();
          },
          fit: boxFit ?? BoxFit.cover,
        ),
      ),
    );
  }

  _imagePlaceHolder() {
    return SizedBox(
      width: width ?? w,
      height: height ?? h,
      child: Image.asset(
        placeHolder,
        width: width ?? w,
        height: height ?? h,
        fit: boxFit ?? BoxFit.cover,
      ),
    );
  }

  _placeHolder() {
    return Container(
      width: width ?? w,
      height: height ?? h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: appColor.primary,
          borderRadius: BorderRadius.circular(radius ?? 16),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [appColor.pitburg, appColor.pitburg])),
      child: Text(
        initials,
        style: P16.sb().copyWith(color: appColor.primary),
      ),
    );
  }
}
