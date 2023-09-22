part of 'widgets.dart';

class AddYourProductAppBar extends StatelessWidget {
  const AddYourProductAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(),
        Column(
          children: [
            SimpleText(
              AppStrings.addYourProduct.tr(context: context),
              textStyle: TextStyleEnum.poppinsMedium,
              fontSize: 18.sp,
            ),
            SizedBox(height: 7.h),
            SimpleText(
              AppStrings.addSomeInformation.tr(context: context),
              textStyle: TextStyleEnum.poppinsLight,
              fontSize: 12.sp,
              color: AppColors.grey3,
            ),
          ],
        ),
        InkWell(
          onTap: () {
            context.router.pop();
          },
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: SvgPicture.asset(
              ImageAssets.close,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }
}
