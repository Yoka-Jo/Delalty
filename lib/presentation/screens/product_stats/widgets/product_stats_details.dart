part of 'widgets.dart';

class ProductStatsDetails extends StatelessWidget {
  const ProductStatsDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          AppStrings.theDetails,
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 18.sp,
        ),
        SizedBox(height: 30.h),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProductStatsDetailsColumn(
              title: AppStrings.views,
              icon: ImageAssets.eye,
              number: 1000,
            ),
            ProductStatsDetailsColumn(
              title: AppStrings.favorite,
              icon: ImageAssets.favorite,
              number: 50,
            ),
            ProductStatsDetailsColumn(
              title: AppStrings.chat,
              icon: ImageAssets.chat,
              number: 100,
            ),
          ],
        )
      ],
    );
  }
}
