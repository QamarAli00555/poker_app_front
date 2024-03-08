import '../../Customs/routes/imports.dart';

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
