part of 'widgets.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ProductImages(),
          ProductAppBar(),
          ProductContainer(),
        ],
      ),
    );
  }
}
