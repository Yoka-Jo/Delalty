part of 'widgets.dart';

class ProductDescripe extends StatelessWidget {
  const ProductDescripe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isArabic = RegExp(
            r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]')
        .hasMatch(ProductCubit.get(context).product.description);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          AppStrings.describe.tr(context: context),
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 15.sp,
        ),
        SizedBox(height: 18.h),
        SimpleText(
          ProductCubit.get(context).product.description,
          textStyle: TextStyleEnum.poppinsRegular,
          fontSize: 12.sp,
          textAlign: isArabic ? TextAlign.right : TextAlign.left,
          color: AppColors.grey3,
        ),
      ],
    );
  }
}
