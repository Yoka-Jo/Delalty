part of 'widgets.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      title: AppStrings.signup,
      onTap: () {},
      btnKey: SignupCubit.get(context).btnKey,
    );
  }
}
