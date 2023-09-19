part of 'widgets.dart';

class HomeCategoriesList extends StatelessWidget {
  final bool isLoading;
  const HomeCategoriesList({
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (HomeCubit.get(context).categories == null) {
          return SizedBox(
            height: 85.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(
                  5,
                  (i) => Padding(
                    padding: EdgeInsets.only(right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BuildShimmerWidget(
                          height: 52.h,
                          width: 56.w,
                          hasMargin: false,
                        ),
                        SizedBox(height: 5.h),
                        BuildShimmerWidget(
                          height: 10.h,
                          width: 50.w,
                          hasMargin: false,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
        final categories = HomeCubit.get(context).categories;
        return SizedBox(
          height: 74.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = categories![index];
              return InkWell(
                onTap: () {
                  context.router.push(
                    ViewProductSectionRoute(
                      category: category,
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 52.h,
                      width: 56.w,
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white,
                      ),
                      child: CachedImage(
                        url: category.image,
                      ),
                    ),
                    SimpleText(
                      category.name,
                      textStyle: TextStyleEnum.poppinsRegular,
                      fontSize: 11.sp,
                      color: Colors.white,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 25.w),
            itemCount: 5,
          ),
        );
      },
    );
  }
}
