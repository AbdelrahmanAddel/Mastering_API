import 'package:flutter/material.dart';

class CustomMatrialButtom extends StatelessWidget {
  const CustomMatrialButtom({super.key,  this.color, this.onPressed, required this.child});
final Color?color;
final Function()? onPressed;
final Widget child;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      
      textColor: Colors.white,
      minWidth: double.infinity,
      color: color,
      onPressed: onPressed,
      child:child
      );
  }
}