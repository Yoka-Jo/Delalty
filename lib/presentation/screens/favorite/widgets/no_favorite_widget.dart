part of 'widgets.dart';

class NoFavoriteWidget extends StatelessWidget {
  const NoFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.noFavorite,
            ),
            SizedBox(height: 13.h),
            SimpleText(
              AppStrings.youDontHaveAnyFavouriteAds,
              textStyle: TextStyleEnum.poppinsRegular,
              fontSize: 15.sp,
              color: AppColors.grey3,
            ),
            SizedBox(height: 22.h),
            SizedBox(
              height: 50.h,
              width: 205.w,
              child: MyElevatedButton(
                title: AppStrings.browsingNow,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
