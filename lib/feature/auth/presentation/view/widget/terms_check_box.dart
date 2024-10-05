import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../cubit/auth_cubit.dart';

class TermsCheckBox extends StatelessWidget {
  TermsCheckBox({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Checkbox(
          checkColor: Colors.white,
          activeColor: AppColor.deepBrowm,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          value: cubit.agreeToTermsAndContition,
          onChanged: (value) {
            cubit.termsAndConditionChange();
          },
        );
      },
    );
  }
}
