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
          BlocBuilder<SellerProfileCubit, SellerProfileState>(
            builder: (context, state) {
              final cubit = SellerProfileCubit.get(context);

              final isLoading = SellerProfileCubit.get(context).user == null;
              return FittedBox(
                child: Align(
                  alignment: ChangeLanguageCubit.get(context).isEnglish
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: isLoading
                        ? null
                        : () async => await buildBottomSheet(context, cubit),
                    icon: Center(child: SvgPicture.asset(ImageAssets.more)),
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }

  Future buildBottomSheet(
      BuildContext parentContext, SellerProfileCubit cubit) {
    return showModalBottomSheet(
      context: parentContext,
      backgroundColor: AppColors.grey2,
      builder: (context) {
        return Padding(
            padding: EdgeInsets.all(30.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BottomSheetElementWidget(
                  title: context.tr(AppStrings.sharingProfile),
                  icon: ImageAssets.share,
                  onTap: () async {
                    final dynamicLinkService = DynamicLinkService();
                    final path =
                        await dynamicLinkService.generateDynamicLinkUrl(
                      path: '/profile/${cubit.user!.id}',
                    );
                    log(path);
                    shareLink(path);
                  },
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
                  onTap: () async {
                    context.router.pop();
                    await cubit.blockSeller();
                  },
                ),
              ],
            ));
      },
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
