import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget assetImage(String path, bool? maxWidth,
    {double? width, double? height}) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      if (maxWidth == true) {
        return Image.asset(
          path,
          width: width ?? MediaQuery.of(context).size.width,
          height: height ?? 220.h,
          fit: BoxFit.cover,
        );
      } else {
        return Image.asset(
          path,
          width: width ?? double.infinity.w,
          height: height ?? 160.h,
          fit: BoxFit.contain,
        );
      }
    },
  );
}
