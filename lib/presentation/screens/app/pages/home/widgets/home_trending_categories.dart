part of 'widgets.dart';

class HomeTrendingCategories extends StatelessWidget {
  final bool isLoading;
  const HomeTrendingCategories({
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          AppStrings.trendingProducts,
          textStyle: TextStyleEnum.montserratMedium,
          fontSize: 16.sp,
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: 160.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemBuilder: (context, index) {
              if (isLoading) {
                return BuildShimmerWidget(
                  width: 172.w,
                  height: 160.h,
                );
              }
              final category = trendingCategories[index];
              return InkWell(
                onTap: () {
                  context.router.push(
                    ViewProductSectionRoute(
                      title: category.title,
                      isRealEstate: category.title == AppStrings.realEstate,
                    ),
                  );
                },
                child: CategoryWidget(
                  image: category.image,
                  title: category.title,
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 20.w),
            itemCount: trendingCategories.length,
          ),
        ),
      ],
    );
  }
}
