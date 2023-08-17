part of 'widgets.dart';

class ProductSellerInfo extends StatelessWidget {
  const ProductSellerInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          AppStrings.moreInformation,
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 15.sp,
        ),
        SizedBox(height: 18.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductSellerImage(),
            SizedBox(width: 23.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpleText(
                  'Ahmed Mustafa',
                  textStyle: TextStyleEnum.poppinsMedium,
                  fontSize: 15.sp,
                ),
                SizedBox(height: 8.h),
                const ProductSellerRating(),
                SizedBox(height: 12.h),
                const ProductSellerChatButton(),
              ],
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.grey3,
              ),
            )
          ],
        )
      ],
    );
  }
}
