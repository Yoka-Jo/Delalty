part of 'widgets.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleText(
      'MGEHS2022 1.5 A.T Luxury Black interior',
      textStyle: TextStyleEnum.poppinsMedium,
      fontSize: 15.sp,
    );
  }
}
