part of 'widgets.dart';

class AccountVerificationFormFields extends StatelessWidget {
  const AccountVerificationFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitledFormField(
          title: AppStrings.fullName,
          hint: AppStrings.enterYourTripleName,
          hintSize: 12.sp,
        ),
        SizedBox(height: 20.h),
        TitledFormField(
          title: AppStrings.email,
          hint: AppStrings.enterYourEmail,
          hintSize: 10.sp,
        ),
        SizedBox(height: 20.h),
        TitledFormField(
          title: AppStrings.number,
          hint: AppStrings.enterThePhone,
          hintSize: 10.sp,
        ),
        SizedBox(height: 20.h),
        TitledFormField(
          title: AppStrings.address,
          hint: AppStrings.enterTheAddress,
          hintSize: 10.sp,
        ),
        SizedBox(height: 20.h),
        CountryPickerButton(
          onSelectedCountryChange: (country) {},
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: true,
              activeColor: AppColors.checkBoxColor,
              onChanged: (value) {},
            ),
            SimpleText(
              AppStrings.termsAndConditions,
              textStyle: TextStyleEnum.poppinsMedium,
              fontSize: 12.sp,
              color: AppColors.primaryColor,
            )
          ],
        ),
        SizedBox(height: 40.h),
        MyElevatedButton(
          title: AppStrings.next,
          onPressed: () {},
          borderRadius: 5.r,
        ),
      ],
    );
  }
}
