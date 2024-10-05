import 'package:flutter/material.dart';
import 'package:test_work/core/utils/app_color.dart';

abstract class AppFontStyle {
  static const Pacifico40064=TextStyle(
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
  static const Poppins60028=TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 28,
    color: AppColor.darkCharcoal
  );
    static const poppins40012=TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColor.deegGrey
  );
      static const saira70032=TextStyle(
    fontFamily: 'Saira',
    fontWeight: FontWeight.w700,
    fontSize: 32,
    color: Colors.white
  );
}