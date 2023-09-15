import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class OnBoardingModel {
  final String title;
  final String body;
  final String image;
  const OnBoardingModel({
    required this.title,
    required this.body,
    required this.image,
  });
}

List<OnBoardingModel> models = [
  const OnBoardingModel(
    title: AppStrings.onboardingTitle_1,
    body: AppStrings.onboardingBody_1,
    image: ImageAssets.onboarding_1,
  ),
  const OnBoardingModel(
    title: AppStrings.onboardingTitle_2,
    body: AppStrings.onboardingBody_2,
    image: ImageAssets.onboarding_2,
  ),
  const OnBoardingModel(
    title: AppStrings.onboardingTitle_3,
    body: AppStrings.onboardingBody_3,
    image: ImageAssets.onboarding_3,
  ),
];
