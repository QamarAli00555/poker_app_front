import 'package:flutter/material.dart';

import '../colors/custom_colors.dart';

Divider goldDivider() {
  return const Divider(
    color: AppColors.PRIMARY_GOLD,
  );
}

Divider horDivider() {
  return const Divider(
    height: 0,
    color: AppColors.PRIMARY_BLACK,
  );
}

VerticalDivider vertDivider() {
  return const VerticalDivider(
    width: 0,
    color: AppColors.PRIMARY_BLACK,
  );
}
