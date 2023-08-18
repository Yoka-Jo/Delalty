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
        GridView.count(
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 12.h,
          crossAxisCount: 2,
          shrinkWrap: true, // Add this line
          physics: const NeverScrollableScrollPhysics(), // Add this line
          children: bestCategories
              .map(
                (category) => CategoryWidget(
                  image: category.image,
                  title: category.title,
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
