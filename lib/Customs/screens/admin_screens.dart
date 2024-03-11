// ignore_for_file: non_constant_identifier_names, constant_identifier_n, constant_identifier_names

import 'package:flutter/material.dart';

import '../../Views/Admin/add_rules_partners_scree.dart';
import '../../Views/Admin/add_sponsors_screen.dart';
import '../../Views/Admin/add_who_we_are_screen.dart';
import '../../Views/Admin/all_events_screen.dart';
import '../../Views/Admin/create_events_screen.dart';
import '../../Views/Auth/login_screen.dart';
import '../routes/navigations.dart';

class AdminScreens {
  static const Widget _ALL_EVENTS = AllEvents();
  static const Widget _CREATE_NIGHTLY_EVENT = CreateEvents();
  static const Widget _ADD_SPONSORS = AddSponsors();
  static const Widget _ADD_RULES_PARTNERS = AddRulesAndPartners();
  static const Widget _ADD_WHO_WE_ARE = AddWhoWeAre();
  static const Widget _LOGOUT = LoginScreen();

  static ALLEVENTS(BuildContext context) {
    navigateToScreen(_ALL_EVENTS, context);
  }

  static CREATEEVENTS(BuildContext context) {
    navigateToScreen(_CREATE_NIGHTLY_EVENT, context);
  }

  static ADDSPONSORS(BuildContext context) {
    navigateToScreen(_ADD_SPONSORS, context);
  }

  static ADDRULESANDPARTNERS(BuildContext context) {
    navigateToScreen(_ADD_RULES_PARTNERS, context);
  }

  static ADDWHOWEARE(BuildContext context) {
    navigateToScreen(_ADD_WHO_WE_ARE, context);
  }

  static ADMINLOGOUT(BuildContext context) {
    navigateToScreen(_LOGOUT, context);
  }

  static NAVIGATEBACK(BuildContext context) {
    Navigator.pop(context);
  }
}
