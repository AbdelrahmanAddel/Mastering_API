import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/database/cache_helper.dart';
import '../../../../../core/function/go_router_navigation.dart/custom_navigation.dart';
import '../../../../../core/utils/app_font_style.dart';
import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/widget/custom_buttom.dart';
import '../../../cubit/boarding_cubit.dart';
import '../../../data/onboarding_model.dart';
import 'smooth_page_indicator.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.controller,
    required this.cubit,
    required this.index,
  });

  final PageController controller;
  final BoardingCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 343,
          height: 290,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(OnboardingData[index].image),
            ),
          ),
        ),
        const SizedBox(height: 24),
        PageIndecator(controller: controller),
        const SizedBox(height: 32),
        Text(
          OnboardingData[index].title,
          style: AppFontStyle.poppins50024,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          OnboardingData[index].subtitile,
          style: AppFontStyle.poppins30016,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 88),
        BlocBuilder<BoardingCubit, BoardingState>(
          builder: (context, state) {
            if (cubit.currentIndex != 2) {
              return CustomButtom(
                text: AppString.next,
                onPressed: () {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.linear,
                  );
                },
              );
            } else {
              return Column(
                children: [
                  CustomButtom(
                    text: AppString.createAccount,
                    onPressed: () {
                      CacheHelper.setValue(key: 'visited', value: true);
                      customPushAndReplacementNavigator(
                        context: context,
                        path: '/SignUp',
                      );
                      controller.nextPage(
                        duration: const Duration(seconds: 2),
                        curve: Curves.linear,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      CacheHelper.setValue(key: 'visited', value: true);
                    },
                    child: Text(
                      AppString.LoginNow,
                      style: AppFontStyle.poppins40016.copyWith(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
