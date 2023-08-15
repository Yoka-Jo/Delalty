part of 'widgets.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                      const LoginFormFields(),
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
