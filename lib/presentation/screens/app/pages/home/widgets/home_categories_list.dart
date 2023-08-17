part of 'widgets.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 52.h,
                width: 56.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                ),
                child: SvgPicture.asset(
                  category.image,
                ),
              ),
              SimpleText(
                category.title,
                textStyle: TextStyleEnum.poppinsRegular,
                fontSize: 11.sp,
                color: Colors.white,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 25.w),
        itemCount: categories.length,
      ),
    );
  }
}
