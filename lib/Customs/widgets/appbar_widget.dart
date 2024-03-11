import 'package:flutter/material.dart';

import '../../Utils/enums.dart';
import '../colors/custom_colors.dart';
import '../image/paths.dart';
import 'text_widget.dart';

AppBar renderAppbar(
    {Function()? leading, Function()? trailing, bool? tabBar, bool? revT}) {
  return AppBar(
    title: customText('POKERNATION', AppStyles.HEADING,
        color: AppColors.PRIMARY_WHITE, isTitle: true),
    automaticallyImplyLeading: false,
    centerTitle: true,
    leading: revT == null
        ? Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: leading,
              child: Image.asset(
                ImagePath.MENU_IMG,
                fit: BoxFit.cover,
              ),
            ),
          )
        : InkWell(
            onTap: leading,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                ImagePath.BACK_IMG,
                fit: BoxFit.cover,
              ),
            ),
          ),
    actions: trailing != null
        ? [
            InkWell(
                onTap: trailing,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: revT == null
                      ? Image.asset(
                          ImagePath.LOGOUT_IMG,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          ImagePath.MENU_IMG,
                          fit: BoxFit.cover,
                        ),
                ))
          ]
        : null,
    bottom: tabBar != null
        ? const TabBar(
            labelColor: Colors.white, // Text color of the active tab
            unselectedLabelColor: Colors.grey, // Text color of inactive tabs
            tabs: [
              Tab(
                text: 'Nightly Events',
              ),
              Tab(text: 'Featured Events'),
            ],
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: AppColors.PRIMARY_GOLD,
                    width: 3.0), // Line color and width
              ),
            ),
            labelStyle: TextStyle(fontSize: 20.0),
          )
        : null,
  );
}
