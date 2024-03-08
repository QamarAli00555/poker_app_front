// ignore_for_file: must_be_immutable

import '../../Customs/routes/imports.dart';

Widget customText(String text, Enum style,
    {Color? color = AppColors.PRIMARY_WHITE,
    bool isTitle = false,
    bool underline = false,
    int? maxLine = 3,
    bool? isBold,
    TextAlign align = TextAlign.center}) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      // double maxWidth = constraints.maxWidth;
      // double idealFontSize = maxWidth * 0.05;
      double? size;
      FontWeight? fontWeight;
      switch (style) {
        case AppStyles.DESCRIPTION:
          size = AppFontSizes.DESCRIPTION;
          fontWeight = AppFontWeight.DESCRIPTION;
          break;
        case AppStyles.HEADING:
          size = AppFontSizes.HEADING;
          fontWeight = AppFontWeight.HEADING;
          break;
        case AppStyles.LARGE:
          size = AppFontSizes.LARGE;
          fontWeight = AppFontWeight.LARGE;
          break;
        case AppStyles.MEDIUM:
          size = AppFontSizes.MEDIUM;
          fontWeight = AppFontWeight.MEDIUM;
          break;
        case AppStyles.SMALL:
          size = AppFontSizes.SMALL;
          fontWeight = AppFontWeight.SMALL;
          break;
        default:
          size = null;
          fontWeight = null;
      }
      return Text(
        text,
        style: TextStyle(
                fontSize: size,
                fontWeight: isBold != null ? FontWeight.bold : fontWeight,
                color: color,
                letterSpacing: isTitle ? 2 : null,
                decoration: underline ? TextDecoration.underline : null,
                decorationColor: Colors.white,
                shadows: isTitle
                    ? const [
                        BoxShadow(
                          color: AppColors.PRIMARY_GOLD,
                          blurRadius: 2,
                          offset: Offset(0, 2.5), // Offset for shadow
                        ),
                      ]
                    : null)
            .copyWith(
          fontSize: size,
        ),
        textAlign: align,
        maxLines: maxLine,
        overflow: maxLine != null ? TextOverflow.ellipsis : null,
      );
    },
  );
}
