import '../../Customs/routes/imports.dart';

class Partners extends StatelessWidget {
  const Partners({super.key});

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
                    heightSpacer(40.h),
                    customText('Our Partners', AppStyles.HEADING),
                    // Text(
                    //   'Our Partners',
                    //   style: TextStyle(
                    //       color: AppColors.PRIMARY_GOLD, fontSize: 16.sp),
                    // ),
                    heightSpacer(20.h),
                    const CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        ImagePath.PARTNERS,
                      ),
                    ),
                    heightSpacer(20.h),
                    customText(
                        'Australian Poker Tour is our major partner and is responsible for hosting some of the biggest poker tournaments in Australia with total prize pools reaching over \$700,000, with a wide variety of events and buy ins and with events held in The Gold Coast, Sydney & Brisbane they have something for everyone. Check out APT’s website to see Upcoming Events.',
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
