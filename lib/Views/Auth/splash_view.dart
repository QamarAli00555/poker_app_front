import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Customs/colors/custom_colors.dart';
import '../../Customs/image/custom_image.dart';
import '../../Customs/routes/navigations.dart';
import '../../Customs/widgets/button_widget.dart';
import '../../Customs/widgets/gradiant_body_widget.dart';
import '../../Customs/widgets/height_spacer.dart';
import '../../Customs/widgets/text_widget.dart';
import '../../Customs/widgets/width_spacer.dart';
import '../../Utils/enums.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return renderBody(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          heightSpacer(200.h),
          assetImage('assets/images/splash.png', false),
          heightSpacer(250.h),
          customButton('SIGNUP', () {
            navigateToScreen(const SignupScreen(), context);
          }),
          heightSpacer(15.h),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              customText('Have Account?', AppStyles.MEDIUM,
                  color: AppColors.PRIMARY_WHITE),
              widthSpacer(5.w),
              InkWell(
                onTap: () {
                  navigateToScreen(const LoginScreen(), context);
                },
                child: customText('Sign in', AppStyles.LARGE,
                    color: AppColors.PRIMARY_GOLD),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
