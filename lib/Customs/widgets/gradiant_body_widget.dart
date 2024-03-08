import '../../Customs/routes/imports.dart';

Widget renderBody({required Widget child}) {
  return Container(
    width: double.infinity.w,
    height: double.infinity.h,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF052038), Color(0xFF0E669E)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: child,
  );
}
