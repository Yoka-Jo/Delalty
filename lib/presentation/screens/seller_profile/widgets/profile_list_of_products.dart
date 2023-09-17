part of 'widgets.dart';

class ProfileListOfProducts extends StatelessWidget {
  const ProfileListOfProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerProfileCubit, SellerProfileState>(
      builder: (context, state) {
        final cubit = SellerProfileCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleText(
                AppStrings.listOfProducts.tr(context: context),
                textStyle: TextStyleEnum.poppinsMedium,
                fontSize: 14.sp,
              ),
              GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 11.h,
                  childAspectRatio: 173.w / 160.h,
                ),
                itemBuilder: (context, index) {
                  final product = cubit.products?[index];
                  return ProductCardWidget(
                    isLoading: cubit.products == null,
                    product: product,
                    height: 160.h,
                    width: 173.w,
                    titleSize: 7.sp,
                    titleColor: AppColors.black,
                    priceSize: 8.sp,
                    locationColor: AppColors.grey3,
                    showLocationPin: false,
                    showfavouriteButton: false,
                    padding: EdgeInsets.all(7.r),
                  );
                },
                itemCount: cubit.products == null ? 6 : cubit.products!.length,
              ),
            ],
          ),
        );
      },
    );
  }
}
