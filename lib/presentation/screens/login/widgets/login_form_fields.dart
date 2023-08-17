part of 'widgets.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = LoginCubit.get(context);
        final emailError = cubit.emailError;
        final passwordError = cubit.passwordError;

        return Column(
          children: [
            DefaultTextFormField(
              inputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChangedFunction: cubit.onEmailChanged,
              prefixIcon: SvgPicture.asset(
                ImageAssets.mail,
                fit: BoxFit.scaleDown,
              ),
              hintTxt: AppStrings.email,
              errorTxt: emailError,
            ),
            SizedBox(height: 28.h),
            DefaultTextFormField(
              inputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              prefixIcon: SvgPicture.asset(
                ImageAssets.lock,
                fit: BoxFit.scaleDown,
              ),
              onChangedFunction: cubit.onPasswordChanged,
              hintTxt: AppStrings.password,
              errorTxt: passwordError,
            ),
          ],
        );
      },
    );
  }
}
