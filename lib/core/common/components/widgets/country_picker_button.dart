// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delalty/core/common/components/widgets/simple_text.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/text/styles_manager.dart';
import '../../../resources/theme/app_theme.dart';

class CountryPickerButton extends StatefulWidget {
  final void Function(String country) onSelectedCountryChange;
  final String? country;
  const CountryPickerButton({
    Key? key,
    required this.onSelectedCountryChange,
    this.country,
  }) : super(key: key);

  @override
  State<CountryPickerButton> createState() => _CountryPickerButtonState();
}

class _CountryPickerButtonState extends State<CountryPickerButton> {
  String country = 'Egypt';
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          AppStrings.country,
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 15.sp,
        ),
        SizedBox(height: 10.h),
        InkWell(
          onTap: () {
            showCountryPicker(
              context: context,
              countryListTheme: CountryListThemeData(
                flagSize: 25.r,
                backgroundColor: Colors.white,
                textStyle: getSemiBoldStyle(
                  family: FontFamilies.poppins,
                  fontSize: 12.sp,
                ),
                bottomSheetHeight: MediaQuery.sizeOf(context).height * 2 / 3,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                //Optional. Styles the search field.
                inputDecoration: theme.inputDecoration(
                  context,
                  hint: AppStrings.enterCountryName,
                  hintSize: 12.sp,
                  hintColor: AppColors.grey3,
                ),
              ),
              onSelect: (Country country) {
                widget.onSelectedCountryChange(country.name);
                setState(() {
                  this.country = country.name;
                });
              },
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppColors.fromFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(8.r)),
            child: Row(
              children: [
                SimpleText(
                  widget.country ?? country,
                  textStyle: TextStyleEnum.poppinsMedium,
                  fontSize: 15.sp,
                ),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.grey3,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
