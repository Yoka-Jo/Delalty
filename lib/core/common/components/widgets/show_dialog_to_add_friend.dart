import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/strings_manager.dart';

Future<void> showDialogForAddingFriend(
    BuildContext context, Future Function() onOk) async {
  showAdaptiveDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog.adaptive(
      title: SimpleText(
        AppStrings.sendFriedRequest.tr(context: context),
        textStyle: TextStyleEnum.montserratBold,
        fontSize: 18.sp,
      ),
      content: SimpleText(
        AppStrings.doYouWantToAddThisUserAsFriend.tr(context: context),
        textStyle: TextStyleEnum.montserratMedium,
        fontSize: 15.sp,
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await onOk();
            if (context.mounted) {
              context.router.pop();
            }
          },
          child: SimpleText(
            AppStrings.yes.tr(context: context),
            textStyle: TextStyleEnum.montserratBold,
            color: AppColors.primaryColor,
            fontSize: 18.sp,
          ),
        ),
        TextButton(
          onPressed: () => context.router.pop(),
          child: SimpleText(
            AppStrings.no.tr(context: context),
            textStyle: TextStyleEnum.montserratBold,
            color: AppColors.red,
            fontSize: 18.sp,
          ),
        ),
      ],
    ),
  );
}
