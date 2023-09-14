part of 'widgets.dart';

class HomeBestCategories extends StatelessWidget {
  const HomeBestCategories({
    super.key,
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
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final bestCategories = HomeCubit.get(context).bestCategories;
            return GridView.count(
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 12.h,
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: HomeCubit.get(context).bestCategories != null
                  ? bestCategories!
                      .map(
                        (category) => InkWell(
                          onTap: () {
                            context.router.push(
                              ViewProductSectionRoute(
                                title: category.name,
                                isRealEstate:
                                    category.name == AppStrings.realEstate,
                              ),
                            );
                          },
                          child: CategoryWidget(
                            image: category.image,
                            title: category.name,
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
            );
          },
        ),
      ],
    );
  }
}
