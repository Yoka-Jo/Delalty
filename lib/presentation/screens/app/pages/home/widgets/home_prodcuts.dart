part of 'widgets.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final categories = HomeCubit.get(context).categories;
        if (HomeCubit.get(context).categories == null) {
          return const CenteredCircularProgressIndicaotr();
        }
        return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            itemCount: 10,
            separatorBuilder: (context, i) => SizedBox(height: 40.h),
            itemBuilder: (context, i) {
              final category = categories![i];
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
                        final product = HomeCubit.get(context)
                            .productsMap[category.id]?[index];
                        print("_________skflksdnflkdsnlkfsnfls");
                        print(HomeCubit.get(context).productsMap[category.id]);
                        return ProductCardWidget(
                          isLoading: true,
                          title: product?.title ?? '',
                          image: product?.mainImageId ?? '',
                          price: product?.price ?? 0.0,
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
                      itemCount:
                          (HomeCubit.get(context).productsMap[category.id] ==
                                      null ||
                                  (HomeCubit.get(context)
                                              .productsMap[category.id]
                                              ?.length ??
                                          10) >
                                      5)
                              ? 5
                              : HomeCubit.get(context)
                                  .productsMap[category.id]!
                                  .length,
                    ),
                  ),
                ],
              );
            });
      },
    );
  }
}
