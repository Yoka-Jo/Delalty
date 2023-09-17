part of 'widgets.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          SizedBox(width: 10.w),
          const BackIconWidget(),
          const Spacer(),
          IconButton(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerRight,
            onPressed: () async => await buildBottomSheet(context),
            icon: SvgPicture.asset(ImageAssets.more),
          ),
          if (ChangeLanguageCubit.get(context).isEnglish) SizedBox(width: 15.w),
        ],
      ),
    );
  }

  Future buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.grey2,
      builder: (context) => Padding(
          padding: EdgeInsets.all(30.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BottomSheetElementWidget(
                title: context.tr(AppStrings.sharingProfile),
                icon: ImageAssets.share,
                onTap: () {},
              ),
              SizedBox(height: 30.h),
              BottomSheetElementWidget(
                title: context.tr(AppStrings.reportThisUser),
                icon: ImageAssets.userReport,
                onTap: () {},
              ),
              SizedBox(height: 30.h),
              BottomSheetElementWidget(
                title: context.tr(AppStrings.blockUser),
                icon: ImageAssets.userBlock,
                onTap: () {},
              ),
            ],
          )),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            20.r,
          ),
          topLeft: Radius.circular(
            20.r,
          ),
        ),
      ),
    );
  }
}
