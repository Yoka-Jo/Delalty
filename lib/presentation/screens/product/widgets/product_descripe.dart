part of 'widgets.dart';

class ProductDescripe extends StatelessWidget {
  const ProductDescripe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          textAlign: TextAlign.center,
          color: AppColors.grey3,
        ),
      ],
    );
  }
}
