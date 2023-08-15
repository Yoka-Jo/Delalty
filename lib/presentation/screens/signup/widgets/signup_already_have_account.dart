part of 'widgets.dart';

class SignupAlreadyHaveAccount extends StatelessWidget {
  const SignupAlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SimpleText(
          AppStrings.alreadyHaveAccount,
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 16.sp,
        ),
        SimpleText(
          " ${AppStrings.signin}",
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 16.sp,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}
