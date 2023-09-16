part of 'widgets.dart';

class SignupAlreadyHaveAccount extends StatelessWidget {
  const SignupAlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.replace(LoginRoute());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SimpleText(
            AppStrings.alreadyHaveAccount.tr(context: context),
            textStyle: TextStyleEnum.poppinsMedium,
            fontSize: 16.sp,
          ),
          SimpleText(
            " ${AppStrings.signin.tr(context: context)}",
            textStyle: TextStyleEnum.poppinsMedium,
            fontSize: 16.sp,
            color: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
