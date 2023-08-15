part of 'widgets.dart';

class LoginForgotPassword extends StatelessWidget {
  const LoginForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SimpleText(
        AppStrings.forgotPassword,
        textStyle: TextStyleEnum.montserratRegular,
        fontSize: 15.sp,
        color: AppColors.primaryColor,
      ),
    );
  }
}
