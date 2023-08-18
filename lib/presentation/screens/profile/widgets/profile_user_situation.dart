part of 'widgets.dart';

class ProfileUserSituation extends StatelessWidget {
  const ProfileUserSituation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          AppStrings.situation,
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 15.sp,
          color: AppColors.grey3,
        ),
        SizedBox(height: 4.h),
        SimpleText(
          "New",
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 15.sp,
        ),
      ],
    );
  }
}
