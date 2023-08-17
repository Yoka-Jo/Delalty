part of 'widgets.dart';

class ProductReport extends StatelessWidget {
  const ProductReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImageAssets.report),
        SizedBox(width: 5.w),
        SimpleText(
          AppStrings.reportToTheSeller,
          textStyle: TextStyleEnum.poppinsSemiBold,
          fontSize: 9.sp,
          color: AppColors.red,
        ),
      ],
    );
  }
}
