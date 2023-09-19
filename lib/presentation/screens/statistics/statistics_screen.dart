import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/common/components/widgets/appbar_widget.dart';
import 'package:delalty/core/resources/colors_manager.dart';
import 'package:delalty/core/resources/routes/app_router.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/components/widgets/default_text_form_field.dart';
import '../../../core/common/components/widgets/form_fields_icons/search_icon.dart';
import '../../../core/common/components/widgets/product_statistics_info/product_statistics_info_widget.dart';

@RoutePage()
class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.statistics.tr(context: context),
        iconColor: AppColors.grey3,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            DefaultTextFormField(
              inputType: TextInputType.text,
              enableColor: AppColors.searchFormFieldBorderColor,
              focusColor: AppColors.searchFormFieldBorderColor,
              textInputAction: TextInputAction.done,
              filledColor: AppColors.searchFormFieldColor,
              hintTxt: AppStrings.search.tr(context: context),
              prefixIcon: const SearchIcon(),
            ),
            SizedBox(height: 23.h),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.router.push(const ProductStatsRoute());
                    },
                    child: const ProductStatisticsInfo(
                      image:
                          'https://images.pexels.com/photos/2036544/pexels-photo-2036544.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      title: 'MGEHS2022 1.5 A.T Luxury Black interior',
                      price: '1,150,000',
                      location: 'Egypt . Cairo',
                      numberOfViews: 1000,
                      numberOfFavorites: 50,
                      numberOfMessages: 10,
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 13.h),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
