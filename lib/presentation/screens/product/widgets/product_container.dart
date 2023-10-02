part of 'widgets.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isMe = ProductCubit.get(context).product.seller!.id ==
        AppCubit.get(context).user.id;
    return Container(
      padding: EdgeInsets.only(top: 320.h),
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 37.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.containerLightColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            topLeft: Radius.circular(30.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ProductTitle(),
            SizedBox(height: 12.h),
            const ProductPrice(),
            SizedBox(height: 12.h),
            const ProductModelWidget(),
            SizedBox(height: 12.h),
            const ProductLocation(),
            if (!isMe) ...[
              SizedBox(height: 12.h),
              const ProductContactOptions(),
            ],
            SizedBox(height: 40.h),
            const ProductSpecification(),
            SizedBox(height: 40.h),
            const ProductDescripe(),
            if (!isMe) ...[
              SizedBox(height: 28.h),
              const ProductReport(),
            ],
            SizedBox(height: 50.h),
            const ProductSellerInfo(),
            SizedBox(height: 40.h),
            const ProductSellerComments(),
            SizedBox(height: 40.h),
            const ProductSuchProducts()
          ],
        ),
      ),
    );
  }
}
