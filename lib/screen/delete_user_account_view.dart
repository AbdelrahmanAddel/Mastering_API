import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/cubit/user_cubit.dart';
import 'package:test_work/widget/custom_matrial_buttom.dart';

class DeleteUserAccount extends StatelessWidget {
  const DeleteUserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
if(state is DeleteUserAccountSuccessful){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.successMessage)));
}
else if(state is FailerToDeleteUserAccount){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));

}


      },
      builder: (context, state) {
        final cubit=BlocProvider.of<UserCubit>(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state is LoadingDeleteUserAccount?
                Text('Delete ......'):
                CustomMatrialButtom(
                  child: Text('Delete !'),
                  color: Color.fromARGB(255, 213, 14, 0),
                  onPressed: () {
                    cubit.deleteUserAccount();                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
