part of 'widgets.dart';

class ProfileUserPhoneNumber extends StatelessWidget {
  const ProfileUserPhoneNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          ImageAssets.call,
          color: AppColors.primaryColor,
        ),
        SizedBox(width: 5.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText(
              AppStrings.phoneNumber,
              textStyle: TextStyleEnum.poppinsMedium,
              fontSize: 15.sp,
              color: AppColors.grey3,
            ),
            SimpleText(
              '012345666655',
              textStyle: TextStyleEnum.poppinsMedium,
              fontSize: 13.sp,
            ),
          ],
        ),
      ],
    );
  }
}
