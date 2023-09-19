part of 'widgets.dart';

class IDCardImage extends StatelessWidget {
  final File image;
  final VoidCallback onRemove;
  const IDCardImage({
    super.key,
    required this.image,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 8.0,
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: SvgPicture.asset(ImageAssets.topLeftCorner),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: SvgPicture.asset(ImageAssets.topRightCorner),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: SvgPicture.asset(ImageAssets.bottomLeftCorner),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: SvgPicture.asset(ImageAssets.bottomRightCorner),
          ),
          Padding(
            padding: EdgeInsets.all(35.r),
            child: Image.file(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: -10,
            left: -10,
            child: CloseButton(
              onPressed: onRemove,
              color: AppColors.red,
            ),
          )
        ],
      ),
    );
  }
}
