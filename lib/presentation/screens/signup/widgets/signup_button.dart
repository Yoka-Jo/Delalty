part of 'widgets.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      title: AppStrings.signup,
      onTap: SignupCubit.get(context).signup,
      btnKey: SignupCubit.get(context).btnKey,
    );
  }
}
