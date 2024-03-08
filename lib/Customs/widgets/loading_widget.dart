import '../routes/imports.dart';

class LoadingPopup {
  static void show(BuildContext context, bool isLoading) {
    if (isLoading) {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent user from dismissing dialog
        builder: (BuildContext context) {
          return const Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: SpinKitSquareCircle(
                color: AppColors.PRIMARY_GOLD,
                size: 75.0,
                duration: Duration(milliseconds: 700),
              ),
            ),
          );
        },
      );
    } else {
      Navigator.of(context).pop(); // Close the dialog if it's already open
    }
  }
}
