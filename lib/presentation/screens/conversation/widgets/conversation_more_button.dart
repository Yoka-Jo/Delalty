part of 'widgets.dart';

class ConversationMoreButton extends StatelessWidget {
  const ConversationMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
      ),
      padding: EdgeInsets.only(top: 10.h),
      icon: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.identity()..rotateZ(pi / 2),
        child: SvgPicture.asset(
          ImageAssets.more,
          color: Colors.white,
        ),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Row(
              children: [
                SvgPicture.asset(
                  ImageAssets.userBlock,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: 10.w),
                SimpleText(
                  AppStrings.blockUser.tr(context: context),
                  textStyle: TextStyleEnum.poppinsMedium,
                  fontSize: 15.sp,
                ),
              ],
            ),
          ),
          PopupMenuItem(
            child: Row(
              children: [
                SvgPicture.asset(
                  ImageAssets.trash,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: 10.w),
                SimpleText(
                  AppStrings.deleteChat.tr(context: context),
                  textStyle: TextStyleEnum.poppinsMedium,
                  fontSize: 15.sp,
                ),
              ],
            ),
          ),
        ];
      },
    );
  }
}
