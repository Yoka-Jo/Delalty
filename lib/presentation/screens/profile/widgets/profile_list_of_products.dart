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
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 11.h,
                childAspectRatio: 230.w / 170.h,
              ),
              itemBuilder: (context, index) => const ProfileProduct(),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
