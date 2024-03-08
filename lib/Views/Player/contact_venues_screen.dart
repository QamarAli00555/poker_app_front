import '../../Customs/routes/imports.dart';

class ContactVenues extends StatefulWidget {
  const ContactVenues({Key? key}) : super(key: key);

  @override
  State<ContactVenues> createState() => _ContactVenuesState();
}

class _ContactVenuesState extends State<ContactVenues> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Alert.showConfirmationDialogue(context) ?? false;
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
                    customText('VENUES', AppStyles.HEADING),
                    heightSpacer(20.h),
                    SizedBox(
                      width: AppWidgetsSize.TEXTFIELD,
                      child: customText(
                          'We help our venues keep their place busy! Don\'t hesitate to contact us on 0429 110 855 or leave us a message below.',
                          AppStyles.SMALL,
                          align: TextAlign.justify,
                          maxLine: null),
                    ),
                    heightSpacer(10.h),
                    customTextBox(
                        'Name', TextInputType.name, TextEditingController()),
                    customTextBox('Email', TextInputType.emailAddress,
                        TextEditingController()),
                    customTextBox(
                        'Message', TextInputType.text, TextEditingController(),
                        lines: 50),
                    heightSpacer(30.h),
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
