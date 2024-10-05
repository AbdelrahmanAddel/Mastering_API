

import 'package:flutter/material.dart';
import 'package:test_work/core/utils/app_assest.dart';
import 'package:test_work/core/utils/app_color.dart';
import 'package:test_work/core/utils/app_font_style.dart';
import 'package:test_work/core/utils/app_string.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SignInAppContainerView extends StatelessWidget {
  const SignInAppContainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              width: 375,
              height: 290,
              decoration: const BoxDecoration(
                color: AppColor.primaryColor
              ),
              child:   Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(AppString.AppName,style: AppFontStyle.saira70032,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      
                      SvgPicture.asset(Assets.assetsImageVectorOne),

                      SvgPicture.asset(Assets.assetsImageVectorTwo),


                    ],
                  )
                ],
              ),
            );
  }
}