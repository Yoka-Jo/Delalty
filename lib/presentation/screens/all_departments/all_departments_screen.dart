import 'package:auto_route/annotations.dart';
import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:delalty/core/resources/assets_manager.dart';
import 'package:delalty/core/resources/colors_manager.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:delalty/di.dart';
import 'package:delalty/presentation/screens/all_departments/cubit/all_departments_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/components/widgets/appbar_widget.dart';
import '../../../core/common/components/widgets/default_text_form_field.dart';
import '../../../core/common/components/widgets/form_fields_icons/search_icon.dart';

@RoutePage()
class AllDepartmentsScreen extends StatelessWidget {
  const AllDepartmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AllDepartmentsCubit>(),
      child: Scaffold(
        appBar: const AppBarWidget(
          title: AppStrings.allDepartments,
          iconColor: AppColors.grey3,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
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
              SizedBox(height: 33.h),
              BlocBuilder<AllDepartmentsCubit, AllDepartmentsState>(
                builder: (context, state) {
                  final cubit = AllDepartmentsCubit.get(context);
                  return Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 56.w,
                        mainAxisExtent: 80.h,
                        crossAxisSpacing: 80.w,
                        mainAxisSpacing: 36.h,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            cubit.changeSelectedDepartment('Vehicles');
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 56.w,
                                height: 52.h,
                                decoration: BoxDecoration(
                                  color: cubit.selectedDepartment == 'Vehicles'
                                      ? AppColors.primaryColor
                                      : AppColors.grey7,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    ImageAssets.vehicles,
                                    height: 30.r,
                                    width: 30.r,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                              SimpleText(
                                'Vehicles',
                                textStyle: TextStyleEnum.poppinsRegular,
                                fontSize: 12.sp,
                                color: cubit.selectedDepartment == 'Vehicles'
                                    ? AppColors.primaryColor
                                    : Colors.black,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
