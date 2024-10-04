import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/feature/onboarding/cubit/boarding_cubit.dart';
import 'package:test_work/feature/onboarding/data/onboarding_model.dart';
import 'page_view_item.dart';

class OnboardingBody extends StatelessWidget {
  OnboardingBody({super.key});
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BoardingCubit>(context);
    return SizedBox(
      height: 800,
      child: PageView.builder(
        controller: controller,
        onPageChanged: (value) {
          cubit.changeCurrentIndex(value);
        },
        itemCount: OnboardingData.length,
        itemBuilder: (context, index) {
          return PageViewItem(
            controller: controller,
            cubit: cubit,
            index: index,
          );
        },
      ),
    );
  }
}
