part of 'widgets.dart';

class ProductLocation extends StatelessWidget {
  const ProductLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          ImageAssets.locationPin,
          height: 15.r,
          width: 15.r,
        ),
        SizedBox(width: 2.w),
        SimpleText(
          "${AppStrings.location.tr(context: context)}: ",
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 15.sp,
        ),
        SimpleText(
          "Egypt . Cairo",
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 15.sp,
          color: AppColors.grey3,
        ),
      ],
    );
  }
}
