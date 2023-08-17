part of 'widgets.dart';

class ProductLocation extends StatelessWidget {
  const ProductLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          ImageAssets.locationPin,
        ),
        SimpleText(
          "${AppStrings.location}: ",
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
