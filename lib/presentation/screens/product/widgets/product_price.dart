part of 'widgets.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SimpleText(
          'EGP ',
          textStyle: TextStyleEnum.poppinsBold,
          fontSize: 15.sp,
          color: AppColors.primaryColor,
        ),
        SimpleText(
          '1,150,000',
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 15.sp,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}
