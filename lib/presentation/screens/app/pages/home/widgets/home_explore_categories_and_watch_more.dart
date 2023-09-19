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
        InkWell(
          onTap: () {
            if (HomeCubit.get(context).categories != null) {
              context.router.push(
                CategoriesRoute(categories: HomeCubit.get(context).categories!),
              );
            }
          },
          child: SimpleText(
            AppStrings.watchMore.tr(context: context),
            textStyle: TextStyleEnum.montserratRegular,
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
