// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:delalty/app/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/components/widgets/appbar_widget.dart';
import '../../../core/common/components/widgets/category_widget.dart';
import '../../../core/common/components/widgets/centered_circular_progress_indicator.dart';
import '../../../core/common/components/widgets/default_text_form_field.dart';
import '../../../core/common/components/widgets/form_fields_icons/search_icon.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/routes/app_router.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../domain/entities/category.dart';

@RoutePage()
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late final ScrollController controller;
  int page = 1;
  int itemsNumber = 10;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    searchedCategories = widget.categories;
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  late List<Category> searchedCategories;

  void searchForCategory(String name) {
    if (name.isEmpty) {
      searchedCategories = widget.categories;
    }
    setState(() {
      searchedCategories = widget.categories
          .where((element) =>
              element.name.toLowerCase().contains(name.trim().toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.exploreCategories.tr(context: context),
        iconColor: AppColors.grey3,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            DefaultTextFormField(
              inputType: TextInputType.text,
              enableColor: AppColors.searchFormFieldBorderColor,
              focusColor: AppColors.searchFormFieldBorderColor,
              textInputAction: TextInputAction.done,
              filledColor: AppColors.searchFormFieldColor,
              hintTxt: AppStrings.search.tr(context: context),
              prefixIcon: const SearchIcon(),
              onChangedFunction: searchForCategory,
            ),
            SizedBox(height: 17.h),
            Expanded(
              child: GridView.count(
                controller: controller,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 12.h,
                crossAxisCount: 2,
                shrinkWrap: true,
                children: List.generate(
                  (page * itemsNumber > searchedCategories.length
                      ? searchedCategories.length
                      : page * itemsNumber),
                  (index) {
                    final category = searchedCategories[index];
                    return InkWell(
                      onTap: () {
                        context.router.push(
                          ViewProductSectionRoute(
                            category: category,
                            isRealEstate: false,
                          ),
                        );
                      },
                      child: CategoryWidget(
                        image: category.image,
                        title: category.name,
                      ),
                    );
                  },
                ),
              ),
            ),
            if (isLoading) ...[
              SizedBox(height: 30.h),
              const CenteredCircularProgressIndicaotr(),
              SizedBox(height: 30.h),
            ]
          ],
        ),
      ),
    );
  }
}
