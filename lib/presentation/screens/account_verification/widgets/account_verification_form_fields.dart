part of 'widgets.dart';

class AccountVerificationFormFields extends StatelessWidget {
  const AccountVerificationFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountVerificationCubit, AccountVerificationState>(
      builder: (context, state) {
        final cubit = AccountVerificationCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitledFormField(
              initialValue: cubit.tripleName,
              title: AppStrings.fullName.tr(context: context),
              hint: AppStrings.enterYourTripleName.tr(context: context),
              hintSize: 12.sp,
              error: cubit.tripleNameError,
              onChanged: cubit.onFullNameChange,
            ),
            SizedBox(height: 20.h),
            TitledFormField(
              initialValue: cubit.email,
              title: AppStrings.email.tr(context: context),
              hint: AppStrings.enterYourEmail.tr(context: context),
              hintSize: 10.sp,
              error: cubit.emailError,
              onChanged: cubit.onEmailChange,
            ),
            SizedBox(height: 20.h),
            TitledFormField(
              initialValue: cubit.phoneNumber,
              title: AppStrings.number.tr(context: context),
              hint: AppStrings.enterThePhone.tr(context: context),
              hintSize: 10.sp,
              error: cubit.phoneNumberError,
              onChanged: cubit.onPhoneNumberChange,
            ),
            SizedBox(height: 20.h),
            TitledFormField(
              initialValue: cubit.address,
              title: AppStrings.address.tr(context: context),
              hint: AppStrings.enterTheAddress.tr(context: context),
              hintSize: 10.sp,
              error: cubit.addressError,
              onChanged: cubit.onAddressChange,
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
                  AppStrings.termsAndConditions.tr(context: context),
                  textStyle: TextStyleEnum.poppinsMedium,
                  fontSize: 12.sp,
                  color: AppColors.primaryColor,
                )
              ],
            ),
            SizedBox(height: 40.h),
            MyElevatedButton(
              title: AppStrings.next.tr(context: context),
              onPressed: () {
                cubit.next();
              },
              borderRadius: 5.r,
            ),
            SizedBox(height: 40.h),
          ],
        );
      },
    );
  }
}
