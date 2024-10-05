import 'package:flutter/material.dart';
import 'package:test_work/core/utils/app_font_style.dart';
import 'package:test_work/core/utils/app_string.dart';


import '../../../onboarding/presentation/view/widget/sign_in_body.dart';
import '../../../onboarding/presentation/view/widget/sign_in_container_view.dart';


class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return  Scaffold(
      body:  CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SignInAppContainerView()
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 32,),
          ),
          const SliverToBoxAdapter(
            child: Text(AppString.welcomeBack,style: AppFontStyle.Poppins60028,textAlign: TextAlign.center,),
          ),
            const SliverToBoxAdapter(
            child: SizedBox(height: 48,),
          ),
          SliverToBoxAdapter(
            child: SignInBody(),
          )
        ],
      ),
    );
  }
}
