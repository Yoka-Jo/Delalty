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
          return InkWell(
            onTap: () {
              context.router.push(
                ViewProductSectionRoute(
                  title: category.title,
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 52.h,
                  width: 56.h,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.white,
                  ),
                  child: Image.asset(
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
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 25.w),
        itemCount: categories.length,
      ),
    );
  }
}
