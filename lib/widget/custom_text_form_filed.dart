import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({super.key,  this.labelText,  this.bottomPadding, this.topPadding, this.controller});
final String ? labelText;
final double ?bottomPadding;
final double ?topPadding;
final TextEditingController? controller;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only( bottom: bottomPadding ??10 ,top:topPadding ??10 ),
      child: TextFormField(
        controller:controller ,
        decoration: InputDecoration(
          labelText:labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5)
          )
        ),
      
      
      ),
    );
  }
}