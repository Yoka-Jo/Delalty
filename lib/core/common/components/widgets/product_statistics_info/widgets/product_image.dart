// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class ProductImage extends StatelessWidget {
  final String image;
  const ProductImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 107.h,
      width: 125.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.r),
        child: CashedImageWidget(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
