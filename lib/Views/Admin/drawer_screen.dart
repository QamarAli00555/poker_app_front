import 'package:flutter/material.dart';

import '../../Customs/colors/custom_colors.dart';
import '../../Customs/image/paths.dart';
import '../../Customs/screens/admin_screens.dart';
import '../../Customs/screens/player_screens.dart';
import '../../Customs/widgets/height_spacer.dart';

Drawer adminDrawer(BuildContext context) {
  // Widget subItem(String text, Function() onTap) {
  //   return ListTile(
  //     title: Text(
  //       text,
  //       style: const TextStyle(color: Colors.white),
  //     ),
  //     onTap: onTap,
  //     tileColor: Colors.black,
  //   );
  // }

  Widget drawerItem({
    required String text,
    required IconData icon,
    Function()? onTap,
    List<Widget>? children,
  }) {
    return children != null && children.isNotEmpty
        ? ExpansionTile(
            title: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),

            controlAffinity: ListTileControlAffinity.trailing,
            backgroundColor: Colors.transparent,
            iconColor: AppColors.PRIMARY_WHITE,
            childrenPadding: const EdgeInsets.only(left: 30),
            collapsedIconColor: AppColors.PRIMARY_WHITE,
            children: children, // Background color for items
          )
        : ListTile(
            leading: Icon(icon, color: Colors.white),
            title: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            onTap: onTap,
            tileColor: Colors.black,
          );
  }

  return Drawer(
    elevation: 10,
    child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF052038), Color(0xFF0E669E)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(ImagePath.APP_LOGO),
                radius: 80,
              ),
            ),
          ),
          drawerItem(
            text: 'All Events',
            icon: Icons.event,
            onTap: () {
              AdminScreens.NAVIGATEBACK(context);
              AdminScreens.ALLEVENTS(context);
            },
          ),
          drawerItem(
            text: 'Create Events',
            icon: Icons.new_label,
            onTap: () {
              AdminScreens.NAVIGATEBACK(context);
              AdminScreens.CREATEEVENTS(context);
            },
          ),
          drawerItem(
            text: 'Add Sponsors',
            icon: Icons.business,
            onTap: () {
              AdminScreens.NAVIGATEBACK(context);
              AdminScreens.ADDSPONSORS(context);
            },
          ),
          drawerItem(
            text: 'Add Rules & Partners',
            icon: Icons.rule,
            onTap: () {
              PlayerScreens.NAVIGATEBACK(context);
              AdminScreens.ADDRULESANDPARTNERS(context);
            },
          ),
          drawerItem(
            text: 'Add Who We Are',
            icon: Icons.group,
            onTap: () {
              PlayerScreens.NAVIGATEBACK(context);
              AdminScreens.ADDWHOWEARE(context);
            },
          ),
          drawerItem(
            text: 'Logout',
            icon: Icons.logout,
            onTap: () {
              Navigator.pop(context);
              PlayerScreens.PLAYERLOGOUT(context);
            },
          ),
          heightSpacer(20),
        ],
      ),
    ),
  );
}
