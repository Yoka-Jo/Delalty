part of 'widgets.dart';

class SelectionOfImagesContainer extends StatelessWidget {
  const SelectionOfImagesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 40.h, bottom: 32.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          width: 1,
          color: AppColors.black15,
        ),
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            ImageAssets.gallery,
            width: 49.r,
            height: 49.r,
          ),
          SizedBox(height: 22.h),
          MyElevatedButton(
            height: 45.h,
            width: 173.w,
            title: AppStrings.selectionOfImages.tr(context: context),
            titleSize: 12.sp,
            textStyle: TextStyleEnum.poppinsLight,
            icon: ImageAssets.camera,
            iconColor: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 10.h),
          SimpleText(
            AppStrings.uploadPhotosUpTo.tr(context: context),
            textStyle: TextStyleEnum.poppinsRegular,
            fontSize: 12.sp,
            color: AppColors.grey3,
          ),
        ],
      ),
    );
  }
}
