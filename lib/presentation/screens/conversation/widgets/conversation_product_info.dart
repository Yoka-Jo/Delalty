part of 'widgets.dart';

class ConversationProductInfo extends StatelessWidget {
  const ConversationProductInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(const ProductRoute());
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 75.w,
            height: 75.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: Image.network(
                'https://images.pexels.com/photos/2036544/pexels-photo-2036544.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 18.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpleText(
                  'MGEHS2022 1.5 A.T Luxury Black interior',
                  textStyle: TextStyleEnum.poppinsRegular,
                  fontSize: 13.sp,
                  color: AppColors.grey3,
                ),
                SimpleText(
                  'EGP 1,150,000',
                  textStyle: TextStyleEnum.poppinsRegular,
                  fontSize: 12.sp,
                  color: AppColors.grey3,
                ),
                Row(
                  children: [
                    Image.asset(
                      ImageAssets.locationPin,
                      color: AppColors.grey3,
                      height: 10.r,
                      width: 10.r,
                    ),
                    SizedBox(width: 5.w),
                    SimpleText(
                      'Egypt . Cairo ',
                      textStyle: TextStyleEnum.poppinsRegular,
                      fontSize: 10.sp,
                      color: AppColors.grey3,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 5.w),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.grey3,
            size: 20.r,
          )
        ],
      ),
    );
  }
}
