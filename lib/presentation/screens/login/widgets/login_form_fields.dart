// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({
    Key? key,
    this.email,
    this.password,
  }) : super(key: key);
  final String? email;
  final String? password;

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
              initialValue: email,
              textInputAction: TextInputAction.next,
              onChangedFunction: cubit.onEmailChanged,
              prefixIcon: const MailIcon(),
              hintTxt: AppStrings.email.tr(),
              errorTxt: emailError,
            ),
            SizedBox(height: 28.h),
            DefaultTextFormField(
              inputType: TextInputType.text,
              initialValue: password,
              textInputAction: TextInputAction.done,
              prefixIcon: const LockIcon(),
              onChangedFunction: cubit.onPasswordChanged,
              hintTxt: AppStrings.password.tr(),
              errorTxt: passwordError,
            ),
          ],
        );
      },
    );
  }
}
