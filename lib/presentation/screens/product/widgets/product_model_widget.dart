part of 'widgets.dart';

class ProductModelWidget extends StatelessWidget {
  const ProductModelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SimpleText(
          '${AppStrings.modelName.tr(context: context)} : 2022',
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 15.sp,
        ),
        SimpleText(
          '2023/01/1',
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 9.sp,
        ),
      ],
    );
  }
}
