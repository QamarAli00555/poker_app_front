import '../../Customs/routes/imports.dart';

class ContactPlayers extends StatefulWidget {
  const ContactPlayers({Key? key}) : super(key: key);

  @override
  State<ContactPlayers> createState() => _ContactPlayersState();
}

class _ContactPlayersState extends State<ContactPlayers> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                    customText('PLAYERS', AppStyles.HEADING),
                    heightSpacer(20.h),
                    customText(
                        'Get in touch with us below or call 0429 110 855.',
                        AppStyles.SMALL,
                        align: TextAlign.justify,
                        maxLine: null),
                    heightSpacer(10.h),
                    customTextBox(
                        'Name', TextInputType.name, TextEditingController()),
                    customTextBox('Email', TextInputType.emailAddress,
                        TextEditingController()),
                    customTextBox(
                        'Message', TextInputType.text, TextEditingController(),
                        lines: 50),
                    heightSpacer(40.h),
                    customButton('SUBMIT', () {}),
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
