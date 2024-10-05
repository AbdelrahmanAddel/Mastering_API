import 'package:flutter/material.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_font_style.dart';

class CustomTextSpan extends StatelessWidget {
 const CustomTextSpan({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: AppFontStyle.poppins40012.copyWith(color: AppColor.deegGrey),
          ),
          TextSpan(
            text: secondText,
            style: AppFontStyle.poppins40012.copyWith(color: AppColor.grey),
          ),
        ],
      ),
    );
  }
}
