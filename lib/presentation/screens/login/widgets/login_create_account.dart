part of 'widgets.dart';

class LoginCreateAccount extends StatelessWidget {
  const LoginCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.replace(const SignupRoute());
      },
      child: SimpleText(
        AppStrings.createAnAccount.tr(context: context),
        textStyle: TextStyleEnum.poppinsMedium,
        fontSize: 18.sp,
        color: AppColors.primaryColor,
      ),
    );
  }
}
