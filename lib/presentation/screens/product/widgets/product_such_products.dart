part of 'widgets.dart';

class ProductSuchProducts extends StatelessWidget {
  const ProductSuchProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SimpleText(
              AppStrings.such,
              textStyle: TextStyleEnum.poppinsMedium,
              fontSize: 15.sp,
            ),
            SimpleText(
              AppStrings.watchMore,
              textStyle: TextStyleEnum.poppinsLight,
              fontSize: 14.sp,
              color: AppColors.grey3,
            ),
          ],
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: 200.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemBuilder: (context, index) {
              return ProductCardWidget(
                title: '"MERCEDSCLA 200 2022 Used"',
                details: Container(),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 15.w),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
