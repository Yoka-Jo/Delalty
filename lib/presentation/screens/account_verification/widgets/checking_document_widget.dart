part of 'widgets.dart';

class CheckingDocumentWidget extends StatelessWidget {
  const CheckingDocumentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          Image.asset(ImageAssets.checkingDocument),
          SizedBox(height: 13.h),
          SimpleText(
            AppStrings.dataWillBeChecked,
            textStyle: TextStyleEnum.poppinsMedium,
            fontSize: 15.sp,
            color: AppColors.grey3,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
