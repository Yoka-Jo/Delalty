// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class BottomNavBarWidget extends StatelessWidget {
  final void Function(int value) onTap;
  final int index;
  const BottomNavBarWidget({
    Key? key,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
        builder: (context, state) {
      return Container(
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
          child: BottomAppBar(
            height: 75.h,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.black.withOpacity(0.15),
                ),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.r),
                    topLeft: Radius.circular(15.r)),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 14.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            BottomNavIconWidget(
                              title: AppStrings.more.tr(context: context),
                              icon: ImageAssets.moreNav,
                              onTap: () => onTap(0),
                              isSelected: index == 0,
                            ),
                            SizedBox(width: 40.w),
                            BottomNavIconWidget(
                              title: AppStrings.chat.tr(context: context),
                              icon: ImageAssets.chatNav,
                              onTap: () => onTap(1),
                              isSelected: index == 1,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            BottomNavIconWidget(
                              title: AppStrings.myAccount.tr(context: context),
                              icon: ImageAssets.profileNav,
                              onTap: () => onTap(3),
                              isSelected: index == 3,
                            ),
                            SizedBox(width: 30.w),
                            BottomNavIconWidget(
                              title: AppStrings.home.tr(context: context),
                              icon: ImageAssets.homeNav,
                              onTap: () => onTap(4),
                              isSelected: index == 4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: SimpleText(
                      AppStrings.addProduct.tr(context: context),
                      textStyle: TextStyleEnum.poppinsMedium,
                      fontSize: index == 2 ? 12.sp : 9.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
