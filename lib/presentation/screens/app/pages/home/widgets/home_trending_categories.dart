part of 'widgets.dart';

class HomeTrendingCategories extends StatelessWidget {
  const HomeTrendingCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          AppStrings.trendingProducts.tr(context: context),
          textStyle: TextStyleEnum.montserratMedium,
          fontSize: 16.sp,
        ),
        SizedBox(height: 18.h),
        SizedBox(
            height: 160.h,
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final cubit = HomeCubit.get(context);
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemBuilder: (context, index) {
                    final product = cubit.trendingProducts?[index];
                    return ProductCardWidget(
                      isLoading: cubit.trendingProducts == null,
                      product: product,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 15.w),
                  itemCount: cubit.trendingProducts?.length ?? 5,
                );
              },
            )),
      ],
    );
  }
}
