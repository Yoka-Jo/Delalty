part of 'widgets.dart';

class ProfileUserDateOfAccession extends StatelessWidget {
  const ProfileUserDateOfAccession({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          ImageAssets.calendar,
          color: AppColors.primaryColor,
        ),
        SizedBox(width: 5.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText(
              AppStrings.dateOfAccession,
              textStyle: TextStyleEnum.poppinsMedium,
              fontSize: 15.sp,
              color: AppColors.grey3,
            ),
            SimpleText(
              'January / 2023',
              textStyle: TextStyleEnum.poppinsMedium,
              fontSize: 13.sp,
            ),
          ],
        ),
      ],
    );
  }
}
