part of 'widgets.dart';

class ProfileUserLocation extends StatelessWidget {
  const ProfileUserLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.zero,
      tilePadding: EdgeInsets.zero,
      title: Row(
        children: [
          Image.asset(
            ImageAssets.locationPin,
            width: 15.r,
            height: 15.r,
          ),
          SizedBox(width: 2.w),
          SimpleText(
            'Of Cairo',
            textStyle: TextStyleEnum.poppinsMedium,
            fontSize: 15.sp,
            color: AppColors.grey3,
          ),
        ],
      ),
      children: [
        SizedBox(
          height: 148,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: const CachedImage(
              url:
                  'https://upload.wikimedia.org/wikipedia/commons/b/b5/TahrirSQ-2020%281%29.jpg',
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
