import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Controllers/Auth/login_notifier.dart';
import '../../Customs/colors/custom_colors.dart';
import '../../Customs/image/custom_image.dart';
import '../../Customs/routes/navigations.dart';
import '../../Customs/widgets/button_widget.dart';
import '../../Customs/widgets/gradiant_body_widget.dart';
import '../../Customs/widgets/height_spacer.dart';
import '../../Customs/widgets/text_widget.dart';
import '../../Customs/widgets/textbox_widget.dart';
import '../../Customs/widgets/width_spacer.dart';
import '../../Utils/enums.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return renderBody(
      child: Scaffold(body: Consumer<LoginNotifier>(
        builder: (context, loginNotifier, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              assetImage('assets/images/login-signup.png', true),
              heightSpacer(30.h),
              customText('LOGIN', AppStyles.HEADING,
                  color: AppColors.PRIMARY_WHITE),
              heightSpacer(50.h),
              customTextBox(
                'Email',
                TextInputType.emailAddress,
                loginNotifier.emailController,
              ),
              customTextBox('Password', TextInputType.text,
                  loginNotifier.passwordController),
              heightSpacer(40.h),
              customButton('LOGIN', () async {
                await loginNotifier.login(context);
              }),
              heightSpacer(15.h),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  customText('Don\'t have and Account ?', AppStyles.MEDIUM,
                      color: AppColors.PRIMARY_WHITE),
                  widthSpacer(5),
                  InkWell(
                    onTap: () {
                      navigateToScreen(const SignupScreen(), context);
                    },
                    child: customText('Signup', AppStyles.LARGE,
                        color: AppColors.PRIMARY_GOLD),
                  ),
                ],
              )
            ],
          );
        },
      )),
    );
  }
}
