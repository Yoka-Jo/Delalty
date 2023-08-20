part of 'widgets.dart';

class ProfileListOfProducts extends StatelessWidget {
  const ProfileListOfProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          SimpleText(
            AppStrings.listOfProducts,
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
            itemBuilder: (context, index) => ProductCardWidget(
              days: null,
              height: 160.h,
              width: 173.w,
              title: 'BMD WDL 320i 2024',
              titleSize: 7.sp,
              titleColor: AppColors.black,
              priceSize: 8.sp,
              locationColor: AppColors.grey3,
              image:
                  'https://images.unsplash.com/photo-1542362567-b07e54358753?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
              showLocationPin: false,
              showfavouriteButton: false,
              padding: EdgeInsets.all(7.r),
            ),
            itemCount: 20,
          ),
        ],
      ),
    );
  }
}
