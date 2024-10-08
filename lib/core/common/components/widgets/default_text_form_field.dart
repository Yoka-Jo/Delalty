import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/theme/app_theme.dart';

class DefaultTextFormField extends StatefulWidget {
  final bool enabled;
  final String? initialValue;
  final String? hintTxt;
  final String? errorTxt;
  final TextAlign? textAlign;
  final bool borderIsEnabled;
  final bool marginIsEnabled;
  final TextInputType inputType;
  final bool isPassword;
  final double? radius;
  final double? hintSize;
  final bool readOnly;
  final String? Function(String?)? validationFunction;
  final dynamic Function(String)? onChangedFunction;
  final ValueChanged<String>? onFieldSubmitted;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final Widget? suffix;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? labelTxt;
  final bool expands;
  final TextEditingController? controller;
  final Color? unfocusColor;
  final Color? hintColor;
  final Color? focusColor;
  final Color? enableColor;
  final Color? filledColor;
  final bool filled;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode autovalidateMode;
  final TextInputAction textInputAction;
  final String? helperText;
  final EdgeInsets? padding;
  final TextDirection? hintTextDirection;
  final void Function(String?)? onSaved;

  const DefaultTextFormField({
    Key? key,
    this.hintTxt,
    this.onSaved,
    this.padding,
    this.errorTxt,
    this.hintTextDirection,
    this.enableColor,
    this.onFieldSubmitted,
    required this.inputType,
    this.borderIsEnabled = true,
    this.isPassword = false,
    this.readOnly = false,
    this.validationFunction,
    this.onChangedFunction,
    this.textAlign,
    this.initialValue,
    this.suffixIcon,
    this.radius,
    this.maxLength,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.enabled = true,
    this.maxLines,
    this.expands = false,
    this.labelTxt,
    this.prefix,
    this.unfocusColor,
    this.hintSize,
    this.hintColor,
    this.focusColor,
    this.suffix,
    this.filled = true,
    this.marginIsEnabled = true,
    this.filledColor,
    this.prefixIcon,
    this.controller,
    this.inputFormatters,
    required this.textInputAction,
    this.onEditingComplete,
    this.onTap,
    this.helperText,
  }) : super(key: key);

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  Widget _buildTextFormField() {
    final theme = AppTheme.of(context);
    return StatefulBuilder(
        builder: (context, setState) => TextFormField(
              onSaved: widget.onSaved,
              textAlign: widget.textAlign ?? TextAlign.start,
              onFieldSubmitted: widget.onFieldSubmitted,
              onEditingComplete: widget.onEditingComplete,
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              textInputAction: widget.textInputAction,
              autovalidateMode: widget.autovalidateMode,
              inputFormatters: widget.inputFormatters,
              expands: widget.expands,
              cursorColor: AppColors.primaryColor,
              controller: widget.controller,
              enabled: widget.enabled,
              maxLines: widget.isPassword ? 1 : widget.maxLines,
              maxLength: widget.maxLength,
              initialValue: widget.initialValue,
              style: theme.formFieldTextStyle,
              decoration: theme
                  .inputDecoration(
                    context,
                    radius: widget.radius,
                    enableColor: widget.enableColor,
                    padding: widget.padding,
                    focusBorderColor: widget.focusColor,
                    hintSize: widget.hintSize,
                    hintColor: widget.hintColor ?? AppColors.hintColor,
                    isFilled: widget.filled ? true : false,
                    fillColor: widget.filledColor,
                    suffixWidget: widget.suffix,
                    suffixIcon: widget.suffixIcon,
                    prefixWidget: widget.prefix,
                    prefixIcon: widget.prefixIcon,
                    hint: widget.hintTxt,
                    label: widget.labelTxt,
                    error: widget.errorTxt,
                  )
                  .copyWith(
                    border: widget.borderIsEnabled ? null : InputBorder.none,
                    errorBorder:
                        widget.borderIsEnabled ? null : InputBorder.none,
                    enabledBorder:
                        widget.borderIsEnabled ? null : InputBorder.none,
                    focusedBorder:
                        widget.borderIsEnabled ? null : InputBorder.none,
                    focusedErrorBorder:
                        widget.borderIsEnabled ? null : InputBorder.none,
                    hintTextDirection: widget.hintTextDirection,
                  ),
              keyboardType: widget.inputType,
              obscureText: widget.isPassword,
              validator: widget.validationFunction,
              onChanged: widget.onChangedFunction,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 0),
        child: _buildTextFormField());
  }
}
