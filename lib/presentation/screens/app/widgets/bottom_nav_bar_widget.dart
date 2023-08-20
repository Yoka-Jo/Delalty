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
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 16.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BottomNavIconWidget(
                            title: AppStrings.more,
                            icon: ImageAssets.moreNav,
                            onTap: () => onTap(0),
                            isSelected: index == 0,
                          ),
                          SizedBox(width: 40.w),
                          BottomNavIconWidget(
                            title: AppStrings.chat,
                            icon: ImageAssets.chatNav,
                            onTap: () => onTap(1),
                            isSelected: index == 1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          BottomNavIconWidget(
                            title: AppStrings.myAccount,
                            icon: ImageAssets.profileNav,
                            onTap: () => onTap(3),
                            isSelected: index == 3,
                          ),
                          SizedBox(width: 30.w),
                          BottomNavIconWidget(
                            title: AppStrings.home,
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
                  padding: EdgeInsets.only(top: 42.h),
                  child: SimpleText(
                    AppStrings.addProduct,
                    textStyle: index == 2
                        ? TextStyleEnum.poppinsSemiBold
                        : TextStyleEnum.poppinsMedium,
                    fontSize: index == 2 ? 10.sp : 8.sp,
                    color:
                        index == 2 ? AppColors.primaryColor : AppColors.grey3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
