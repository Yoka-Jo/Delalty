part of 'widgets.dart';

class PropertyFilterSearchButton extends StatelessWidget {
  const PropertyFilterSearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyElevatedButton(
      verticalPadding: 20.h,
      titleSize: 15.sp,
      textStyle: TextStyleEnum.poppinsMedium,
      title: AppStrings.search,
      onPressed: () {},
    );
  }
}
