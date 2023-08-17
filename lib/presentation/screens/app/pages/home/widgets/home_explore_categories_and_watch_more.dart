part of 'widgets.dart';

class HomeExploreCategoriesAndWatchMore extends StatelessWidget {
  const HomeExploreCategoriesAndWatchMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SimpleText(
          AppStrings.exploreCategories,
          textStyle: TextStyleEnum.montserratMedium,
          fontSize: 16.sp,
          color: Colors.white,
        ),
        SimpleText(
          AppStrings.watchMore,
          textStyle: TextStyleEnum.montserratRegular,
          fontSize: 14.sp,
          color: Colors.white,
        ),
      ],
    );
  }
}
