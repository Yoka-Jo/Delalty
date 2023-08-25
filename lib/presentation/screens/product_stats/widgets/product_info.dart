part of 'widgets.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: CashedImageWidget(
              image:
                  'https://images.pexels.com/photos/2036544/pexels-photo-2036544.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              borderRadius: 5.r,
              height: 175.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 290.w,
                    child: SimpleText(
                      'MGEHS2022 1.5 A.T Luxury Black interior',
                      textStyle: TextStyleEnum.poppinsMedium,
                      fontSize: 15.sp,
                    ),
                  ),
                  SimpleText(
                    'Vehicles',
                    textStyle: TextStyleEnum.poppinsMedium,
                    fontSize: 15.sp,
                    color: AppColors.grey3,
                  ),
                  SimpleText(
                    'EGP 1,150,000',
                    textStyle: TextStyleEnum.poppinsMedium,
                    fontSize: 15.sp,
                    color: AppColors.grey3,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.r),
                  color: AppColors.primaryColor,
                ),
                child: SimpleText(
                  'Active',
                  textStyle: TextStyleEnum.poppinsMedium,
                  fontSize: 10.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 7.h),
        ],
      ),
    );
  }
}
