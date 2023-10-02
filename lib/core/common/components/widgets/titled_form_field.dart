import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'default_text_form_field.dart';
import 'simple_text.dart';

class TitledFormField extends StatelessWidget {
  final String title;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final String hint;
  final String? error;
  final double? hintSize;
  final dynamic Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validationFunction;

  const TitledFormField({
    Key? key,
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
    this.hintSize,
    this.error,
    required this.hint,
    this.onChanged,
    this.onSaved,
    this.validationFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(
          title,
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 15.sp,
        ),
        SizedBox(height: 10.h),
        DefaultTextFormField(
          initialValue: initialValue,
          inputType: TextInputType.text,
          radius: 8.r,
          textInputAction: TextInputAction.next,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintTxt: hint,
          hintSize: hintSize,
          errorTxt: error?.tr(context: context),
          onSaved: onSaved,
          validationFunction: validationFunction,
          onChangedFunction: onChanged,
        ),
      ],
    );
  }
}
