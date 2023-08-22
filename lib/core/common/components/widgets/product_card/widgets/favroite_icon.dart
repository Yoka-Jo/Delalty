part of 'widgets.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    required this.isFavorite,
  });

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: EdgeInsets.all(10.h),
        margin: EdgeInsets.all(5.h),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        child: isFavorite
            ? SvgPicture.asset(
                ImageAssets.favoriteFull,
              )
            : SvgPicture.asset(
                ImageAssets.favourite,
              ),
      ),
    );
  }
}
