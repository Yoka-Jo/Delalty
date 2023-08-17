part of 'widgets.dart';

class HomeRealEstate extends StatelessWidget {
  const HomeRealEstate({
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
              AppStrings.realEstate,
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
                title: 'Town House for sale in Sheikh Zayed',
                image:
                    'https://images.pexels.com/photos/681390/pexels-photo-681390.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                details: Row(
                  children: [
                    SimpleText(
                      '200',
                      textStyle: TextStyleEnum.poppinsMedium,
                      fontSize: 7.sp,
                      color: AppColors.grey3,
                    ),
                    SizedBox(width: 2.w),
                    SvgPicture.asset(
                      ImageAssets.area,
                      height: 12.h,
                      width: 12.w,
                    ),
                    SizedBox(width: 5.w),
                    SimpleText(
                      '3',
                      textStyle: TextStyleEnum.poppinsMedium,
                      fontSize: 7.sp,
                      color: AppColors.grey3,
                    ),
                    SizedBox(width: 2.w),
                    SvgPicture.asset(
                      ImageAssets.bathroom,
                      height: 12.h,
                      width: 12.w,
                    ),
                    SizedBox(width: 5.w),
                    SimpleText(
                      '4',
                      textStyle: TextStyleEnum.poppinsMedium,
                      fontSize: 7.sp,
                      color: AppColors.grey3,
                    ),
                    SizedBox(width: 2.w),
                    SvgPicture.asset(
                      ImageAssets.bed,
                      height: 12.h,
                      width: 12.w,
                    ),
                  ],
                ),
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
