import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/custom_colors.dart';

Widget renderBody({required Widget child}) {
  return Container(
    width: double.infinity.w,
    height: double.infinity.h,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [AppColors.GRADIANT_1, AppColors.GRADIANT_2],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: child,
  );
}
