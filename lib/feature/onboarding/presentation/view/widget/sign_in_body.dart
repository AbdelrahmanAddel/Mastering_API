import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/core/utils/app_color.dart';
import 'package:test_work/core/utils/app_string.dart';
import 'package:test_work/core/utils/widget/custom_buttom.dart';
import 'package:test_work/core/utils/widget/custom_text_form_field.dart';
import 'package:test_work/feature/auth/cubit/auth_cubit.dart';
import 'package:test_work/feature/auth/presentation/view/widget/custom_flutter_toast.dart';

class SignInBody extends StatelessWidget {
   SignInBody({super.key});
final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit=BlocProvider.of<AuthCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
if (state is SignInSuccess) {
  flutterToast(toastString: 'Sign In Success', color: Colors.green);
  
} else if(state is FailedToSignIn) {
  flutterToast(toastString: e.toString(), color: Colors.red);

  
}        },
        builder: (context, state) {
          return Form(
            key:formKey ,
            child: Column(
              children: [
                CustomTextFormFieled(labelText: AppString.email,onChanged: (email) {
                  cubit.email=email;
                },),
                CustomTextFormFieled(
                  onChanged: (password) {
                    cubit.password=password;
                  },
                  
                  labelText: AppString.password,
                  obscureText: true,
                  suffixIcon: IconButton(onPressed: (){
                    cubit.changeObsecureValue();
                  }, icon: Icon(cubit.obsecure ?Icons.visibility_off: Icons.visibility),
                   ),
                ),
                SizedBox(
                  height: 132,
                ),
                state is LoadingToSignIn ?
                CupertinoActivityIndicator():
                CustomButtom(
                  text: AppString.signIn,
                  color: AppColor.primaryColor,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.signInWithEmailAndPassword();
                      
                    }
                  
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
