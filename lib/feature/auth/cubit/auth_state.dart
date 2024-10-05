part of 'auth_cubit.dart';


sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ChangeObsecureValueSuccess extends AuthState {}

final class AgreeToTermsAndContition extends AuthState {}

final class LoadingToCreateAccount extends AuthState {}

final class CreateAccountSuccsseful extends AuthState {}

final class FailedToCreateAccount extends AuthState {
  final String errorMessage;
 
 FailedToCreateAccount({required this.errorMessage});}

final class LoadingToSignIn extends AuthState {}

final class SignInSuccess extends AuthState {}

final class FailedToSignIn extends AuthState {
  final String errorMessage;

  FailedToSignIn({required this.errorMessage});

}



