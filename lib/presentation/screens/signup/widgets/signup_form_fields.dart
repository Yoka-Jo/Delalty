part of 'widgets.dart';

class SignupFormFields extends StatelessWidget {
  const SignupFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        final cubit = SignupCubit.get(context);
        final nameError = cubit.usernameError;
        final emailError = cubit.emailError;
        final phoneError = cubit.phoneError;
        final passwordError = cubit.passwordError;

        return Column(
          children: [
            DefaultTextFormField(
              inputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              prefixIcon: Image.asset(
                ImageAssets.person,
                height: 16.h,
              ),
              onChangedFunction: cubit.onUsernameChanged,
              hintTxt: AppStrings.fullName,
              errorTxt: nameError,
            ),
            SizedBox(height: 28.h),
            DefaultTextFormField(
              inputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChangedFunction: cubit.onEmailChanged,
              prefixIcon: Image.asset(
                ImageAssets.mail,
                height: 16.h,
              ),
              hintTxt: AppStrings.email,
              errorTxt: emailError,
            ),
            SizedBox(height: 28.h),
            DefaultTextFormField(
              inputType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              prefixIcon: Image.asset(
                ImageAssets.phone,
                height: 16.h,
              ),
              onChangedFunction: cubit.onPhoneChanged,
              hintTxt: AppStrings.number,
              errorTxt: phoneError,
            ),
            SizedBox(height: 28.h),
            DefaultTextFormField(
              inputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              prefixIcon: Image.asset(
                ImageAssets.lock,
                height: 16.h,
              ),
              onChangedFunction: cubit.onPasswordChanged,
              hintTxt: AppStrings.password,
              errorTxt: passwordError,
              isPassword: state.isPasswordShown,
              suffixIcon: InkWell(
                onTap: cubit.togglePasswordShown,
                child: Icon(
                  state.isPasswordShown
                      ? Icons.visibility_outlined
                      : Icons.visibility_off,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
