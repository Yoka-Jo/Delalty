part of 'widgets.dart';

class PersonalProfileImages extends StatelessWidget {
  const PersonalProfileImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: Stack(
        children: [
          CachedImage(
            url:
                'https://images.pexels.com/photos/707046/pexels-photo-707046.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            height: 250.h,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Container(
            margin: EdgeInsets.only(left: 35.w),
            alignment: Alignment.bottomLeft,
            child: UserImage(
              image: AppCubit.get(context).user.image,
            ),
          )
        ],
      ),
    );
  }
}
