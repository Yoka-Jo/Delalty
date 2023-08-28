// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key? key,
    this.email,
    this.password,
  }) : super(key: key);
  final String? email;
  final String? password;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.error != null) {
          SimpleToast.showSimpleToast(
              msg: state.error!, state: ToastStates.error);
        }
        if (state.isSuccess) {
          context.router.replace(const AppRoute());
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 30.h),
              const LoginTitle(),
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
                      LoginFormFields(email: email, password: password),
                      SizedBox(height: 29.h),
                      const LoginForgotPassword(),
                      SizedBox(height: 29.h),
                      const LoginButton(),
                      SizedBox(height: 24.h),
                      const OrDividerWidget(),
                      const LoginSocailMedia(),
                      const LoginCreateAccount(),
                      SizedBox(height: 120.h),
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
