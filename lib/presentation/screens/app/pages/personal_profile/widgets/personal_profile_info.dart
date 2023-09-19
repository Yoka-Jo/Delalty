part of 'widgets.dart';

class PersonalProfileInfo extends StatelessWidget {
  const PersonalProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        children: [
          const SizedBox(width: double.infinity),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SimpleText(
                    'Ahmed Mustafa',
                    textStyle: TextStyleEnum.poppinsMedium,
                    fontSize: 18.sp,
                    textAlign: TextAlign.right,
                  ),
                  SimpleText(
                    'Member since 2020',
                    textStyle: TextStyleEnum.poppinsRegular,
                    fontSize: 13.sp,
                    color: AppColors.grey3,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              Container(
                width: 28.w,
                height: 40.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: AppColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: SvgPicture.asset(
                  ImageAssets.more,
                  color: AppColors.primaryColor,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(width: 10.h),
              Expanded(
                child: MyElevatedButton(
                  title: AppStrings.profileModification.tr(context: context),
                  icon: ImageAssets.userEdit,
                  onPressed: () {
                    context.router.push(const EditProfileRoute());
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
