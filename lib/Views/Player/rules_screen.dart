import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Customs/colors/custom_colors.dart';
import '../../Customs/image/paths.dart';
import '../../Customs/screens/player_screens.dart';
import '../../Customs/styles/font_sizes.dart';
import '../../Customs/widgets/appbar_widget.dart';
import '../../Customs/widgets/confirmation_dialogue.dart';
import '../../Customs/widgets/dividers_methods.dart';
import '../../Customs/widgets/gradiant_body_widget.dart';
import '../../Customs/widgets/height_spacer.dart';
import '../../Customs/widgets/page_description.dart';
import '../../Customs/widgets/text_widget.dart';
import '../../Utils/enums.dart';
import 'drawer_screen.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Alert.showConfirmationDialogue(context) ?? false;
      },
      child: renderBody(
        child: Scaffold(
          drawer: playerDrawer(context),
          appBar: renderAppbar(
            revT: true,
            leading: () {
              PlayerScreens.NAVIGATEBACK(context);
            },
            // trailing: () {
            //   scaffoldKey.currentState!.openDrawer();
            // },
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: SizedBox(
                width: AppWidgetsSize.NORMAL_CONTAINER,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    heightSpacer(30.h),
                    customText('Rules', AppStyles.HEADING),
                    goldDivider(),
                    heightSpacer(30.h),
                    pageDescription([
                      customText('Official Poker TDA Rules', AppStyles.MEDIUM,
                          color: AppColors.PRIMARY_WHITE),
                    ], const EdgeInsets.only(left: 0)),
                    heightSpacer(20.h),
                    customText(
                        'Poker Nation is proud to follow the official Poker Tournament Director\'s rules. The Poker TDA is a voluntary trade association of the poker tournament industry. The Association is dedicated to adopting a uniform set of poker tournament rules worldwide.',
                        AppStyles.SMALL,
                        align: TextAlign.justify,
                        maxLine: null),
                    heightSpacer(15.h),
                    Image.asset(
                      ImagePath.RULES,
                      width: AppWidgetsSize.NORMAL_CONTAINER * .9,
                    ),
                    heightSpacer(15.h),
                    customText(
                        'To view and download the updated rules, click here.',
                        AppStyles.SMALL,
                        align: TextAlign.justify,
                        maxLine: null),
                    heightSpacer(15.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
