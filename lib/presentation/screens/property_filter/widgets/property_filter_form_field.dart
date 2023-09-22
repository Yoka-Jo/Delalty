part of 'widgets.dart';

class PropertyFilterFormField extends StatelessWidget {
  const PropertyFilterFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          AppStrings.residentialArea,
          textStyle: TextStyleEnum.poppinsRegular,
          fontSize: 13.sp,
        ),
        SizedBox(height: 15.h),
        DefaultTextFormField(
          inputType: TextInputType.text,
          textInputAction: TextInputAction.go,
          hintTxt: AppStrings.search,
          enableColor: AppColors.searchFormFieldBorderColor,
          focusColor: AppColors.searchFormFieldBorderColor,
          filledColor: AppColors.searchFormFieldColor,
          prefixIcon: SvgPicture.asset(
            ImageAssets.locationPin,
            width: 16.r,
            height: 16.r,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
