part of 'widgets.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildButton(
      title: AppStrings.editProfile,
      subTitle: AppStrings.amendPersonalInformation,
      icon: ImageAssets.profile,
      onTap: () {
        context.router.push(const EditProfileRoute());
      },
    );
  }
}
