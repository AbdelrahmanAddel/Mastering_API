import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/cubit/user_cubit.dart';
import 'package:test_work/widget/custom_matrial_buttom.dart';
import 'package:test_work/widget/custom_text_form_filed.dart';

class UpdataUserData extends StatelessWidget {
  const UpdataUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UpdataDataSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.successMessage)));
          
        } else if(state is FailerToUpdataUserData){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          
        }
      },
      builder: (context, state) {
    final cubit = BlocProvider.of<UserCubit>(context);

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormFiled(
                  labelText: 'name',
                  controller: cubit.updataNam,
                ),
                CustomTextFormFiled(labelText: 'Phone',controller: cubit.updataPhone,),
                CustomTextFormFiled(labelText: 'location',controller: cubit.updataLocation,),
               state is LoadingToUpdataData?
               const CircularProgressIndicator():
                CustomMatrialButtom(  color: Colors.deepPurple,onPressed: () {
                  cubit.updataUserProfileData();
                },  child:  Text('Updata'),)
              ],
            ),
          ),
        );
      },
    );
  }
}
