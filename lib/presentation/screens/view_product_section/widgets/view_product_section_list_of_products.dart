part of 'widgets.dart';

class ViewProductSectionListOfProucts extends StatelessWidget {
  const ViewProductSectionListOfProucts({
    super.key,
    required this.isRealEstate,
  });

  final bool isRealEstate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 30.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isRealEstate ? 1 : 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 11.h,

          childAspectRatio: isRealEstate ? 1.7 : 0.92,
          // isRealEstate ? (361.w / 203.h) : (173.w / 160.h), //361.w / 203.h,
        ),
        itemBuilder: (context, index) => ProductCardWidget(
          isLoading: true,
          product: null,
          width: double.infinity,
          height: 173.h,
          titleSize: isRealEstate ? 12.sp : 7.sp,
          titleColor: isRealEstate ? AppColors.grey3 : AppColors.black,
          priceSize: isRealEstate ? 12.sp : 8.sp,
          locationColor:
              isRealEstate ? AppColors.primaryColor : AppColors.grey3,
          showLocationPin: isRealEstate,
          padding: isRealEstate
              ? EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h)
              : EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
          details: isRealEstate
              ? const RealEstateFeatures(
                  area: 220,
                  bedsNumber: 4,
                  bathroomsNumber: 3,
                )
              : const SizedBox.shrink(),
        ),
        itemCount: 20,
      ),
    );
  }
}
