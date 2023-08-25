part of 'widgets.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeExploreCategoriesAndWatchMore(),
        SizedBox(height: 25.h),
        const HomeCategoriesList(isLoading: false),
      ],
    );
  }
}
