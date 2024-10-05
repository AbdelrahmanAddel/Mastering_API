import 'package:flutter/material.dart';
import 'package:test_work/core/utils/app_color.dart';
import 'package:test_work/core/utils/app_font_style.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key, required this.text,  this.onPressed,  this.color});
 final VoidCallback? onPressed;
 final Color ?color;
final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          backgroundColor:color??AppColor.primaryColor
        ),
        onPressed: onPressed, child: Text(text,style: AppFontStyle.poppins50024.copyWith(color: Colors.white,fontSize: 18),),
      
      
      ),
    );
  }
}