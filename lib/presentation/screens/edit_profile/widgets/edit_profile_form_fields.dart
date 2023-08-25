part of 'widgets.dart';

class EditProfileFormFields extends StatelessWidget {
  const EditProfileFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitledFormField(
          title: AppStrings.fullName,
          prefixIcon: UserIcon(),
          hint: 'Ahmed Mustafa',
        ),
        SizedBox(height: 20.h),
        const TitledFormField(
          title: AppStrings.dateOfBirth,
          prefixIcon: CalendarIcon(),
          hint: '10  September 1998',
        ),
        SizedBox(height: 20.h),
        const TitledFormField(
          title: AppStrings.number,
          prefixIcon: PhoneIcon(),
          suffixIcon: PhoneVerifiedIcon(),
          hint: '012345666655',
        ),
        SizedBox(height: 20.h),
        const TitledFormField(
          title: AppStrings.email,
          prefixIcon: MailIcon(),
          hint: AppStrings.enterYourEmail,
        ),
        SizedBox(height: 20.h),
        //Todo: Add Country Form Field
        CountryPickerButton(
          onSelectedCountryChange: (country) {},
        )
      ],
    );
  }
}
