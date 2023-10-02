part of 'widgets.dart';

class ProductSellerInfo extends StatelessWidget {
  const ProductSellerInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final seller = ProductCubit.get(context).product.seller;
    final isMe = seller?.id == AppCubit.get(context).user.id;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          AppStrings.moreInformation.tr(context: context),
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 15.sp,
        ),
        SizedBox(height: 18.h),
        Row(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            ProductSellerImage(
              image: seller?.user?.image ?? '',
            ),
            SizedBox(width: 23.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpleText(
                  seller?.user?.name ?? "user",
                  textStyle: TextStyleEnum.poppinsMedium,
                  fontSize: 15.sp,
                ),
                SizedBox(height: 8.h),
                const ProductSellerRating(),
                if (!isMe) ...[
                  SizedBox(height: 12.h),
                  const ProductSellerChatButton(),
                ],
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                context.router
                    .push(SellerProfileRoute(sellerId: seller!.user!.id));
              },
              child: const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.grey3,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
