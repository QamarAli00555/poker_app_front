import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Customs/image/paths.dart';
import '../../Customs/screens/player_screens.dart';
import '../../Customs/styles/font_sizes.dart';
import '../../Customs/widgets/appbar_widget.dart';
import '../../Customs/widgets/button_widget.dart';
import '../../Customs/widgets/confirmation_dialogue.dart';
import '../../Customs/widgets/dividers_methods.dart';
import '../../Customs/widgets/gradiant_body_widget.dart';
import '../../Customs/widgets/height_spacer.dart';
import '../../Customs/widgets/page_description.dart';
import '../../Customs/widgets/text_widget.dart';
import '../../Customs/widgets/textbox_widget.dart';
import '../../Customs/widgets/width_spacer.dart';
import '../../Utils/enums.dart';
import 'drawer_screen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                    goldDivider(),
                    pageDescription([
                      customText('Profile', AppStyles.MEDIUM),
                    ], const EdgeInsets.all(0)),
                    heightSpacer(30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            ImagePath.PROFILE,
                          ),
                        ),
                        widthSpacer(20.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText('My Full Name', AppStyles.MEDIUM),
                            customText('Player', AppStyles.SMALL),
                          ],
                        )
                      ],
                    ),
                    heightSpacer(30.h),
                    customTextBox(
                        'Name', TextInputType.name, TextEditingController(),
                        isProfile: true),
                    customTextBox('Email', TextInputType.emailAddress,
                        TextEditingController(),
                        isProfile: true),
                    customTextBox('Phone Number', TextInputType.number,
                        TextEditingController(),
                        isProfile: true),
                    customTextBox('Password', TextInputType.datetime,
                        TextEditingController(),
                        isProfile: true),
                    customTextBox('Confirm Password', TextInputType.datetime,
                        TextEditingController(),
                        isProfile: true),
                    heightSpacer(35.h),
                    customButton('UPDATE', () {}),
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
