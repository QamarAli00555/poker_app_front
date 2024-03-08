import '../../Customs/routes/imports.dart';

class NightlyEventDetails extends StatelessWidget {
  NightlyEventDetails({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return await showConfirmationDialogue(context) ?? false;
      },
      child: renderBody(
        child: Scaffold(
          drawer: myDrawer(context),
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: SizedBox(
                  width: AppWidgetsSize.NORMAL_CONTAINER,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      pageDescription([
                        customText(
                          'Nightly Events',
                          AppStyles.MEDIUM,
                        ),
                      ], const EdgeInsets.symmetric(vertical: 5)),
                      customText('MELBOURNE METRO', AppStyles.MEDIUM,
                          underline: true),
                      customText('Sundays at the Royal Derby Hotel',
                          AppStyles.HEADING),
                      heightSpacer(40.h),
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                          ImagePath.ROYAL_DERBY_IMG,
                        ),
                      ),
                      heightSpacer(10.h),
                      customText(
                          'The Royal Derby Hotel, A Brilliant Choice for Poker in Fitzroy',
                          align: TextAlign.left,
                          AppStyles.MEDIUM),
                      heightSpacer(15.h),
                      customText(
                          'Whether you’re a first timer, amateur or ‘pro’ player, try bluffing, raising and playing short stacked. It is perfect for those who just want to have a good time in a friendly atmosphere.',
                          AppStyles.SMALL,
                          align: TextAlign.left,
                          maxLine: null),
                      heightSpacer(15.h),
                      infoTable(),
                      SizedBox(
                        width: AppWidgetsSize.NORMAL_CONTAINER,
                        child: pageDescription([
                          customText(
                            'Details /  Chips Up',
                            AppStyles.MEDIUM,
                          ),
                        ], const EdgeInsets.symmetric(vertical: 5)),
                      ),
                      SizedBox(
                        width: AppWidgetsSize.NORMAL_CONTAINER,
                        child: pageDescription([
                          customText(
                            '• TBD',
                            AppStyles.MEDIUM,
                          ),
                        ], const EdgeInsets.symmetric(vertical: 5)),
                      ),
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
