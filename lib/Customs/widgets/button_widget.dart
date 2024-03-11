import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/enums.dart';
import '../colors/custom_colors.dart';
import '../styles/font_sizes.dart';
import 'text_widget.dart';

Widget customButton(final String text, final Function() onpress) {
  return InkWell(
    onTap: onpress,
    borderRadius: BorderRadius.circular(10),
    child: SizedBox(
      width: AppWidgetsSize.BUTTON,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          //double maxWidth = constraints.maxWidth;
          //double idealFontSize =maxWidth * 0.05; // Adjust this multiplier for desired text size

          return Container(
              height: 47.h,
              decoration: BoxDecoration(
                  color: AppColors.PRIMARY_GOLD,
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: customText(text, AppStyles.DESCRIPTION));
        },
      ),
    ),
  );
}
