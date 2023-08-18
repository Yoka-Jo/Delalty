part of 'widgets.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileTabs();

    return Column(
      children: [
        SizedBox(
          height: 280.h,
          child: Stack(
            children: [
              Image.network(
                'https://images.pexels.com/photos/707046/pexels-photo-707046.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                height: 250.h,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Row(
                    children: [
                      const BackIconWidget(),
                      const Spacer(),
                      SvgPicture.asset(ImageAssets.more)
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 35.w),
                alignment: Alignment.bottomLeft,
                child: const UserImage(
                  image:
                      'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const ProfileData(),
              SizedBox(height: 35.h),
              const ProfileTabs(),
            ],
          ),
        ),
      ],
    );
  }
}
