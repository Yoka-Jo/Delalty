part of 'widgets.dart';

class ConversationAppBar extends StatelessWidget {
  const ConversationAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BackIconWidget(
            iconColor: Colors.white,
          ),
          UserImage(
            image: ConversationCubit.get(context)
                    .chat
                    .participants[1]
                    .user
                    ?.image ??
                '',
            borderColor: Colors.white,
            circleSize: 65.w,
            borderWidth: 1.5.r,
            iconWidget: Container(
              height: 15.r,
              width: 15.r,
              margin: EdgeInsets.only(right: 3.r, bottom: 3.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
                border: Border.all(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleText(
                ConversationCubit.get(context)
                        .chat
                        .participants[1]
                        .user
                        ?.name ??
                    '',
                textStyle: TextStyleEnum.poppinsMedium,
                fontSize: 18.sp,
                color: Colors.white,
              ),
              SimpleText(
                AppStrings.online,
                textStyle: TextStyleEnum.poppinsRegular,
                fontSize: 14.sp,
                color: Colors.white,
              ),
            ],
          ),
          const Spacer(),
          const ConversationMoreButton(),
        ],
      ),
    );
  }
}
