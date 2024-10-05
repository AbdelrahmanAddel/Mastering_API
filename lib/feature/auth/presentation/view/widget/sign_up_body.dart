import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/feature/auth/presentation/view/widget/terms_and_contition.dart';

import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/widget/custom_text_form_field.dart';
import '../../../cubit/auth_cubit.dart';

import 'sign_up_authentication.dart';

class SignUpBody extends StatelessWidget {
  SignUpBody({super.key});
  
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormFieled(
            onChanged: (value) {
              cubit.firstName = value;
            },
            labelText: AppString.firstName,
          ),
          CustomTextFormFieled(
            onChanged: (value) {
              cubit.lastName = value;
            },
            labelText: AppString.lastName,
          ),
          CustomTextFormFieled(
            onChanged: (value) {
              cubit.email = value;
            },
            labelText: AppString.email,
          ),
          CustomTextFormFieled(
            bottom: 19,
            onChanged: (value) {
              cubit.password = value;
            },
            obscureText: true,
            labelText: AppString.password,
            suffixIcon: IconButton(
              onPressed: () {
                cubit.changeObsecureValue();
                print(cubit.obsecure);
              },
              icon: Icon(
                cubit.obsecure == true
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ),
          const TermsAndContition(),
          const SizedBox(height: 88),
          SignUpAuthentication(formKey: formKey,)
    
        ],
      ),
    );
  }
}

