part of 'widgets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            context.router.push(const NotificationsRoute());
          },
          child: SvgPicture.asset(
            ImageAssets.bell,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            SimpleText(
              AppStrings.location,
              textStyle: TextStyleEnum.poppinsRegular,
              fontSize: 10.sp,
              color: Colors.white,
            ),
            Row(
              children: [
                Image.asset(
                  ImageAssets.locationPin,
                  fit: BoxFit.cover,
                  color: Colors.white,
                  width: 12.w,
                  height: 15.h,
                ),
                SizedBox(width: 5.w),
                SimpleText(
                  'Egypt',
                  textStyle: TextStyleEnum.montserratMedium,
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
        Container(
          padding: EdgeInsets.all(2.r),
          height: 45.h,
          width: 45.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45.r),
            child: Image.network(
              'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
