import 'package:flutter/material.dart';

import '../../Customs/colors/custom_colors.dart';
import '../../Customs/image/paths.dart';
import '../../Customs/screens/player_screens.dart';
import '../../Customs/widgets/height_spacer.dart';

Drawer playerDrawer(BuildContext context) {
  Widget subItem(String text, Function() onTap) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: onTap,
      tileColor: Colors.black,
    );
  }

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
            text: 'Home',
            icon: Icons.home,
            onTap: () {
              PlayerScreens.PLAYERHOME(context);
            },
          ),
          drawerItem(
            text: 'Featured Events',
            icon: Icons.star,
            children: [
              subItem('2024 Tournament Of Champions', () {
                // Handle click event
              }),
              subItem('2024 National Final', () {
                // Handle click event
              }),
            ],
          ),
          drawerItem(
            text: 'Nightly Events',
            icon: Icons.nightlife,
            children: [
              subItem('Melbourne Metro', () {
                // Handle click event
              }),
              subItem('Ballarat Region', () {
                // Handle click event
              }),
              subItem('Geelong Region', () {
                // Handle click event
              }),
            ],
          ),
          drawerItem(
            text: 'Sponsors',
            icon: Icons.business,
            onTap: () {
              PlayerScreens.NAVIGATEBACK(context);
              PlayerScreens.SPONSORS(context);
            },
          ),
          drawerItem(
            text: 'About us',
            icon: Icons.info,
            children: [
              subItem('Our partners', () {
                // Handle click event
                PlayerScreens.NAVIGATEBACK(context);
                PlayerScreens.PARTNERS(context);
              }),
              subItem('Rules', () {
                // Handle click event
                PlayerScreens.NAVIGATEBACK(context);
                PlayerScreens.RULES(context);
              }),
            ],
          ),
          drawerItem(
            text: 'Contact',
            icon: Icons.contacts,
            children: [
              subItem('Venues', () {
                PlayerScreens.NAVIGATEBACK(context);
                PlayerScreens.CONTACTVENUES(context);
              }),
              subItem('Players', () {
                // Handle click event
                PlayerScreens.NAVIGATEBACK(context);
                PlayerScreens.CONTACTPLAYERS(context);
              }),
            ],
          ),
          drawerItem(
            text: 'Ambassadors',
            icon: Icons.group,
            onTap: () {
              // Handle click event
              // Handle click event
              PlayerScreens.NAVIGATEBACK(context);
              PlayerScreens.AMBASSADOR(context);
            },
          ),
          drawerItem(
            text: 'Who we are',
            icon: Icons.account_circle,
            onTap: () {
              // Handle click event
              // Handle click event
              PlayerScreens.NAVIGATEBACK(context);
              PlayerScreens.WHOWEARE(context);
            },
          ),
          drawerItem(
            text: 'My Profile',
            icon: Icons.person,
            onTap: () {
              // Handle click event
              // Handle click event
              PlayerScreens.NAVIGATEBACK(context);
              PlayerScreens.PROFILE(context);
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
