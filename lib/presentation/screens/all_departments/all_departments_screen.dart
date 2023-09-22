// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:delalty/app/extensions.dart';
import 'package:delalty/core/common/components/widgets/centered_circular_progress_indicator.dart';
import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:delalty/core/resources/colors_manager.dart';
import 'package:delalty/core/resources/routes/app_router.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:delalty/di.dart';
import 'package:delalty/presentation/screens/all_departments/cubit/all_departments_cubit.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/components/widgets/appbar_widget.dart';
import '../../../core/common/components/widgets/cached_image.dart';
import '../../../core/common/components/widgets/default_text_form_field.dart';
import '../../../core/common/components/widgets/form_fields_icons/search_icon.dart';
import '../../../domain/entities/category.dart';
import '../app/pages/home/cubit/home_cubit.dart';

@RoutePage()
class AllDepartmentsScreen extends StatefulWidget {
  const AllDepartmentsScreen({
    Key? key,
    required this.homeCubit,
  }) : super(key: key);
  final HomeCubit homeCubit;

  @override
  State<AllDepartmentsScreen> createState() => _AllDepartmentsScreenState();
}

class _AllDepartmentsScreenState extends State<AllDepartmentsScreen> {
  late final ScrollController controller;
  int page = 1;
  int itemsNumber = 25;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.onScrollEndsListener(() {
      setState(() {
        isLoading = true;
      });
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          isLoading = false;
          page++;
        });
      });
    });
  }

  List<Category>? searchedCategories;

  void searchForCategory(String name, List<Category> categories) {
    if (name.isEmpty) {
      searchedCategories = categories;
    }
    setState(() {
      searchedCategories = categories
          .where((element) =>
              element.name.toLowerCase().contains(name.trim().toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AllDepartmentsCubit>(),
        ),
        BlocProvider.value(value: widget.homeCubit)
      ],
      child: Scaffold(
        appBar: AppBarWidget(
          title: AppStrings.allDepartments.tr(context: context),
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
                onChangedFunction: (value) =>
                    HomeCubit.get(context).categories == null
                        ? () {}
                        : searchForCategory(
                            value, HomeCubit.get(context).categories!),
                prefixIcon: const SearchIcon(),
              ),
              SizedBox(height: 33.h),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (HomeCubit.get(context).categories == null) {
                    return const Expanded(
                      child: CenteredCircularProgressIndicaotr(),
                    );
                  }
                  searchedCategories ??= HomeCubit.get(context).categories;
                  return BlocConsumer<AllDepartmentsCubit, AllDepartmentsState>(
                    listener: (context, state) {
                      if (state is ConfirmChoosenCategory) {
                        context.router.push(
                          AddYourProductRoute(
                            category: searchedCategories!.firstWhere(
                                (element) =>
                                    element.id ==
                                    AllDepartmentsCubit.get(context)
                                        .selectedDepartment),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      final cubit = AllDepartmentsCubit.get(context);
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: DynamicHeightGridView(
                            crossAxisCount: 3,
                            crossAxisSpacing: 70.w,
                            mainAxisSpacing: 30.h,
                            controller: controller,
                            itemCount:
                                (page * itemsNumber > searchedCategories!.length
                                    ? searchedCategories!.length
                                    : page * itemsNumber),
                            builder: (context, index) {
                              final category = searchedCategories![index];
                              return InkWell(
                                onTap: () {
                                  cubit.changeSelectedDepartment(category.id);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 52.h,
                                      decoration: BoxDecoration(
                                        color: cubit.selectedDepartment ==
                                                category.id
                                            ? AppColors.primaryColor
                                            : AppColors.grey7,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Center(
                                        child: CachedImage(
                                          url: category.image,
                                          height: 30.r,
                                          width: 30.r,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    SimpleText(
                                      category.name,
                                      textStyle: TextStyleEnum.poppinsRegular,
                                      fontSize: 12.sp,
                                      textAlign: TextAlign.center,
                                      color: cubit.selectedDepartment ==
                                              category.id
                                          ? AppColors.primaryColor
                                          : Colors.black,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              if (isLoading) ...[
                SizedBox(height: 30.h),
                const CenteredCircularProgressIndicaotr(),
                SizedBox(height: 30.h),
              ]
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
