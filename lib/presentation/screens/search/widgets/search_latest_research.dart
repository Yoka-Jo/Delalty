part of 'widgets.dart';

class SearchLatestResearch extends StatelessWidget {
  const SearchLatestResearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = SearchCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText(
              AppStrings.latestResearch.tr(context: context),
              textStyle: TextStyleEnum.poppinsMedium,
              fontSize: 17.sp,
            ),
            SizedBox(height: 27.h),
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final product = cubit.recentlySearchedProducts[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 50.w,
                      height: 48.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: CachedImage(
                          url: product.mainImageId,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 18.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SimpleText(
                          product.title,
                          textStyle: TextStyleEnum.poppinsLight,
                          fontSize: 13.sp,
                          color: AppColors.grey3,
                        ),
                        SimpleText(
                          product.categoryId,
                          textStyle: TextStyleEnum.poppinsMedium,
                          fontSize: 8.sp,
                          color: AppColors.grey3,
                        ),
                      ],
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 19.h),
              itemCount: cubit.recentlySearchedProducts.length > 5
                  ? 5
                  : cubit.recentlySearchedProducts.length,
            ),
          ],
        );
      },
    );
  }
}
