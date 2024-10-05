import 'package:flutter/material.dart';

import 'package:test_work/core/utils/app_font_style.dart';
import 'package:test_work/core/utils/app_string.dart';

import 'widget/sign_up_body.dart';



//TODO Nav To Sign in on Splach Screen
class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 152,
              ),
            ),
            const SliverToBoxAdapter(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppString.welcome,
                    style: AppFontStyle.Poppins60028,
                  )),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 48,
              ),
            ),
            SliverToBoxAdapter(
              child: SignUpBody(),
            )
          ],
        ),
      ),
    );
  }
}


