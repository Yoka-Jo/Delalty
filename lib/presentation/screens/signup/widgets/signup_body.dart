part of 'widgets.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.error != null) {
          SimpleToast.showSimpleToast(
              msg: state.error!, state: ToastStates.error);
        }
        if (state.isSuccess) {
          context.router.replace(LoginRoute(
              email: state.email.value, password: state.password.value));
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 30.h),
              const SignupTitle(),
              SizedBox(height: 28.h),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 37.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: AppColors.grey2,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.r),
                      topLeft: Radius.circular(30.r),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SignupFormFields(),
                      SizedBox(height: 37.h),
                      const SignupButton(),
                      SizedBox(height: 24.h),
                      const SignupAlreadyHaveAccount(),
                      const OrDividerWidget(),
                      const LoginSocailMedia(),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
