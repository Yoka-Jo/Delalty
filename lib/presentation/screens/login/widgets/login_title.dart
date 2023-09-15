part of 'widgets.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: double.infinity),
        SimpleText(
          AppStrings.appName.tr(),
          textStyle: TextStyleEnum.montserratExtraBold,
          fontSize: 30.sp,
          color: Colors.white,
        ),
        SizedBox(height: 12.h),
        SimpleText(
          AppStrings.login.tr(),
          textStyle: TextStyleEnum.montserratExtraBold,
          fontSize: 25.sp,
          color: Colors.white,
        ),
        SizedBox(height: 12.h),
        SimpleText(
          AppStrings.startBuyingAndSellingThings.tr(),
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 18.sp,
          color: Colors.white,
        ),
      ],
    );
  }
}
