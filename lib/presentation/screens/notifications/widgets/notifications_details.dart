part of 'widgets.dart';

class NotificationsDetails extends StatelessWidget {
  const NotificationsDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          ImageAssets.message,
          color: Colors.white,
        ),
        SizedBox(width: 20.w),
        SizedBox(
          width: 283.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleText(
                AppStrings.newMessage,
                textStyle: TextStyleEnum.poppinsMedium,
                fontSize: 12.sp,
                color: Colors.white,
              ),
              SimpleText(
                "You have 3 new messages in the chat. Answer them now.",
                textStyle: TextStyleEnum.poppinsLight,
                fontSize: 11.sp,
                color: AppColors.grey2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
