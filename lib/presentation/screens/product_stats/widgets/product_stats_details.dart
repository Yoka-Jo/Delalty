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
          AppStrings.theDetails.tr(context: context),
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 18.sp,
        ),
        SizedBox(height: 30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ProductStatsDetailsColumn(
              title: AppStrings.views.tr(context: context),
              icon: ImageAssets.eye,
              number: 1000,
            ),
            ProductStatsDetailsColumn(
              title: AppStrings.favorite.tr(context: context),
              icon: ImageAssets.favorite,
              number: 50,
            ),
            ProductStatsDetailsColumn(
              title: AppStrings.chat.tr(context: context),
              icon: ImageAssets.chat,
              number: 100,
            ),
          ],
        )
      ],
    );
  }
}
