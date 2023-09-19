part of 'widgets.dart';

class ProvideApplicationDocumentationWidget extends StatelessWidget {
  const ProvideApplicationDocumentationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height / 10),
          Image.asset(ImageAssets.accountVerification),
          SizedBox(height: 13.h),
          SimpleText(
            AppStrings.applicationDocumentationCalculation.tr(context: context),
            textStyle: TextStyleEnum.poppinsLight,
            fontSize: 15.sp,
            color: AppColors.grey3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.h),
          MyElevatedButton(
            width: 170.w,
            borderRadius: 5.r,
            title: AppStrings.providing.tr(context: context),
            textStyle: TextStyleEnum.poppinsSemiBold,
            onPressed: () {
              AccountVerificationCubit.get(context)
                  .changeStep(AccountVerificationSteps.data);
            },
          ),
        ],
      ),
    );
  }
}
