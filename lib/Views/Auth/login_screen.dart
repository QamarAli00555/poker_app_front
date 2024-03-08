import '../../Customs/routes/imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return renderBody(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          assetImage('assets/images/login-signup.png', true),
          heightSpacer(30.h),
          customText('LOGIN', AppStyles.HEADING,
              color: AppColors.PRIMARY_WHITE),
          heightSpacer(50.h),
          customTextBox(
              'Email', TextInputType.emailAddress, TextEditingController()),
          customTextBox(
              'Password', TextInputType.datetime, TextEditingController()),
          heightSpacer(40.h),
          customButton('LOGIN', () => PlayerScreens.PLAYERHOME(context)),
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
      ),
    ));
  }
}
