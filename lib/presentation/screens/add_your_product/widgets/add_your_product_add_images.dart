part of 'widgets.dart';

class AddYourProductAddImages extends StatelessWidget {
  const AddYourProductAddImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 65.h),
          SimpleText(
            AppStrings.addArabicPhotos.tr(context: context),
            textStyle: TextStyleEnum.poppinsMedium,
            fontSize: 18.sp,
          ),
          SizedBox(height: 12.h),
          SimpleText(
            AppStrings.addClearImages.tr(context: context),
            textStyle: TextStyleEnum.poppinsLight,
            fontSize: 12.sp,
            color: AppColors.grey3,
          ),
          SizedBox(height: 23.h),
          const SelectionOfImagesContainer(),
          const Spacer(),
          MyElevatedButton(
            height: 50.h,
            title: AppStrings.next.tr(context: context),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
