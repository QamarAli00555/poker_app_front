import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Customs/colors/custom_colors.dart';
import '../../Customs/image/paths.dart';
import '../../Customs/screens/player_screens.dart';
import '../../Customs/styles/font_sizes.dart';
import '../../Customs/widgets/appbar_widget.dart';
import '../../Customs/widgets/confirmation_dialogue.dart';
import '../../Customs/widgets/gradiant_body_widget.dart';
import '../../Customs/widgets/height_spacer.dart';
import '../../Customs/widgets/page_description.dart';
import '../../Customs/widgets/text_widget.dart';
import '../../Utils/enums.dart';
import 'drawer_screen.dart';

class FeaturedEventDetails extends StatelessWidget {
  FeaturedEventDetails({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // Define a list of random poker player names
  final List<String> playerNames = [
    'John Doe',
    'Alice Smith',
    'Bob Johnson',
    'Emma Brown',
    'Michael Wilson',
    // Add more names as needed
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Alert.showConfirmationDialogue(context) ?? false;
      },
      child: renderBody(
        child: Scaffold(
          drawer: playerDrawer(context),
          key: scaffoldKey,
          appBar: renderAppbar(
            revT: true,
            leading: () {
              PlayerScreens.NAVIGATEBACK(context);
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: SizedBox(
                  width: AppWidgetsSize.NORMAL_CONTAINER,
                  height: (AppWidgetsSize.NORMAL_CONTAINER * 2.1).h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      heightSpacer(15.h),
                      pageDescription([
                        customText(
                          'Featured Events',
                          AppStyles.SMALL,
                        ),
                      ], const EdgeInsets.symmetric(vertical: 5)),
                      customText(
                        '2024 Tournament of Champions',
                        AppStyles.HEADING,
                      ),
                      heightSpacer(10.h),
                      InkWell(
                        child: Image.asset(
                          ImagePath.FEATURED_EVENTS_IMAGE_1,
                          width: AppWidgetsSize.NORMAL_CONTAINER,
                        ),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Wrap(
                          children: List.generate(40, (index) {
                            return Container(
                              width: AppWidgetsSize.NORMAL_CONTAINER * 0.33,
                              // height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: AppColors.PRIMARY_GOLD)),
                              padding: EdgeInsets.all(5.w),
                              child: customText(
                                  'Michael Borg 2', AppStyles.SMALL,
                                  color: AppColors.PRIMARY_BLACK),
                            );
                          }),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
