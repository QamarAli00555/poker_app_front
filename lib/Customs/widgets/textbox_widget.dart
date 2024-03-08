import '../routes/imports.dart';

Widget customTextBox(final String hintText, final TextInputType keyboardType,
    final TextEditingController controller,
    {Widget? prefix,
    Widget? suffix,
    bool isPass = false,
    int lines = 1,
    bool isProfile = false}) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        width: AppWidgetsSize.TEXTFIELD,
        alignment: Alignment.center,
        margin: EdgeInsetsDirectional.symmetric(vertical: 10.h),
        height: lines == 1 ? 50.h : 300.h,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textAlignVertical: TextAlignVertical.bottom,
          style: TextStyle(
              fontSize: AppFontSizes.PLACEHOLDER,
              color: isProfile ? AppColors.PRIMARY_WHITE : null),
          obscureText: isPass,
          maxLines: lines,
          decoration: InputDecoration(
            suffix: suffix,
            prefix: prefix,
            hintText: hintText,
            filled: true,
            fillColor: isProfile ? const Color(0xFF062337) : Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: isProfile
                    ? AppColors.PRIMARY_GOLD //const Color(0xFFCA9703)
                    : AppColors.PRIMARY_WHITE, // Border color
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isProfile
                    ? AppColors.PRIMARY_GOLD
                    : AppColors.PRIMARY_WHITE, // Border color
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isProfile
                    ? const Color(0xFFCA9703)
                    : Colors.grey, // Border color
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isProfile
                    ? const Color(0xFFCA9703)
                    : Colors.white, // Border color when focused
              ),
            ),
          ),
        ),
      );
    },
  );
}
