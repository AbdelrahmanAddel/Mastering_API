import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool obsecure=true;
  bool agreeToTermsAndContition=false;
  String ?firstName;
  String ?lastName;
  String ?email;
  String ?password;

void termsAndConditionChange(){
  agreeToTermsAndContition=!agreeToTermsAndContition;
  emit(AgreeToTermsAndContition());

}

void changeObsecureValue(){
    obsecure=!obsecure;
    emit(ChangeObsecureValueSuccess());

  }

void createUserWithEmailAndPassword()async{
  try {
    emit(LoadingToCreateAccount());
   await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email!,
    password: password!,
  );
  sendVerifyEmail();
  emit(CreateAccountSuccsseful());
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    emit(FailedToCreateAccount(errorMessage: 'The password provided is too weak.'));

  } else if (e.code == '') {
    emit(FailedToCreateAccount(errorMessage: 'email-already-in-use'));

  }
  else{
    emit(FailedToCreateAccount(errorMessage: e.code.toString()));
    print(e.code.toString());

  }

} catch (e) {
  print(e);
    emit(FailedToCreateAccount(errorMessage: e.toString()));
}

}

Future<void>  sendVerifyEmail()async{
  await FirebaseAuth.instance.currentUser!.sendEmailVerification();
}

signInWithEmailAndPassword()async{
  try {
    emit(LoadingToSignIn());
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email!,
    password: password!
  );
  emit(SignInSuccess());
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    emit(FailedToSignIn(errorMessage:'No user found for that email.'));

  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
    emit(FailedToSignIn(errorMessage:'Wrong password provided for that user.'));
  }
  else{
    emit(FailedToSignIn(errorMessage: e.code.toString()));
  }
  
}

}
}
