import 'package:flutter/material.dart';

void navigateToScreen(Widget pageName, BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => pageName));
}
