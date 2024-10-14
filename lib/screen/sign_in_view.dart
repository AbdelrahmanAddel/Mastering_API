import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/cubit/user_cubit.dart';
import 'package:test_work/widget/custom_matrial_buttom.dart';
import 'package:test_work/widget/custom_text_form_filed.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
       if (state is SignInSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(state.successMessage) ));
         
       } else if(state is FailerToSignIn){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(state.errorMessage) ));        
       }
      },
      builder: (context, state) {
         final cubit=BlocProvider.of<UserCubit>(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormFiled(labelText: 'email',controller: cubit.signInEmail,),
                CustomTextFormFiled(labelText: 'passowrd',controller: cubit.signInPassword,),
              state is LoadingToSignIn?
              const CircularProgressIndicator():
                CustomMatrialButtom(
                  color: Colors.deepPurple,
                  child: const Text('Sign In'),onPressed: (){
                  cubit.signIn();
                  
                },)
              ],
            ),
          ),
        );
      },
    );
  }
}