import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/enums.dart';
import '../colors/custom_colors.dart';
import '../styles/font_sizes.dart';
import 'height_spacer.dart';
import 'text_widget.dart';

class Alert {
  static Future<dynamic> showConfirmationDialogue(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.question_mark,
          color: AppColors.PRIMARY_BLACK,
        ),
        title: Text(
          'Confirmation',
          style: TextStyle(fontSize: AppFontSizes.DESCRIPTION),
        ),
        content: const Text('Are you sure you want to exit?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(false); // Dismiss the dialog and return false
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(true); // Dismiss the dialog and return true
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  static Future<dynamic> showMessage(String message, BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          customText(message, AppStyles.SMALL, color: AppColors.RED),
          heightSpacer(30.h)
        ],
      ),
    );
  }
}
