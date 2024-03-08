import '../../Customs/routes/imports.dart';

Widget renderBody({required Widget child}) {
  return Container(
    width: double.infinity.w,
    height: double.infinity.h,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [AppColors.GRADIANT_1, AppColors.GRADIANT_2],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: child,
  );
}
