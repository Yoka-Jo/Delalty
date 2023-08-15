part of 'widgets.dart';

class VerificationCodeOtpSentToPhone extends StatelessWidget {
  const VerificationCodeOtpSentToPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 240.w,
          child: SimpleText(
            "${AppStrings.enterOtpSentToPhoneNumber} 012345666655",
            textStyle: TextStyleEnum.montserratRegular,
            fontSize: 15.sp,
            color: AppColors.grey3,
            textAlign: TextAlign.center,
          ),
        ),
        Image.asset(ImageAssets.pen)
      ],
    );
  }
}
