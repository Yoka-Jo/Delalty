part of 'widgets.dart';

class SignupTitle extends StatelessWidget {
  const SignupTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SimpleText(
          AppStrings.appName,
          textStyle: TextStyleEnum.montserratExtraBold,
          fontSize: 30.sp,
          color: Colors.white,
        ),
        SizedBox(height: 12.h),
        SimpleText(
          AppStrings.signup,
          textStyle: TextStyleEnum.montserratExtraBold,
          fontSize: 25.sp,
          color: Colors.white,
        ),
        SizedBox(height: 12.h),
        SimpleText(
          AppStrings.createAccountNow,
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 18.sp,
          color: Colors.white,
        ),
      ],
    );
  }
}
