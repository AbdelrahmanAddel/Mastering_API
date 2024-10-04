import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_work/core/utils/app_color.dart';
class PageIndecator extends StatelessWidget {
  const PageIndecator({super.key, required this.controller});
final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(    
   controller: controller,    
   count:  3,    
   axisDirection: Axis.horizontal,    
   effect:   SlideEffect(    
      spacing:  8.0,    
      radius:  10.0,    
      dotWidth:  19.0,    
      dotHeight:  4,    
      paintStyle:  PaintingStyle.stroke,    
      strokeWidth:  1.5,    
      dotColor: AppColor.primaryColor,    
      activeDotColor:   AppColor.deepBrowm    
  ), 
);
  }
}