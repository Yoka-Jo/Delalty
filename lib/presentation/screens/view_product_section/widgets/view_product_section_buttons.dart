part of 'widgets.dart';

class ViewProductSectionButtons extends StatelessWidget {
  const ViewProductSectionButtons({
    super.key,
  });

  void _showPopupMenu(BuildContext context, Offset offset) async {
    late RelativeRect position;
    if (ChangeLanguageCubit.get(context).isEnglish) {
      position = RelativeRect.fromLTRB(0, offset.dy, offset.dx, 0);
    } else {
      position = RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0);
    }
    await showMenu(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          value: 1,
          onTap: () =>
              ViewProductSectionCubit.get(context).arrangeProducts(true),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SimpleText(
                AppStrings.price.tr(context: context),
                textStyle: TextStyleEnum.montserratSemiBold,
                fontSize: 18.sp,
              ),
              const Icon(
                Icons.arrow_upward,
                color: AppColors.red,
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          height: 5.h,
          child: const Divider(
            color: AppColors.grey3,
          ),
        ),
        PopupMenuItem(
          value: 3,
          onTap: () =>
              ViewProductSectionCubit.get(context).arrangeProducts(false),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SimpleText(
                AppStrings.price.tr(context: context),
                textStyle: TextStyleEnum.montserratSemiBold,
                fontSize: 18.sp,
              ),
              const Icon(
                Icons.arrow_downward,
                color: AppColors.primaryColor,
              )
            ],
          ),
        ),
      ],
      elevation: 8.0,
    ).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTapDown: (details) {
              _showPopupMenu(context, details.globalPosition);
            },
            child: BuildOutlinedButton(
              title: AppStrings.arrangement.tr(context: context),
              icon: ImageAssets.arrangement,
              onPressed: null,
            ),
          ),
        ),
        SizedBox(width: 45.w),
        Expanded(
          child: BuildOutlinedButton(
            title: AppStrings.filter.tr(context: context),
            icon: ImageAssets.filter,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
