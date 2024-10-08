part of 'widgets.dart';

class VerificationCodeResendOtp extends StatelessWidget {
  const VerificationCodeResendOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleText(
      AppStrings.resendOtp.tr(context: context),
      textStyle: TextStyleEnum.montserratMedium,
      fontSize: 15.sp,
      color: AppColors.grey3,
    );
  }
}
