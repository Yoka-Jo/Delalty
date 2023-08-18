part of 'widgets.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          AppStrings.searchResult,
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 17.sp,
        ),
        SizedBox(height: 27.h),
        GridView.count(
          shrinkWrap: true,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 11.h,
          childAspectRatio: 230.w / 170.h,
          crossAxisCount: 2,
          children: List.generate(5, (index) => const SearchProduct()),
        )
      ],
    );
  }
}
