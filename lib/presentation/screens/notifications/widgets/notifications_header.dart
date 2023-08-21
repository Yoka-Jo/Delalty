part of 'widgets.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SimpleText(
          AppStrings.appName,
          textStyle: TextStyleEnum.montserratExtraBold,
          fontSize: 12.sp,
          color: Colors.white,
        ),
        SizedBox(width: 20.w),
        SimpleText(
          AppStrings.now,
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 9.sp,
          color: Colors.white,
        ),
        SvgPicture.asset(
          ImageAssets.bell,
          color: Colors.white,
          width: 12.w,
          height: 12.w,
        ),
        const Spacer(),
        CircleAvatar(
          radius: 14.h,
          backgroundColor: AppColors.lightBlack,
          child: Center(
            child: Icon(
              Icons.arrow_forward_ios,
              size: 12.h,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
