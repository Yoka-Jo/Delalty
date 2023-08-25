part of 'widgets.dart';

class EditProfileBackgroundImage extends StatelessWidget {
  const EditProfileBackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          'https://images.pexels.com/photos/707046/pexels-photo-707046.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          height: 220.h,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Container(
          height: 50.r,
          width: 50.r,
          decoration: BoxDecoration(
            color: AppColors.black25,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            ImageAssets.camera,
            fit: BoxFit.scaleDown,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
