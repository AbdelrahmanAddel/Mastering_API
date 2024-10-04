import 'package:flutter/material.dart';
import 'widget/onboarding_body.dart';
import 'widget/onboaring_app_bar.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(height: 84),
            ),
            const SliverToBoxAdapter(
              child: OnboaringAppBar(),
            ),
            SliverToBoxAdapter(
              child: OnboardingBody(),
            ),
          ],
        ),
      ),
    );
  }
}
