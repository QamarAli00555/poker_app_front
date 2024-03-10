import '../../Customs/routes/imports.dart';

class Sponsors extends StatelessWidget {
  Sponsors({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use

    ScreenUtil.init(context, designSize: const Size(360, 690));
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
                    pageDescription([
                      customText(
                        'SPONSORS',
                        AppStyles.MEDIUM,
                      ),
                    ], const EdgeInsets.symmetric(vertical: 5)),
                    customText('Lambert Estate Wines', AppStyles.HEADING),
                    customText('Shop Wines Here', AppStyles.MEDIUM,
                        underline: true),
                    heightSpacer(20.h),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(
                              ImagePath.SPONSORS_IMAGE_1,
                              width: AppWidgetsSize.NORMAL_CONTAINER,
                            ),
                            heightSpacer(15.h),
                            customText(
                                'Lambert Estate Wines is a beautiful boutique winery, vineyard, restaurant, event center & accommodation owned and operated by the Lambert family in the Barossa Valley, South Australia. They grow 11 different varieties of grapes on our 120-acre vineyard. They offer 15 wines including sparkling, whites, reds and port.',
                                AppStyles.SMALL,
                                align: TextAlign.justify,
                                maxLine: null),
                            heightSpacer(15.h),
                            Image.asset(
                              ImagePath.SPONSORS_IMAGE_2,
                              width: AppWidgetsSize.NORMAL_CONTAINER,
                            ),
                            heightSpacer(15.h),
                            customText(
                                'Whether you’re thinking of wine, food, organizing an event, or you even fancy staying with them for a few days, there’s plenty to enjoy at Lambert Estate.\n\nHow it all began…\n\nWhen Jim Lambert’s business travels brought him to Australia in the 1990’s, he realized his love of wine and beautiful places could mark out a new future for him and Pam, his wife. This dream was realized when they discovered the vineyards in the Barossa hills that would become Lambert Estate.',
                                AppStyles.SMALL,
                                align: TextAlign.justify,
                                maxLine: null),
                            heightSpacer(15.h),
                            Image.asset(
                              ImagePath.SPONSORS_IMAGE_3,
                              width: AppWidgetsSize.NORMAL_CONTAINER,
                            ),
                            heightSpacer(15.h),
                            customText(
                                'Their son Kirk joined Jim and Pam on their journey from Wisconsin in the USA to the Barossa. Kirk studied wine making at the University of Adelaide and it was there that he met and fell in love with fellow student Vanesa. Now married, it’s Kirk and Vanesa who fuse their American and Peruvian backgrounds with their expertise in wine making. It’s a fusion that brings their flair and individuality into every bottle of multiple award winning Lambert Estate wine.',
                                AppStyles.SMALL,
                                align: TextAlign.justify,
                                maxLine: null),
                            heightSpacer(15.h),
                            Image.asset(
                              ImagePath.SPONSORS_IMAGE_4,
                              width: AppWidgetsSize.NORMAL_CONTAINER,
                            ),
                            heightSpacer(15.h),
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
