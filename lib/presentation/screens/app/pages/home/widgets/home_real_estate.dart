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
            InkWell(
              onTap: () {
                context.router.push(
                  ViewProductSectionRoute(
                    isRealEstate: true,
                    title: AppStrings.realEstate,
                  ),
                );
              },
              child: SimpleText(
                AppStrings.watchMore,
                textStyle: TextStyleEnum.poppinsLight,
                fontSize: 10.sp,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: Constants.homeProductsHeight,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemBuilder: (context, index) {
              return const ProductCardWidget(
                  title: 'Town House for sale in Sheikh Zayed',
                  image:
                      'https://images.pexels.com/photos/681390/pexels-photo-681390.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  details: RealEstateFeatures(
                    area: 220,
                    bedsNumber: 4,
                    bathroomsNumber: 3,
                  ));
            },
            separatorBuilder: (context, index) => SizedBox(width: 15.w),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
