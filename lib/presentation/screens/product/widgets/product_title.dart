part of 'widgets.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleText(
      ProductCubit.get(context).product.title,
      textStyle: TextStyleEnum.poppinsMedium,
      fontSize: 15.sp,
    );
  }
}
