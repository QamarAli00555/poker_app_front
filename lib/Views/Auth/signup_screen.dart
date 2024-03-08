import '../../Customs/routes/imports.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
          customText('SIGNUP', AppStyles.HEADING,
              color: AppColors.PRIMARY_WHITE),
          heightSpacer(50.h),
          customTextBox('Name', TextInputType.name, TextEditingController()),
          customTextBox(
              'Email', TextInputType.emailAddress, TextEditingController()),
          customTextBox(
              'Phone Number', TextInputType.number, TextEditingController()),
          customTextBox(
              'Password', TextInputType.datetime, TextEditingController()),
          heightSpacer(35.h),
          customButton('SIGNUP', () {
            navigateToScreen(const LoginScreen(), context);
          }),
          heightSpacer(15.h),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              customText('Have Account ?', AppStyles.MEDIUM,
                  color: AppColors.PRIMARY_WHITE),
              widthSpacer(5),
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
