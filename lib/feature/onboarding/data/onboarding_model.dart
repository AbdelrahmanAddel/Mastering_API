import 'package:test_work/core/utils/app_assest.dart';
import 'package:test_work/core/utils/app_string.dart';

class OnboardingModel {
  String image;
  String title;
  String subtitile;
  OnboardingModel(
    {required this.image,
    required this.subtitile,
    required this.title});
}
List <OnboardingModel>OnboardingData=[
  OnboardingModel(
    image: Assets.assetsImageOnboarding1, 
    subtitile: AppString.onboardingOneSubtitle, title: AppString.onboardingOneTitle),
  OnboardingModel(image: Assets.assetsImageOnboarding2, subtitile: AppString.onboardingTwoSubtitle, title: AppString.onboardingTwoTitle),
  OnboardingModel(image: Assets.assetsImageOnboarding3, subtitile: AppString.onboardingThreeSubtitle, title: AppString.onboardingThreeTitle),


];