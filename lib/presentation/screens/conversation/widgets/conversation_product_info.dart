part of 'widgets.dart';

class ConversationProductInfo extends StatelessWidget {
  const ConversationProductInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = ConversationCubit.get(context).chat.product;
    return InkWell(
      onTap: () {
        context.router.push(ProductRoute(productId: product!.id));
      },
      child: Row(
        children: [
          SizedBox(
            width: 75.w,
            height: 75.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: CachedImage(
                url: product?.mainImageId ?? '',
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
                  product?.title ?? '',
                  textStyle: TextStyleEnum.poppinsRegular,
                  fontSize: 13.sp,
                  color: AppColors.grey3,
                ),
                SimpleText(
                  'EGP ${product?.price}',
                  textStyle: TextStyleEnum.poppinsRegular,
                  fontSize: 12.sp,
                  color: AppColors.grey3,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
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
