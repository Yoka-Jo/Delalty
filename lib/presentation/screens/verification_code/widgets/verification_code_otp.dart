part of 'widgets.dart';

class VerificationCodeOtp extends StatelessWidget {
  const VerificationCodeOtp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = VerificationCodeCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PinCodeTextField(
          cursorColor: AppColors.primaryColor,
          appContext: context,
          length: 4,
          textStyle: getRegularStyle(
            color: Colors.black,
            family: FontFamilies.montserrat,
            fontSize: 25.sp,
          ),
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            activeBorderWidth: 1,
            shape: PinCodeFieldShape.circle,
            fieldHeight: 60.w,
            fieldWidth: 60.w,
            errorBorderColor: Colors.red,
            activeFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            selectedFillColor: Colors.white,
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.grey,
            selectedColor: AppColors.primaryColor,
          ),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          errorAnimationController: cubit.errorAnimationController,
          onCompleted: (code) => cubit.onVerify(code),
          beforeTextPaste: (text) {
            return true;
          },
        ),
        SizedBox(height: 38.h),
        BlocBuilder<VerificationCodeCubit, VerificationCodeState>(
          builder: (context, state) {
            return buildTime(context);
          },
        ),
      ],
    );
  }

  Widget buildTime(BuildContext context) {
    final cubit = VerificationCodeCubit.get(context);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final duration = cubit.otpDuration;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    final stringMinutes = twoDigits(minutes);
    final stringSeconds = twoDigits(seconds);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SimpleText(
          AppStrings.expiresAfter,
          textStyle: TextStyleEnum.montserratMedium,
          fontSize: 15.sp,
        ),
        SimpleText(
          " : $stringMinutes.$stringSeconds",
          color: AppColors.primaryColor,
          textStyle: TextStyleEnum.montserratMedium,
          fontSize: 15.sp,
        ),
      ],
    );
  }
}
