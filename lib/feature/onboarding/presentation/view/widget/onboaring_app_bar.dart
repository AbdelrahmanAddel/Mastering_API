import 'package:flutter/material.dart';
import 'package:test_work/core/utils/app_font_style.dart';
import 'package:test_work/core/utils/app_string.dart';
import '../../../../../core/database/cache_helper.dart';

class OnboaringAppBar extends StatelessWidget {
  const OnboaringAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          CacheHelper.setValue(key: 'visited', value: true);
        },
        child: Text(
          AppString.skip,
          style: AppFontStyle.poppins40016.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
