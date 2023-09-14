part of 'widgets.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        final categories = cubit.categories;
        if (cubit.categories == null) {
          return const CenteredCircularProgressIndicaotr();
        }
        final itemCount = cubit.isGettingCategoriesProducts
            ? (cubit.numberOfCategoriesToRetrieve * cubit.page) + 1
            : (cubit.numberOfCategoriesToRetrieve * cubit.page);
        return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            itemCount: itemCount,
            separatorBuilder: (context, i) => SizedBox(height: 40.h),
            itemBuilder: (context, i) {
              final category = categories![i];
              if (cubit.isGettingCategoriesProducts && i == itemCount - 1)
                return CenteredCircularProgressIndicaotr();
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SimpleText(
                        category.name,
                        textStyle: TextStyleEnum.montserratMedium,
                        fontSize: 16.sp,
                      ),
                      InkWell(
                        onTap: () {
                          context.router.push(
                              ViewProductSectionRoute(title: category.name));
                        },
                        child: SimpleText(
                          AppStrings.watchMore,
                          textStyle: TextStyleEnum.poppinsLight,
                          fontSize: 10.sp,
                          color: AppColors.primaryColor,
                        ),
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
                        final product = cubit.productsMap[category.id]?[index];
                        return ProductCardWidget(
                          isLoading: cubit.productsMap[category.id] == null,
                          title: product?.title ?? '',
                          image: product?.mainImageId ?? '',
                          price: /*product?.price ??*/ 0.0,
                          product: product,
                          details: Row(
                            children: [
                              SimpleText(
                                'Automatic',
                                textStyle: TextStyleEnum.poppinsMedium,
                                fontSize: 7.sp,
                                color: AppColors.grey3,
                              ),
                              SizedBox(width: 2.w),
                              Image.asset(
                                ImageAssets.automatic,
                                width: 15.r,
                                height: 15.r,
                              ),
                              SizedBox(width: 10.w),
                              SimpleText(
                                '1500 SS',
                                textStyle: TextStyleEnum.poppinsMedium,
                                fontSize: 7.sp,
                                color: AppColors.grey3,
                              ),
                              SizedBox(width: 2.w),
                              Image.asset(
                                ImageAssets.engine,
                                width: 15.r,
                                height: 15.r,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 15.w),
                      itemCount: (cubit.productsMap[category.id] == null ||
                              (cubit.productsMap[category.id]?.length ?? 10) >
                                  5)
                          ? 5
                          : cubit.productsMap[category.id]!.length,
                    ),
                  ),
                ],
              );
            });
      },
    );
  }
}
