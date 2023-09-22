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
          AppStrings.bestCategories.tr(context: context),
          textStyle: TextStyleEnum.montserratMedium,
          fontSize: 16.sp,
        ),
        SizedBox(height: 18.h),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = HomeCubit.get(context);
            final bestCategories = cubit.bestCategories;

            return GridView.builder(
              shrinkWrap: true,
              itemCount: bestCategories == null ? 4 : 8,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 16.w,
              ),
              itemBuilder: (context, i) {
                if (bestCategories == null) {
                  return BuildShimmerWidget(
                    height: 100.h,
                  );
                }
                final category = bestCategories[i];
                return InkWell(
                  onTap: () {
                    context.router.push(
                      ViewProductSectionRoute(
                        category: category,
                        isRealEstate: false,
                      ),
                    );
                  },
                  child: CategoryWidget(
                    image: category.image,
                    title: category.name,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
