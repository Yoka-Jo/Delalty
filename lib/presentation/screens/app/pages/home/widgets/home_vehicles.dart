part of 'widgets.dart';

class HomeVehicles extends StatelessWidget {
  const HomeVehicles({
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
              AppStrings.vehicles,
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
                title: 'MERCEDSCLA 200 2022 Used',
                details: Row(
                  children: [
                    SimpleText(
                      'Automatic',
                      textStyle: TextStyleEnum.poppinsMedium,
                      fontSize: 7.sp,
                      color: AppColors.grey3,
                    ),
                    SizedBox(width: 2.w),
                    Image.asset(
                      ImageAssets.automatic,
                      fit: BoxFit.scaleDown,
                    ),
                    SizedBox(width: 10.w),
                    SimpleText(
                      '1500 SS',
                      textStyle: TextStyleEnum.poppinsMedium,
                      fontSize: 7.sp,
                      color: AppColors.grey3,
                    ),
                    SizedBox(width: 2.w),
                    Image.asset(
                      ImageAssets.engine,
                      fit: BoxFit.scaleDown,
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
