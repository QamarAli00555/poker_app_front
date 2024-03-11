import 'package:flutter/widgets.dart';

Widget pageDescription(List<Widget> children, EdgeInsetsGeometry padding) {
  return Padding(
    padding: padding,
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children),
  );
}
