part of 'widgets.dart';

class ProductMoreButton extends StatelessWidget {
  const ProductMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.h),
      child: InkWell(
        onTap: () async {
          await buildBottomSheet(context);
        },
        child: const Icon(
          Icons.more_horiz,
          color: AppColors.grey3,
        ),
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
                title: AppStrings.amendment.tr(context: context),
                icon: ImageAssets.edit,
                onTap: () {},
              ),
              SizedBox(height: 30.h),
              BottomSheetElementWidget(
                title: AppStrings.sold.tr(context: context),
                icon: ImageAssets.sold,
                onTap: () {},
              ),
              SizedBox(height: 30.h),
              BottomSheetElementWidget(
                title: AppStrings.statisticsAdvertising.tr(context: context),
                icon: ImageAssets.chart,
                onTap: () {},
              ),
              SizedBox(height: 30.h),
              BottomSheetElementWidget(
                title: AppStrings.stopAdvertising.tr(context: context),
                icon: ImageAssets.stop,
                onTap: () {},
              ),
              SizedBox(height: 30.h),
              BottomSheetElementWidget(
                title: AppStrings.deleteTheAd.tr(context: context),
                titleColor: AppColors.red,
                backgroundColor: AppColors.red,
                icon: ImageAssets.trash,
                titleStyle: TextStyleEnum.poppinsMedium,
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
