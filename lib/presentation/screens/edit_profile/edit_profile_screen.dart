// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/annotations.dart';
import 'package:delalty/core/common/components/widgets/my_elevated_button.dart';
import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delalty/core/common/components/widgets/appbar_widget.dart';
import 'package:delalty/core/resources/colors_manager.dart';
import 'package:delalty/core/resources/strings_manager.dart';

import 'widgets/widgets.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.editProfile.tr(context: context),
        iconColor: AppColors.grey3,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250.h,
              child: const Stack(
                children: [
                  EditProfileBackgroundImage(),
                  EditProfileUserImage()
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
              child: Column(
                children: [
                  const EditProfileFormFields(),
                  SizedBox(height: 20.h),
                  MyElevatedButton(
                    title: AppStrings.save.tr(context: context),
                    onPressed: () {},
                    textStyle: TextStyleEnum.poppinsSemiBold,
                    height: 50.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
