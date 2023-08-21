// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delalty/core/common/components/widgets/appbar_widget.dart';
import 'package:delalty/core/common/components/widgets/product_card_widget.dart';
import 'package:delalty/core/resources/strings_manager.dart';

import '../../../core/common/components/widgets/default_text_form_field.dart';
import '../../../core/common/components/widgets/form_fields_icons/search_icon.dart';
import '../../../core/resources/colors_manager.dart';

@RoutePage()
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: AppStrings.favorite,
        iconColor: AppColors.grey3,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          children: [
            DefaultTextFormField(
              inputType: TextInputType.text,
              enableColor: AppColors.searchFormFieldBorderColor,
              focusColor: AppColors.searchFormFieldBorderColor,
              textInputAction: TextInputAction.done,
              filledColor: AppColors.searchFormFieldColor,
              hintTxt: AppStrings.search,
              prefixIcon: const SearchIcon(),
            ),
            SizedBox(height: 17.h),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return const ProductCardWidget(
                    isFavorite: true,
                    title: 'For sale villa with swimming pool in Sheikh Zayed',
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
