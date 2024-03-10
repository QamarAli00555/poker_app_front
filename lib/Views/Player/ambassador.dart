import '../../Customs/routes/imports.dart';

class Ambassador extends StatelessWidget {
  Ambassador({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool v) async {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    heightSpacer(30.h),
                    customText('Ambassador', AppStyles.HEADING),
                    goldDivider(),
                    heightSpacer(15.h),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            customText(
                                'Ambassador Double Up', AppStyles.DESCRIPTION),
                            heightSpacer(15.h),
                            customText(
                                'The ambassador entry fee is an optional chip up method for players. The ambassador entry fee does not go into the prize pool. The entry fee is used to fund a future tournament where players can win for themselves an ambassadorship and play for free for 6 months.',
                                AppStyles.SMALL,
                                align: TextAlign.justify,
                                maxLine: null),
                            heightSpacer(15.h),
                            customText('Ambassadors', AppStyles.DESCRIPTION),
                            customText(
                                'Poker Nation welcomes Shurane Vijayaram!',
                                AppStyles.MEDIUM),
                            heightSpacer(15.h),
                            customText(
                                'This man requires no introduction. We present the Aussie Millions main even champ from 2017 where he pocketed a cool \$1,600,000!\nPut your hands together and help us welcome Shurane to team Poker Nation!',
                                AppStyles.SMALL,
                                align: TextAlign.justify,
                                maxLine: null),
                            Image.asset(
                              ImagePath.AMBASSADOR_1,
                              width: AppWidgetsSize.NORMAL_CONTAINER,
                            ),
                            customText('Poker Nation welcomes Susan Waller!',
                                AppStyles.MEDIUM),
                            heightSpacer(15.h),
                            customText(
                                'With a record 33 Poker Nation titles to her name already, Susan takes no prisoners! Don’t let the smile fool you, she will show you no mercy on the felt!',
                                AppStyles.SMALL,
                                align: TextAlign.justify,
                                maxLine: null),
                            Image.asset(
                              ImagePath.AMBASSADOR_2,
                              width: AppWidgetsSize.NORMAL_CONTAINER,
                            ),
                            customText('Poker Nation welcomes Greg Hoy!',
                                AppStyles.MEDIUM),
                            heightSpacer(15.h),
                            customText(
                                'Greg Hoy is very skilled at the felt. Being a regular not only at our City games but also the final tables. Welcome aboard Greg!',
                                AppStyles.SMALL,
                                align: TextAlign.justify,
                                maxLine: null),
                            Image.asset(
                              ImagePath.AMBASSADOR_3,
                              width: AppWidgetsSize.NORMAL_CONTAINER,
                            ),
                            customText('Poker Nation welcomes Renato Trentin!',
                                AppStyles.MEDIUM),
                            heightSpacer(15.h),
                            customText(
                                'Renato has been playing the poker pub circuit for over 20 years, with recent years seeing him participate in the Poker Tours across Australia. He has made many final tables on various tours, but have not managed to obtain an official title at an event, which will be his focus for 2024.',
                                AppStyles.SMALL,
                                align: TextAlign.justify,
                                maxLine: null),
                            Image.asset(
                              ImagePath.AMBASSADOR_4,
                              width: AppWidgetsSize.NORMAL_CONTAINER,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container infoTable() {
    return Container(
      color: AppColors.PRIMARY_WHITE,
      width: AppWidgetsSize.NORMAL_CONTAINER,
      height: 100,
      child: Column(
        children: [
          tableRow(ImagePath.EVENTDETAILS_IMAGE_1,
              "446 Brunswick Street Fitzroy VIC 3065 Map"),
          horDivider(),
          tableRow(ImagePath.EVENTDETAILS_IMAGE_2, "SUNDAYS", isBold: true),
          horDivider(),
          tableRow(ImagePath.EVENTDETAILS_IMAGE_3, "TBD"),
        ],
      ),
    );
  }

  Expanded tableRow(String imagePath, String text, {bool? isBold}) {
    return Expanded(
      child: Row(
        children: [
          imageCell(imagePath),
          vertDivider(),
          Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                alignment: Alignment.centerLeft,
                child: customText(text, AppStyles.SMALL,
                    color: AppColors.PRIMARY_BLACK, isBold: isBold),
              )),
        ],
      ),
    );
  }

  Expanded imageCell(String path) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(5),
      child: Image.asset(
        path,
        width: 35,
        height: 35,
      ),
    ));
  }
}
