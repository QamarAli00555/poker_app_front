import '../routes/imports.dart';

void navigateToScreen(Widget pageName, BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => pageName));
}
