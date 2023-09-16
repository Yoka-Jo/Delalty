part of 'widgets.dart';

class ProductSellerImage extends StatelessWidget {
  final String image;
  const ProductSellerImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return UserImage(
      image: image,
    );
  }
}
