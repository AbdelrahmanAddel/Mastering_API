import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/feature/auth/cubit/auth_cubit.dart';
import '../app_color.dart';

class CustomTextFormFieled extends StatelessWidget {
   CustomTextFormFieled({super.key, required this.labelText,  this.suffixIcon,  this.obscureText, this.onChanged, this.bottom  });
  
  final String labelText;
  final Widget ? suffixIcon;
  final bool ? obscureText ;
  final Function(String)? onChanged;
   final double ? bottom;

  @override
  Widget build(BuildContext context) {
    final cubit=BlocProvider.of<AuthCubit>(context);
    return Padding(
      padding:  EdgeInsets.only(bottom: bottom??25, left: 8, right: 8),
      child: Container(
        height: 63,
        
        child: TextFormField(
          validator: (value) {
        if (value == null || value.isEmpty) {
           return 'please enter text'; 
}   
else 
return null;         
          },
         onChanged: onChanged,
          obscureText: obscureText!=null?cubit.obsecure:false,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            labelText: labelText,labelStyle:TextStyle(color: AppColor.deegGrey),
            fillColor: Colors.white,
            focusedBorder: outlineInputBorder(),
            enabledBorder: outlineInputBorder()
          ),
        ),
      ),
    );
  }
}
OutlineInputBorder outlineInputBorder(){
  return OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(
                color: AppColor.deegGrey,
              ),
            );
}
