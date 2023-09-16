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
          AppStrings.exploreCategories.tr(context: context),
          textStyle: TextStyleEnum.montserratMedium,
          fontSize: 16.sp,
          color: Colors.white,
        ),
        SimpleText(
          AppStrings.watchMore.tr(context: context),
          textStyle: TextStyleEnum.montserratRegular,
          fontSize: 14.sp,
          color: Colors.white,
        ),
      ],
    );
  }
}
