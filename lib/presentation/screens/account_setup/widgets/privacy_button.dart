part of 'widgets.dart';

class PrivacyButton extends StatelessWidget {
  const PrivacyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildButton(
      title: AppStrings.privacy,
      subTitle: AppStrings.dataPrivacy,
      icon: ImageAssets.securityUser,
      onTap: () {
        context.router.push(const UserPrivacyRoute());
      },
    );
  }
}
