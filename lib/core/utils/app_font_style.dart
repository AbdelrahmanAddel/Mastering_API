import 'package:flutter/material.dart';
import 'package:test_work/core/utils/app_color.dart';

abstract class AppFontStyle {
  static final Pacifico40064=TextStyle(
    fontFamily: 'Pacifico',
    fontSize: 64,
    fontWeight: FontWeight.w400,
    color: AppColor.deepBrowm
  ) ;
  static const poppins40016=TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 16
  );
    static const poppins50024=TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 24
  );
      static const poppins30016=TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontSize: 16
  );
}