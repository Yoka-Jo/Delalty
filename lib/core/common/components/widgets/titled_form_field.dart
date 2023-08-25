import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'default_text_form_field.dart';
import 'simple_text.dart';

class TitledFormField extends StatelessWidget {
  final String title;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hint;
  final double? hintSize;
  const TitledFormField({
    Key? key,
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.hintSize,
    required this.hint,
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
          inputType: TextInputType.text,
          radius: 8.r,
          textInputAction: TextInputAction.next,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintTxt: hint,
          hintSize: hintSize,
        ),
      ],
    );
  }
}
