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
              context.tr(AppStrings.such),
              textStyle: TextStyleEnum.poppinsMedium,
              fontSize: 15.sp,
            ),
            SimpleText(
              context.tr(AppStrings.watchMore),
              textStyle: TextStyleEnum.poppinsLight,
              fontSize: 14.sp,
              color: AppColors.grey3,
            ),
          ],
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: Constants.homeProductsHeight,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemBuilder: (context, index) {
              return const ProductCardWidget(
                isLoading: true,
                product: null,
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
