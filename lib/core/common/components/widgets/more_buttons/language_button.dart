import 'package:delalty/core/resources/localization/cubit/change_language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:delalty/core/resources/colors_manager.dart';
import 'package:delalty/core/resources/localization/language_manager.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/components/widgets/simple_text.dart';
import '../../../../../../core/resources/assets_manager.dart';
import 'build_button.dart';
import 'radio_button_widget.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildButton(
      title: ChangeLanguageCubit.get(context).isEnglish
          ? AppStrings.english
          : AppStrings.arabic,
      subTitle: AppStrings.chooseTheLanguage,
      icon: ImageAssets.global,
      onTap: () => showAlertDialog(context),
    );
  }

  Future<void> showAlertDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.grey2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          title: SimpleText(
            AppStrings.language,
            textStyle: TextStyleEnum.poppinsMedium,
            fontSize: 18.sp,
            textAlign: TextAlign.center,
          ),
          content: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioButtonWidget(
                  title: AppStrings.english,
                  isSelected: context.locale == englishLocal,
                  onTap: () {
                    ChangeLanguageCubit.get(context)
                        .changeLanguage(context, isEnglish: true);
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 30.h),
                RadioButtonWidget(
                  title: AppStrings.arabic,
                  isSelected: context.locale == arabicLocal,
                  onTap: () {
                    ChangeLanguageCubit.get(context)
                        .changeLanguage(context, isEnglish: false);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
