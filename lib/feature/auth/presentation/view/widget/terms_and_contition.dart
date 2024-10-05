import 'package:flutter/material.dart';
import 'package:test_work/feature/auth/presentation/view/widget/terms_check_box.dart';
import '../../../../../core/utils/app_font_style.dart';
import '../../../../../core/utils/app_string.dart';

class TermsAndContition extends StatelessWidget {
  const TermsAndContition({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         TermsCheckBox(),
        Text.rich(
          TextSpan(
            children: [
             const TextSpan(
                text: AppString.iHaveAgreeToOur,
                style: AppFontStyle.poppins40012,
              ),
              TextSpan(
                text: AppString.iHaveAgreeToOur,
                style: AppFontStyle.poppins40012
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
