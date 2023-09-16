part of 'widgets.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BuildCarousel(
      images: ProductCubit.get(context)
          .product
          .images
          .map((e) => '${Constants.productImagePath}${e.id}.${e.extension}')
          .toList(),
      numberOfImagesMargin:
          EdgeInsets.symmetric(vertical: 70.h, horizontal: 20.w),
      showFavouriteButton: false,
      height: 370.h,
    );
  }
}
