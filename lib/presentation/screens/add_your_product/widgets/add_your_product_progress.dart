// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class AddYourProductProgress extends StatelessWidget {
  const AddYourProductProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddYourProductCubit, AddYourProductState>(
      builder: (context, state) {
        final cubit = AddYourProductCubit.get(context);
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProgressIndicatorStep(
              title: AppStrings.photos.tr(context: context),
              isFinished: false,
            ),
            Expanded(
              child: Container(
                height: 22.h,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                padding: EdgeInsets.all(2.r),
                decoration: BoxDecoration(
                  color: AppColors.grey2,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(width: 1, color: AppColors.black10),
                ),
                child: LinearPercentIndicator(
                  isRTL: context.locale != arabicLocal,
                  lineHeight: 22.h,
                  padding: EdgeInsets.zero,
                  barRadius: Radius.circular(10.r),
                  percent: cubit.finishedAddingProductDetails ? 0.7 : 0.2,
                  animation: true,
                  animationDuration: 1000,
                  progressColor: AppColors.primaryColor,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            _ProgressIndicatorStep(
              title: AppStrings.communication.tr(context: context),
              isFinished: cubit.finishedAddingProductDetails,
            ),
          ],
        );
      },
    );
  }
}

class _ProgressIndicatorStep extends StatelessWidget {
  final String title;
  final bool isFinished;
  const _ProgressIndicatorStep({
    Key? key,
    required this.title,
    required this.isFinished,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 24.r,
          height: 24.r,
          decoration: BoxDecoration(
            color: isFinished ? AppColors.primaryColor : Colors.white,
            border: Border.all(width: 2, color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Center(
            child: Icon(
              Icons.check,
              size: 18.r,
              color: isFinished ? Colors.white : AppColors.primaryColor,
            ),
          ),
        ),
        SizedBox(height: 6.h),
        SimpleText(
          title,
          textStyle: TextStyleEnum.poppinsLight,
          fontSize: 10.sp,
          color: AppColors.grey3,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
