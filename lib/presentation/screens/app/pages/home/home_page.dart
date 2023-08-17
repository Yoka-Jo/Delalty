import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';
import 'widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      const HomeAppBar(),
                      SizedBox(height: 20.h),
                      const HomeFormField(),
                      SizedBox(height: 17.h),
                      const HomeCategories(),
                      SizedBox(height: 28.h),
                    ],
                  ),
                ),
                const HomeContainer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
