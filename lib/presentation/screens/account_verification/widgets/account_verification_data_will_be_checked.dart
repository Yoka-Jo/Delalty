part of 'widgets.dart';

class AccountVerificationDataWillBeChecked extends StatelessWidget {
  const AccountVerificationDataWillBeChecked({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height / 10),
          Image.asset(ImageAssets.checkingDocument),
          SizedBox(height: 13.h),
          SimpleText(
            AppStrings.dataWillBeChecked.tr(context: context),
            textStyle: TextStyleEnum.poppinsLight,
            fontSize: 15.sp,
            color: AppColors.grey3,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
