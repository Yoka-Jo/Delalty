part of 'widgets.dart';

class EditProfileUserImage extends StatelessWidget {
  const EditProfileUserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35.w),
      alignment: Alignment.bottomLeft,
      child: UserImage(
        image:
            'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        borderWidth: 0.0,
        isEdit: true,
        onImageWidget: Container(
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: SvgPicture.asset(
            ImageAssets.camera,
            height: 13.r,
            width: 13.r,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
