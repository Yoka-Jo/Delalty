part of 'widgets.dart';

class HomeBestCategories extends StatelessWidget {
  final bool isLoading;
  const HomeBestCategories({
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          AppStrings.bestCategories,
          textStyle: TextStyleEnum.montserratMedium,
          fontSize: 16.sp,
        ),
        SizedBox(height: 18.h),
        GridView.count(
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 12.h,
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: !isLoading
              ? bestCategories
                  .map(
                    (category) => InkWell(
                      onTap: () {
                        context.router.push(
                          ViewProductSectionRoute(
                            title: category.title,
                            isRealEstate:
                                category.title == AppStrings.realEstate,
                          ),
                        );
                      },
                      child: CategoryWidget(
                        image: category.image,
                        title: category.title,
                      ),
                    ),
                  )
                  .toList()
              : List.generate(
                  4,
                  (index) => BuildShimmerWidget(
                    height: 100.h,
                  ),
                ),
        ),
      ],
    );
  }
}
