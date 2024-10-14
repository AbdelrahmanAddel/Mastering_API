import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_work/cubit/user_cubit.dart';
import 'package:test_work/widget/custom_matrial_buttom.dart';
import 'package:test_work/widget/custom_text_form_filed.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<UserCubit>(context);
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is GetImageFormUserSuccessfull) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Upload Image Success')));
        } else if (state is FailerToGetImageFormUser) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.erroMessage)));
        } else if (state is SignUpSuccessful) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.successMessage)));
        } else if (state is FailerToSignUp) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up !',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                state is LoadingToGetImageFromUser
                    ? const CircularProgressIndicator()
                    : GestureDetector(
                        onTap: () async {
                          await ImagePicker()
                              .pickImage(source: ImageSource.gallery)
                              .then((image) {
                            if (image != null) {
                              cubit.getImage(image);
                            }
                          });
                        },
                        child: cubit.image == null
                            ? const CircleAvatar(
                                radius: 45,
                                child: Icon(Icons.person),
                              )
                            : CircleAvatar(
                                radius: 45,
                                backgroundImage: FileImage(File(cubit.image!.path)),
                              ),
                      ),
                CustomTextFormFiled(
                  labelText: 'name',
                  controller: cubit.signUpName,
                ),
                CustomTextFormFiled(
                  labelText: 'email',
                  controller: cubit.signUpEmail,
                ),
                CustomTextFormFiled(
                  labelText: 'phone',
                  controller: cubit.signUpPhone,
                ),
                CustomTextFormFiled(
                  labelText: 'password',
                  controller: cubit.signUpPassword,
                ),
                CustomTextFormFiled(
                  labelText: 'confirmPassowrd',
                  controller: cubit.signUpConfirmPassowrd,
                ),
                state is LoadingToSignUp
                    ? const CircularProgressIndicator()
                    : CustomMatrialButtom(
                        color: Colors.deepPurple,
                        child: const Text('Sign Up'),
                        onPressed: () {
                          cubit.signUp();
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
