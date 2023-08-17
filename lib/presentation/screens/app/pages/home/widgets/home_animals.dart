part of 'widgets.dart';

class HomeAnimals extends StatelessWidget {
  const HomeAnimals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SimpleText(
              AppStrings.animal,
              textStyle: TextStyleEnum.montserratMedium,
              fontSize: 16.sp,
            ),
            SimpleText(
              AppStrings.watchMore,
              textStyle: TextStyleEnum.poppinsLight,
              fontSize: 10.sp,
              color: AppColors.primaryColor,
            ),
          ],
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: 200.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemBuilder: (context, index) {
              return ProductCardWidget(
                title:
                    'Jermaine ShepherdDescendants of Hero Zov and Boys of Hero Nina and Rocky',
                details: Container(),
                image:
                    'https://m.media-amazon.com/images/I/61bK6PMOC3L.__AC_SX300_SY300_QL70_ML2_.jpg',
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 15.w),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
