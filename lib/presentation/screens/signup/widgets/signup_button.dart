part of 'widgets.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      title: AppStrings.signup,
      onTap: () {
        context.router.push(const VerificationCodeRoute());
      },
      btnKey: SignupCubit.get(context).btnKey,
    );
  }
}
