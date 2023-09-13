part of 'widgets.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: 20.h,
          right: 16.w,
          left: 16.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            topLeft: Radius.circular(30.r),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              const HomeBestCategories(),
              SizedBox(height: 40.h),
              const HomeTrendingCategories(),
              SizedBox(height: 40.h),
              const HomeProducts(),
              SizedBox(height: 40.h),
              // const HomeVehicles(),
              // SizedBox(height: 40.h),
              // const HomeMobiles(),
              // SizedBox(height: 40.h),
              // const HomeRealEstate(),
              // SizedBox(height: 40.h),
              // const HomeAnimals(),
              // SizedBox(height: 45.h),
            ],
          ),
        ),
      ),
    );
  }
}
