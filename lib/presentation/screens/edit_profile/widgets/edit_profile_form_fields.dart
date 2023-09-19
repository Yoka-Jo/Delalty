part of 'widgets.dart';

class EditProfileFormFields extends StatelessWidget {
  const EditProfileFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitledFormField(
          title: AppStrings.fullName.tr(context: context),
          prefixIcon: const UserIcon(),
          hint: 'Ahmed Mustafa',
          onChanged: (p0) {},
        ),
        SizedBox(height: 20.h),
        TitledFormField(
          title: AppStrings.dateOfBirth.tr(context: context),
          prefixIcon: const CalendarIcon(),
          hint: '10  September 1998',
          onChanged: (p0) {},
        ),
        SizedBox(height: 20.h),
        TitledFormField(
          title: AppStrings.number.tr(context: context),
          prefixIcon: const PhoneIcon(),
          suffixIcon: const PhoneVerifiedIcon(),
          hint: '012345666655',
          onChanged: (p0) {},
        ),
        SizedBox(height: 20.h),
        TitledFormField(
          title: AppStrings.email.tr(context: context),
          prefixIcon: const MailIcon(),
          hint: AppStrings.enterYourEmail.tr(context: context),
          onChanged: (p0) {},
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
