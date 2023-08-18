part of 'widgets.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25.h),
        SimpleText(
          'Ahmed Mustafa',
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 18.sp,
        ),
        SizedBox(height: 8.h),
        const UserRating(rating: 5),
        SizedBox(height: 10.h),
        SimpleText(
          'Member since 2020',
          textStyle: TextStyleEnum.poppinsRegular,
          fontSize: 13.sp,
          color: AppColors.grey3,
        ),
        SizedBox(height: 40.h),
        MyElevatedButton(
          title: AppStrings.chat,
          icon: ImageAssets.message,
          onPressed: () {},
        )
      ],
    );
  }
}
