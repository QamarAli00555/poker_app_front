import '../../Customs/routes/imports.dart';

class PlayerHome extends StatefulWidget {
  const PlayerHome({Key? key}) : super(key: key);

  @override
  State<PlayerHome> createState() => _PlayerHomeState();
}

class _PlayerHomeState extends State<PlayerHome> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Alert.showConfirmationDialogue(context) ?? false;
      },
      child: renderBody(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            drawer: playerDrawer(context),
            key: scaffoldKey,
            appBar: renderAppbar(
              tabBar: true,
              leading: () {
                scaffoldKey.currentState!.openDrawer();
              },
              trailing: () {
                PlayerScreens.PLAYERLOGOUT(context);
              },
            ),
            body: TabBarView(
              children: [nightlyEvents(context), featuredEvents()],
            ),
          ),
        ),
      ),
    );
  }

  Container featuredEvents() {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          pageDescription([
            customText(
              'Featured Events',
              AppStyles.MEDIUM,
            ),
            const Spacer(),
            customText(
              '',
              AppStyles.SUB_HEADING,
            ),
          ], EdgeInsets.symmetric(vertical: 15, horizontal: 20.w)),
          customText('Dracakis Tournament of Champions', AppStyles.HEADING),
          heightSpacer(20.h),
          InkWell(
            onTap: () {
              PlayerScreens.FEATUREDEVENTDETAILS(context);
            },
            child: Image.asset(
              ImagePath.FEATURED_EVENTS_IMAGE_1,
              width: AppWidgetsSize.NORMAL_CONTAINER * .9,
            ),
          ),
          heightSpacer(20.h),
          customText('National Finals', AppStyles.HEADING),
          heightSpacer(20.h),
          InkWell(
            onTap: () {
              PlayerScreens.FEATUREDEVENTDETAILS(context);
            },
            child: Image.asset(
              ImagePath.FEATURED_EVENTS_IMAGE_2,
              width: AppWidgetsSize.NORMAL_CONTAINER * .9,
            ),
          ),
        ],
      ),
    );
  }

  Container nightlyEvents(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          pageDescription([
            customText(
              'Nightly Events',
              AppStyles.MEDIUM,
            ),
            const Spacer(),
            customText(
              '',
              AppStyles.SUB_HEADING,
            ),
          ], EdgeInsets.symmetric(vertical: 15, horizontal: 20.w)),
          Expanded(
              child: Wrap(
            children: List.generate(
                6,
                (index) => Container(
                      width: AppWidgetsSize.TILE_WIDTH,
                      color: Colors.transparent,
                      margin: const EdgeInsets.all(5),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        child: ListTile(
                          onTap: () {
                            PlayerScreens.NIGHTLYEVENTDETAILS(context);
                          },
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          tileColor:
                              Colors.transparent, // AppColors.PRIMARY_WHITE,
                          leading: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 25,
                            backgroundImage: AssetImage(ImagePath.APP_LOGO),
                          ),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              customText('Sunday', AppStyles.LARGE,
                                  color: AppColors.PRIMARY_BLACK),
                              widthSpacer(5),
                              customText('(Fitzroy)', AppStyles.SMALL,
                                  color: AppColors.PRIMARY_BLACK),
                              const Spacer(),
                              customText('12/20', AppStyles.MEDIUM,
                                  color: AppColors.PRIMARY_GOLD)
                            ],
                          ),
                          subtitle: customText(
                              'Event Description', AppStyles.LARGE,
                              color: AppColors.LIGHT_BLUE),
                          trailing: Container(
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(left: BorderSide()),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: customText('\$25', AppStyles.MEDIUM,
                                  color: AppColors.LIGHT_BLUE),
                            ),
                          ),
                        ),
                      ),
                    )),
          )),
        ],
      ),
    );
  }
}
