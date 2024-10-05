import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/widget/custom_buttom.dart';
import '../../../cubit/auth_cubit.dart';
import 'custom_flutter_toast.dart';
import 'cutom_text_span.dart';

class SignUpAuthentication extends StatelessWidget {
  const SignUpAuthentication({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CreateAccountSuccsseful) {
          flutterToast(
            toastString: 'Create Account Successful',
            color: Colors.green,
          );
        } else if (state is FailedToCreateAccount) {
          flutterToast(
            toastString: state.errorMessage,
            color: Colors.red,
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            state is LoadingToCreateAccount
                ? const CupertinoActivityIndicator()
                : CustomButtom(
                    color: cubit.agreeToTermsAndContition == false
                        ? AppColor.grey
                        : AppColor.primaryColor,
                    text: AppString.signUp,
                    onPressed: cubit.agreeToTermsAndContition == true
                        ? () {
                            if (formKey.currentState!.validate()) {
                              cubit.createUserWithEmailAndPassword();
                            }
                          }
                        : () {},
                  ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {},
              child: CustomTextSpan(
                firstText: AppString.alreadyhaveanaccount,
                secondText: AppString.LoginNow,
              ),
            ),
          ],
        );
      },
    );
  }
}
