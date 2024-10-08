part of 'widgets.dart';

class LoginForgotPassword extends StatelessWidget {
  const LoginForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse('https://delalty.com/forgot-password'));
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: SimpleText(
          AppStrings.forgotPassword.tr(context: context),
          textStyle: TextStyleEnum.montserratRegular,
          fontSize: 15.sp,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
