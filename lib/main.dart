import './Customs/routes/imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokernation App',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            scaffoldBackgroundColor: Colors.transparent),
        home: const PlayerHome(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: renderBody(
          child: Scaffold(
        appBar: renderAppbar(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                assetImage('assets/images/login-signup.png', true),
                customText('SIGNUP', AppStyles.HEADING,
                    color: AppColors.PRIMARY_WHITE),
                customText(
                    'Sundays at the Royal Derby Hotel', AppStyles.DESCRIPTION,
                    color: AppColors.PRIMARY_WHITE),
                customText('MELBOURNE METRO'.toUpperCase(), AppStyles.LARGE,
                    color: AppColors.PRIMARY_WHITE),
                customText('Have account? sign in', AppStyles.MEDIUM,
                    color: AppColors.PRIMARY_WHITE),
                customText('Nightly Events', AppStyles.SMALL,
                    color: AppColors.PRIMARY_WHITE),
                SizedBox(
                  width: 300, // Adjust width as needed
                  child: customTextBox('Enter your text', TextInputType.text,
                      TextEditingController()),
                ),
                SizedBox(
                  width: 300, // Adjust width as needed
                  child: customTextBox('Enter your text', TextInputType.text,
                      TextEditingController()),
                ),
                SizedBox(
                  width: 150, // Adjust width as needed
                  child: customButton('Signup', () {}),
                ),
                assetImage('assets/images/splash.png', false),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
