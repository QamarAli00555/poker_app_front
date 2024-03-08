import '../../Customs/routes/imports.dart';

Future<dynamic> showConfirmationDialogue(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.question_mark,
        color: AppColors.PRIMARY_BLACK,
      ),
      title: const Text(
        'Confirmation',
        style: TextStyle(fontSize: AppFontSizes.DESCRIPTION),
      ),
      content: const Text('Are you sure you want to exit?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .pop(false); // Dismiss the dialog and return false
          },
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .pop(true); // Dismiss the dialog and return true
          },
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}
