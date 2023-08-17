part of 'widgets.dart';

class HomeTrendingCategories extends StatelessWidget {
  const HomeTrendingCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          AppStrings.trendingProducts,
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
            children: trendingCategories
                .map((category) => Container(
                      width: 172.w,
                      height: 160.h,
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                          image: NetworkImage(category.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SimpleText(
                                category.title,
                                textStyle: TextStyleEnum.poppinsMedium,
                                fontSize: 15.sp,
                                color: Colors.white,
                              ),
                              SimpleText(
                                AppStrings.findOut,
                                textStyle: TextStyleEnum.poppinsLight,
                                fontSize: 10.sp,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Container(
                            width: 25.w,
                            height: 25.w,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 12.5.h,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
                .toList())
      ],
    );
  }
}
