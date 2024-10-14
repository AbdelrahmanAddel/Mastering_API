part of 'user_cubit.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

final class LoadingToGetImageFromUser extends UserState {}

final class GetImageFormUserSuccessfull extends UserState {}

final class FailerToGetImageFormUser extends UserState {
  final String erroMessage;

  FailerToGetImageFormUser({required this.erroMessage});
}

final class LoadingToSignUp extends UserState {}

final class SignUpSuccessful extends UserState {
  final String successMessage;

  SignUpSuccessful({required this.successMessage});
}

final class FailerToSignUp extends UserState {
  final String errorMessage;

  FailerToSignUp({required this.errorMessage});
}

final class LoadingToSignIn extends UserState {}

final class SignInSuccess extends UserState {
  final String successMessage;

  SignInSuccess({required this.successMessage});
}

final class FailerToSignIn extends UserState {
  final String errorMessage;

  FailerToSignIn({required this.errorMessage});
}

final class LoadingToGetUserData extends UserState {}

final class GetUserDataSuccess extends UserState {
  final UserDataModel model;

  GetUserDataSuccess({required this.model});
}

final class FailerToGetUserData extends UserState {
  final String errorMessage;

  FailerToGetUserData({required this.errorMessage});
}

final class LoadingToUpdataData extends UserState {}

final class UpdataDataSuccess extends UserState {
  final String successMessage;

  UpdataDataSuccess({required this.successMessage});
}

final class FailerToUpdataUserData extends UserState {
  final String errorMessage;

  FailerToUpdataUserData({required this.errorMessage});
}

final class LoadingDeleteUserAccount extends UserState {}

final class DeleteUserAccountSuccessful extends UserState {
  final String successMessage;

  DeleteUserAccountSuccessful({required this.successMessage});
}

final class FailerToDeleteUserAccount extends UserState {
  final String errorMessage;

  FailerToDeleteUserAccount({required this.errorMessage});

}
