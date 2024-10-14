import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_work/core/api/dio_consumer.dart';
import 'package:test_work/core/repositry/user_repositry.dart';
import 'package:test_work/model/user_data_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    required this.userRepositry,
    required this.dio,
  }) : super(UserInitial());

  final UserRepositry userRepositry;
  final DioConsumer dio;

  //! Sign In Controllers
  final signInEmail = TextEditingController();
  final signInPassword = TextEditingController();

  //! Sign Up Controllers
  final signUpEmail = TextEditingController();
  final signUpName = TextEditingController();
  final signUpPhone = TextEditingController();
  final signUpPassword = TextEditingController();
  final signUpConfirmPassowrd = TextEditingController();

  //! Update User Controller
  final updataNam = TextEditingController();
  final updataPhone = TextEditingController();
  final updataLocation = TextEditingController();

  XFile? image;

  //* Get Image
  getImage(userImage) {
    try {
      emit(LoadingToGetImageFromUser());
      image = userImage;
      emit(GetImageFormUserSuccessfull());
    } on Exception catch (e) {
      emit(FailerToGetImageFormUser(erroMessage: e.toString()));
    }
  }

  //* Sign Up
  signUp() async {
    emit(LoadingToSignUp());

    final responce = await userRepositry.signUp(
      name: signUpName.text,
      email: signUpEmail.text,
      password: signUpPassword.text,
      confirmPassowrd: signUpConfirmPassowrd.text,
      phone: signUpPhone.text,
      image: image!,
    );

    responce.fold(
      (error) => emit(FailerToSignUp(errorMessage: error)),
      (model) => emit(SignUpSuccessful(successMessage: model.message)),
    );
  }

  //* Sign In
  signIn() async {
    emit(LoadingToSignIn());

    final responce = await userRepositry.signIn(
      email: signInEmail.text,
      password: signInPassword.text,
    );

    responce.fold(
      (error) => emit(FailerToSignIn(errorMessage: error)),
      (success) => emit(SignInSuccess(successMessage: success.message)),
    );
  }

  //* Get User Data
  getUserData() async {
    emit(LoadingToGetUserData());

    final responce = await userRepositry.getUserData();

    responce.fold(
      (error) => emit(FailerToGetUserData(errorMessage: error)),
      (success) => emit(GetUserDataSuccess(model: success)),
    );
  }

  //* Update User Profile Data
  updataUserProfileData() async {
    emit(LoadingToUpdataData());

    final responce = await userRepositry.updataUserData(
      name: updataNam.text,
      phone: updataPhone.text,
      location: updataLocation.text,
    );

    responce.fold(
      (error) => emit(FailerToUpdataUserData(errorMessage: error)),
      (success) => emit(UpdataDataSuccess(successMessage: success)),
    );
  }
}
