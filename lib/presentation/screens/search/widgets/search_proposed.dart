part of 'widgets.dart';

class SearchProposed extends StatelessWidget {
  const SearchProposed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          AppStrings.proposed.tr(),
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 17.sp,
        ),
        SizedBox(height: 27.h),
        SizedBox(
          height: 108.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemBuilder: (context, index) {
              final category = bestCategories[index];
              return CategoryWidget(
                image: category.image,
                title: category.title,
                height: 108.h,
                width: 120.w,
                iconHeight: 24.h,
                iconWidth: 24.h,
                iconSize: 10.r,
                subTitleSize: 8.sp,
                titleSize: 12.sp,
                titleStyle: TextStyleEnum.poppinsLight,
                subTitleStyle: TextStyleEnum.poppinsLight,
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 5.w),
            itemCount: bestCategories.length,
          ),
        ),
      ],
    );
  }
}
