part of 'widgets.dart';

class ConversationRejectOrAcceptContact extends StatelessWidget {
  const ConversationRejectOrAcceptContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.r),
          topLeft: Radius.circular(25.r),
        ),
        border: Border(
          top: BorderSide(
            width: 1,
            color: AppColors.black25,
          ),
          bottom: BorderSide(
            width: 0,
            color: AppColors.black25,
          ),
          right: BorderSide(
            width: 0,
            color: AppColors.black25,
          ),
          left: BorderSide(
            width: 0,
            color: AppColors.black25,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            SizedBox(height: 25.h),
            SizedBox(
              width: 290.w,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Sabri Al-Mouldi ',
                  style: getSemiBoldStyle(
                    color: AppColors.grey3,
                    family: FontFamilies.alexandria,
                    fontSize: 13.sp,
                  ),
                  children: [
                    TextSpan(
                      text:
                          '${AppStrings.wouldLikeToContact.tr(context: context)} MGEHS2022 1.5 A.T Luxury Black Interior',
                      style: getRegularStyle(
                        color: AppColors.grey3,
                        family: FontFamilies.alexandria,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 35.h),
            Row(
              children: [
                Expanded(
                  child: MyElevatedButton(
                    height: 35.h,
                    title: AppStrings.reject.tr(context: context),
                    textStyle: TextStyleEnum.alexandriaRegular,
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 28.w),
                Expanded(
                  child: MyElevatedButton(
                    height: 35.h,
                    title: AppStrings.accept.tr(context: context),
                    textStyle: TextStyleEnum.alexandriaRegular,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 48.h),
          ],
        ),
      ),
    );
  }
}
