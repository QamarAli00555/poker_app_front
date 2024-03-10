import '../../Customs/routes/imports.dart';

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
